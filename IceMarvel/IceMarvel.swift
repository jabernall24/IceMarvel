//
//  IceMarvel.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/15/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class IceMarvel {
    
    static let baseURL = "https://gateway.marvel.com/v1/public"
    static var publicKey = ""
    static var privateKey = ""
    static var ts = ""
    static var hash = ""
    var session: URLSession
    
    init(PUBLIC_KEY: String, PRIVATE_KEY: String){
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        IceMarvel.publicKey = PUBLIC_KEY
        IceMarvel.privateKey = PRIVATE_KEY
    }
}
