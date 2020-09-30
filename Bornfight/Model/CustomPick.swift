//
//  CustomPick.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class CustomPick: Codable {
    var id: Int?
    var order: Int?
    var type: String?
    var title: String?
    var tags: [Tag]?
    var items: [Item]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case order
        case type
        case title
        case tags
        case items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.order = try container.decode(Int.self, forKey: .order)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.tags = try container.decode([Tag].self, forKey: .tags)
        self.items = try container.decode([Item].self, forKey: .items)
    }
}
