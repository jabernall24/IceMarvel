//
//  MiniStory.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/19/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct MiniStory {
    var name: String
    var type: String
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? "Unknown"
        type = dictionary["type"] as? String ?? "Unknown"
    }
}
