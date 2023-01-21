//
//  NSObject+Ext.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
