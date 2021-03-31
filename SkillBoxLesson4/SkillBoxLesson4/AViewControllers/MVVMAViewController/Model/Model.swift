//
//  Model.swift
//  SkillBoxLesson4
//
//  Created by Левон on 31.03.2021.
//

import Foundation

struct Model: Codable{
    var name: String?
    enum CoodingKeys: String, CodingKey{
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CoodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

