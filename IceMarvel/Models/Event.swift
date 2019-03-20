//
//  Event.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct Event {
    
    var id: Int?
    var title: String?
    var description: String?
    var detail: String?
    var wiki: String?
    var modified: String?
    var start: String?
    var end: String?
    
    private var path: String?
    private var ext: String?
    
    var creators: [MiniCreator] = []
    var characters: [String] = []
    var stories: [MiniStory] = []
    var comics: [String]?
    var series: [String]?
    var next: String?
    var previous: String?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        
        if let urls = dictionary["urls"] as? [[String: Any]]{
            for url in urls {
                if let type = url["type"] as? String{
                    switch type{
                    case "detail":
                        detail = url["url"] as? String
                    case "wiki":
                        wiki = url["url"] as? String
                    default: break
                    }
                }
            }
        }
        
        modified = dictionary["modified"] as? String
        start = dictionary["start"] as? String
        end = dictionary["end"] as? String
        
        if let thumbnail = dictionary["thumbnail"] as? [String: Any] {
            path = thumbnail["path"] as? String
            ext = thumbnail["extension"] as? String
        }
        
        if let c = dictionary["creators"] as? [String: Any] {
            if let items = c["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    creators.append(MiniCreator(dictionary: item))
                }
            }
        }
        
        if let c = dictionary["characters"] as? [String: Any] {
            if let items = c["items"] as? [[String: Any]] {
                for item in items {
                    if let name = item["name"] as? String {
                        characters.append(name)
                    }
                }
            }
        }
        
        if let s = dictionary["stories"] as? [String: Any] {
            if let items = s["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    stories.append(MiniStory(dictionary: item))
                }
            }
        }
        
        if let c = dictionary["comics"] as? [String: Any] {
            if let items = c["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    if let name = item["name"] as? String {
                        comics?.append(name)
                    }
                }
            }
        }
        
        if let s = dictionary["series"] as? [String: Any] {
            if let items = s["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    if let name = item["name"] as? String {
                        series?.append(name)
                    }
                }
            }
        }
        
        if let n = dictionary["next"] as? [String: Any]{
            next = n["name"] as? String
        }
        
        if let p = dictionary["previous"] as? [String: Any] {
            previous = p["name"] as? String
        }
    }
    
    func getThumbnailWith(size: MarvelImageSize) -> String{
        let errorMsg = "Unable to retrieve image url. "
        guard let p = path else { return errorMsg }
        guard let e = ext else { return errorMsg }
        switch size {
        case .detail:
            return "\(p)/detail.\(e)"
        case .portrait_small:
            return "\(p)/portrait_small.\(e)"
        case .portrait_medium:
            return "\(p)/portrait_medium.\(e)"
        case .portrait_xlarge:
            return "\(p)/portrait_xlarge.\(e)"
        case .portrait_fantastic:
            return "\(p)/portrait_fantastic.\(e)"
        case .portrait_uncanny:
            return "\(p)/portrait_uncanny.\(e)"
        case .portrait_incredible:
            return "\(p)/portrait_incredible.\(e)"
        case .standard_small:
            return "\(p)/standard_small.\(e)"
        case .standard_medium:
            return "\(p)/standard_medium.\(e)"
        case .standard_large:
            return "\(p)/standard_large.\(e)"
        case .standard_xlarge:
            return "\(p)/standard_xlarge.\(e)"
        case .standard_fantastic:
            return "\(p)/standard_fantastic.\(e)"
        case .standard_amazing:
            return "\(p)/standard_amazing.\(e)"
        case .landscape_small:
            return "\(p)/landscape_small.\(e)"
        case .landscape_medium:
            return "\(p)/landscape_medium.\(e)"
        case .landscape_large:
            return "\(p)/landscape_large.\(e)"
        case .landscape_xlarge:
            return "\(p)/landscape_xlarge.\(e)"
        case .landscape_amazing:
            return "\(p)/landscape_amazing.\(e)"
        case .landscape_incredible:
            return "\(p)/landscape_incredible.\(e)"
        case .full_size:
            return "\(p).\(e)"
        }
    }
}
