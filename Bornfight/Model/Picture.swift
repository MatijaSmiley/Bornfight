//
//  Picture.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class Picture: Codable {
    var id: Int?
    var venue_id: Int?
    var picture: String?
    var created_at: Int?
    var updated_at: Int?

    private enum CodingKeys: String, CodingKey {
        case id
        case venue_id
        case picture
        case created_at
        case updated_at
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.venue_id = try container.decode(Int.self, forKey: .venue_id)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.created_at = try container.decode(Int.self, forKey: .created_at)
        self.updated_at = try container.decode(Int.self, forKey: .updated_at)
    }
}
