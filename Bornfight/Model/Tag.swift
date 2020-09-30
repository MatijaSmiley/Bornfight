//
//  Tag.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//
import Foundation

class Tag: Codable {
    var id: Int?
    var color: String?
    var tag_group_id: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case color
        case tag_group_id
        case name
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.color = try container.decode(String.self, forKey: .color)
        self.tag_group_id = try container.decode(Int.self, forKey: .tag_group_id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
