//
//  NetworkError.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class NetworkError: Codable {
    var error: ResponseError
    
    init(message: String) {
        error = ResponseError(message: message)
    }
}

