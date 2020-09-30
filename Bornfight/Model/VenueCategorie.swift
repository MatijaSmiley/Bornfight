//
//  VenueCategorie.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class VenueCategorie: Codable {
    var id: Int?
    var image: String?
    var name: String?
    var feeling_lucky_title: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case image
        case name
        case feeling_lucky_title
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.feeling_lucky_title = try container.decode(String.self, forKey: .feeling_lucky_title)
    }
}
