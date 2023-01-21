//
//  CharacterListPresenter.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class CharacterListPresenter {
    
    private weak var view: PCharacterListPresenterToView?
    private var interactor: PCharacterListPresenterToInteractor?
    private var router: PCharacterListPresenterToRouter?
    
    init(view: PCharacterListPresenterToView,
         interactor: PCharacterListPresenterToInteractor,
         router: PCharacterListPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CharacterListPresenter: PCharacterListViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.showIndicatorView()
        interactor?.fetchData(request: "")
    }
    
    func viewWillAppear() { }
}

extension CharacterListPresenter: PCharacterListInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) {
        view?.hideIndicatorView()
        view?.reloadTableView()
    }
    
    func setError(error: BaseError) {
        view?.hideIndicatorView()
        view?.showAlert(message: error.errorMessage ?? "Try again")
    }
}

extension CharacterListPresenter: PCharacterListConnectorToPresenter {
    
    func getCharacterList() -> [Characters] {
        return interactor?.getCharacterList() ?? []
    }
}
