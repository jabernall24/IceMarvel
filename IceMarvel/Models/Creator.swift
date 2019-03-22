//
//  Creator.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

struct Creator {
    var id: Int?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var suffix: String?
    var fullName: String?
    var modified: String?
    
    private var path: String?
    private var ext: String?
    
    var comics: [String] = []
    var series: [String] = []
    var stories: [MiniStory] = []
    var events: [String] = []
    
    var detail: String?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        firstName = dictionary["firstName"] as? String
        middleName = dictionary["middleName"] as? String
        lastName = dictionary["lastName"] as? String
        suffix = dictionary["suffix"] as? String
        fullName = dictionary["fullName"] as? String
        modified = dictionary["modified"] as? String
        
        if let thumbnail = dictionary["thumbnail"] as? [String: Any] {
            path = thumbnail["path"] as? String
            ext = thumbnail["extension"] as? String
        }
        
        if let comicNames = dictionary["comics"] as? [String: Any] {
            if let items = comicNames["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    guard let name = item["name"] as? String else { return }
                    comics.append(name)
                }
            }
        }
        
        if let seriesNames = dictionary["series"] as? [String: Any] {
            if let items = seriesNames["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    guard let name = item["name"] as? String else { return }
                    series.append(name)
                }
            }
        }
        
        if let miniStories = dictionary["stories"] as? [String: Any] {
            if let items = miniStories["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    stories.append(MiniStory(dictionary: item))
                }
            }
        }
        
        if let eventNames = dictionary["events"] as? [String: Any] {
            if let items = eventNames["items"] as? [[String: Any]] {
                items.forEach { (item) in
                    guard let name = item["name"] as? String else { return }
                    events.append(name)
                }
            }
        }
        
        if let urls = dictionary["urls"] as? [[String: Any]] {
            urls.forEach { (url) in
                guard let type = url["type"] as? String else { return }
                switch type {
                case "detail":
                    detail = url["url"] as? String
                default: break
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
