//
//  Timestamp.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/15/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class Timestamp {
    func timestamp() -> String {
        let date = Date()
        return String(describing: date.timeIntervalSinceNow)
    }
}
