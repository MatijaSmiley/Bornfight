//
//  Networking.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

enum NetworkResponse<T: Decodable> {
    case success(T)
    case failure(NetworkError)
}
