//
//  Story.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct Story {
    
    var id: Int?
    var title: String?
    var description: String?
    var type: String?
    var modified: String?
    var creators: [MiniCreator] = []
    var characters: [String] = []
    var series: [String] = []
    var comics: [String] = []
    var events: [String] = []
    var origionalIssue: String?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        type = dictionary["type"] as? String
        modified = dictionary["modified"] as? String
        
        if let miniCreators = dictionary["creators"] as? [String: Any] {
            if let items = miniCreators["items"] as? [[String: Any]] {
                for item in items {
                    creators.append(MiniCreator(dictionary: item))
                }
            }
        }
        
        if let characterNames = dictionary["characters"] as? [String: Any] {
            if let items = characterNames["items"] as? [[String: Any]] {
                for item in items {
                    guard let name = item["name"] as? String else { return }
                    characters.append(name)
                }
            }
        }
        
        if let seriesNames = dictionary["series"] as? [String: Any] {
            if let items = seriesNames["items"] as? [[String: Any]] {
                for item in items {
                    guard let name = item["name"] as? String else { return }
                    series.append(name)
                }
            }
        }
        
        if let comicNames = dictionary["comics"] as? [String: Any] {
            if let items = comicNames["items"] as? [[String: Any]] {
                for item in items {
                    guard let name = item["name"] as? String else { return }
                    comics.append(name)
                }
            }
        }
        
        if let eventNames = dictionary["events"] as? [String: Any] {
            if let items = eventNames["items"] as? [[String: Any]] {
                for item in items {
                    guard let name = item["name"] as? String else { return }
                    events.append(name)
                }
            }
        }
        
        if let issue = dictionary["originalIssue"] as? [String: Any] {
            origionalIssue = issue["name"] as? String
        }
    }
}
