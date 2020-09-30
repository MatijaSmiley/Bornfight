//
//  File.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class Item: Codable {
    var id: Int?
    var subtitle: String?
    var picture_url: String?
    var venue_categories: [VenueCategorie]?
    var primary_tag_group: String?
    var allTags: AllTags?
    var address: String?
    var opened: Bool?
    var web: String?
    var telephone: String?
    var share_link: String?
    var city: String?
    var lat: Double?
    var lon: Double?
    var trending: Int?
    var promoted: Int?
    var bat: Int?
    var has_qr_code: Int?
    var active: Int?
    var smoking_area: Int?
    var working_hours: [WorkingHour]?
    var gallery: [Picture]?
    var type: String?
    var name: String?
    var description: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case subtitle
        case picture_url
        case venue_categories
        case primary_tag_group
        case allTags
        case address
        case opened
        case web
        case telephone
        case share_link
        case city
        case lat
        case lon
        case trending
        case promoted
        case bat
        case has_qr_code
        case active
        case smoking_area
        case working_hours
        case gallery
        case type
        case name
        case description
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.picture_url = try container.decode(String.self, forKey: .picture_url)
        self.venue_categories = try container.decode([VenueCategorie].self, forKey: .venue_categories)
        self.primary_tag_group = try container.decode(String.self, forKey: .primary_tag_group)
        self.allTags = try container.decode(AllTags.self, forKey: .allTags)
        self.address = try container.decode(String.self, forKey: .address)
        self.opened = try container.decode(Bool.self, forKey: .opened)
        self.web = try container.decode(String.self, forKey: .web)
        self.telephone = try container.decode(String.self, forKey: .telephone)
        self.share_link = try container.decode(String.self, forKey: .share_link)
        self.city = try container.decode(String.self, forKey: .city)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.lon = try container.decode(Double.self, forKey: .lon)
        self.trending = try container.decode(Int.self, forKey: .trending)
        self.promoted = try container.decode(Int.self, forKey: .promoted)
        self.bat = try container.decode(Int.self, forKey: .bat)
        self.has_qr_code = try container.decode(Int.self, forKey: .has_qr_code)
        self.active = try container.decode(Int.self, forKey: .active)
        self.smoking_area = try container.decode(Int.self, forKey: .smoking_area)
        self.working_hours = try container.decode([WorkingHour].self, forKey: .working_hours)
        self.gallery = try container.decode([Picture].self, forKey: .gallery)
        self.type = try container.decode(String.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        
    }
}
