//
//  AjmoResponse.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class Venue: Codable {
    var data: Data?
    var success: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case data
        case success
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(Data.self, forKey: .data)
        self.success = try container.decode(Bool.self, forKey: .success)
    }
}
