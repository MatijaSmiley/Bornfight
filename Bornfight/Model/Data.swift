//
//  Data.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

import Foundation

class Data: Codable {
    var customPicks: [CustomPick]?
    
    private enum CodingKeys: String, CodingKey {
        case customPicks
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customPicks = try container.decode([CustomPick].self, forKey: .customPicks)
    }
}


