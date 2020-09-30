//
//  ErrorMessage.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class ErrorMessage {
    static var parse = "Couldn't parse data!"
    static var failure = "Something went wrong."
    
    static func failure(code: Int) -> String {
        return "Something went wrong. code: \(code)"
    }
    
    static func internalServer(code: Int) -> String {
        return "Internal Server Error. code: \(code)"
    }
}
