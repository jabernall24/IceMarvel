//
//  MiniCreator.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/19/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct MiniCreator {
    var name: String
    var role: String
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? "Unknown"
        role = dictionary["role"] as? String ?? "Unknown"
    }
}
