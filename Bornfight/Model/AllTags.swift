//
//  AllTags.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class AllTags: Codable {
    var primaryTags: [Tag]?
    var secondaryTags: [Tag]?

    private enum CodingKeys: String, CodingKey {
        case primaryTags
        case secondaryTags
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryTags = try container.decode([Tag].self, forKey: .primaryTags)
        self.secondaryTags = try container.decode([Tag].self, forKey: .secondaryTags)
    }
}
