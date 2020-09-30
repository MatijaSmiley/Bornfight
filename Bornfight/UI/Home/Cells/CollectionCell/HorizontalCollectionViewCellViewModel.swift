//
//  HorizontalCollectionCellViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 28/09/2020.
//

import Foundation

class HorizontalCollectionViewCellViewModel {
    
    var hotPick: Bool?
    var image: String?
    var name: String?
    var type: String?
    
    init(hotPick: Bool?, image: String?, name: String?, type: String?) {
        self.hotPick = hotPick
        self.image = image
        self.name = name
        self.type = type
    }
}
