//
//  CGFloat+Ext.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

extension CGFloat {
    
    // MARK: 5S Width Screen Value
    var ws: CGFloat {
        return (self / 320) * UIScreen.main.bounds.width
    }
    
    // MARK: 5S Height Screen Value
    var hs: CGFloat {
        return (self / 568) * UIScreen.main.bounds.height
    }
}
