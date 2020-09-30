//
//  WorkingHour.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class WorkingHour: Codable {
    var id: Int?
    var venue_id: Int?
    var day: Int?
    var start: String?
    var end: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case venue_id
        case day
        case start
        case end
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.venue_id = try container.decode(Int.self, forKey: .venue_id)
        self.day = try container.decode(Int.self, forKey: .day)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decode(String.self, forKey: .end)
    }
}
