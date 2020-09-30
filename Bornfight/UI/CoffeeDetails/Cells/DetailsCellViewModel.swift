//
//  DetailsCellViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import Foundation

class DetailsCellViewModel {
    
    var name: String?
    var type: String?
    var address: String?
    
    init(name: String?, type: String?, address: String?) {
        self.name = name
        self.type = type
        self.address = address
    }
}
