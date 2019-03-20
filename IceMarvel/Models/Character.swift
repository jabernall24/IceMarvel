//
//  Character.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct Character {
    var id: Int?
    var name: String?
    var description: String?
    var modified: String?
    private var path: String?
    private var ext: String?
    
    var comicsAvailable: Int?
    var comics: [String]?
    
    var seriesAvailable: Int?
    var series: [String]?
    
    var storiesAvailable: Int?
    var stories: [String]?
    
    var eventsAvailable: Int?
    var events: [String]?
    
    var detail: String?
    var wiki: String?
    var comicLink: String?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        description = dictionary["description"] as? String
        modified = dictionary["modified"] as? String
        
        guard let t = dictionary["thumbnail"] as? [String: Any] else { return }
        path = t["path"] as? String
        ext = t["extension"] as? String
        
        guard let c = dictionary["comics"] as? [String: Any] else { return }
        comicsAvailable = c["available"] as? Int
        if let items = c["items"] as? [[String: Any]] {
            for i in items {
                if let item = i["name"] as? String {
                    comics?.append(item)
                }
            }
        }
        
        guard let se = dictionary["series"] as? [String: Any] else { return }
        seriesAvailable = se["available"] as? Int
        if let items = se["items"] as? [[String: Any]] {
            for i in items {
                if let item = i["name"] as? String {
                    series?.append(item)
                }
            }
        }
        
        guard let st = dictionary["stories"] as? [String: Any] else { return }
        storiesAvailable = st["available"] as? Int
        if let items = st["items"] as? [[String: Any]] {
            for i in items {
                if let item = i["name"] as? String {
                    stories?.append(item)
                }
            }
        }
        
        guard let e = dictionary["events"] as? [String: Any] else { return }
        eventsAvailable = e["available"] as? Int
        if let items = e["items"] as? [[String: Any]] {
            for i in items {
                if let item = i["name"] as? String {
                    events?.append(item)
                }
            }
        }
        
        guard let urls = dictionary["urls"] as? [[String: Any]] else { return }
        for url in urls{
            if let type = url["type"] as? String {
                switch type{
                case "detail":
                    detail = url["url"] as? String
                case "wiki":
                    wiki = url["url"] as? String
                case "comiclink":
                    comicLink = url["url"] as? String
                default:
                    continue
                }
            }
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
