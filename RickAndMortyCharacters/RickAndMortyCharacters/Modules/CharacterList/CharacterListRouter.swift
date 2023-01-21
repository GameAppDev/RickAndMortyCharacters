//
//  CharacterListRouter.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

final class CharacterListRouter {
    
    public func returnVC() -> UIViewController {
        return CharacterListBuilder.buildModule()
    }
}

extension CharacterListRouter: PCharacterListPresenterToRouter { }

// MARK: - Builder
enum CharacterListBuilder {

    static func buildModule() -> UIViewController {
        let viewController = CharacterListViewController()
        let interactor = CharacterListInteractor()
        let router = CharacterListRouter()
        let presenter = CharacterListPresenter(view: viewController,
                                               interactor: interactor,
                                               router: router)
        let connectorTableView = CharacterListTableView(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorTableView = connectorTableView
        
        interactor.presenter = presenter
        
        return viewController
    }
}
