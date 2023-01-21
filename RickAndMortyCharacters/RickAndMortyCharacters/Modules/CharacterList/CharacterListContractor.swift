//
//  CharacterListContractor.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

protocol PCharacterListPresenterToView: PresenterToView {
    func reloadTableView()
}

protocol PCharacterListViewToPresenter: ViewToPresenter { }

protocol PCharacterListPresenterToInteractor: PresenterToInteractor {
    func getCharacterList() -> [Characters]
}

protocol PCharacterListInteractorToPresenter: InteractorToPresenter { }

protocol PCharacterListPresenterToRouter: PresenterToRouter { }

protocol PCharacterListConnectorToPresenter: ConnectorToPresenter {
    func getCharacterList() -> [Characters]
}
