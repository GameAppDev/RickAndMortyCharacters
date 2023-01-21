//
//  CharacterListTableView.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

final class CharacterListTableView: NSObject {
    
    private let presenter: PCharacterListConnectorToPresenter?
    
    init(presenter: PCharacterListConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension CharacterListTableView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getCharacterList().count ?? 0)
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characterListCell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.className,
                                                                    for: indexPath) as? CharacterListTableViewCell
        else { return UITableViewCell() }

        if let characterList = presenter?.getCharacterList(),
           let character = characterList[safe: indexPath.row] {
            characterListCell.configureCell(with: character)
        }

        return characterListCell
    }
}
