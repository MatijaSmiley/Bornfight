//
//  ResponseError.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

struct ResponseError: Codable {
    var message: String
    
    init(message: String) {
        self.message = message
    }

}
