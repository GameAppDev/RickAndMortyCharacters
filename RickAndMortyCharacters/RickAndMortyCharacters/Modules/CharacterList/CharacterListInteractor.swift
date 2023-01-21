//
//  CharacterListInteractor.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class CharacterListInteractor {
    
    weak var presenter: PCharacterListInteractorToPresenter?

    private var characterList = [Characters]()
}

extension CharacterListInteractor: PCharacterListPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        let endPoint: String =  "character"
        NetworkManager().get(path: endPoint, nil, onSuccess: { [weak self] (response: BaseResponse<CharacterResponse>) in
            guard let self = self else { return }
            
            debugPrint("<--- Service gets response: \(self.characterList) - count: \(self.characterList.count) - path: \(endPoint) --->")
            self.characterList = response.model?.results ?? []
            self.presenter?.setData(data: self.characterList)
        }) { [weak self] (error) in
            guard let self = self else { return }

            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.setError(error: error)
        }
    }
    
    // MARK: - Get
    func getCharacterList() -> [Characters] {
        return self.characterList
    }
}
