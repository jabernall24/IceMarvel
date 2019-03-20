//
//  Result.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

enum Result<S, F> {
    case success(S)
    case failure(F)
}
