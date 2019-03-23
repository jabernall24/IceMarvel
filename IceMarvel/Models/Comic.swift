//
//  Comic.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/16/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//


import Foundation

struct Comic {
    var id: Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Int?
    var variantDescription: String?
    var description: String?
    var modified: String?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var ean: String?
    var issn: String?
    var format: String?
    var pageCount: Int?
    
    var detailURL: String?
    var purchaseURL: String?
    var inAppLinkURL: String?
    
    var series: String?
    var variants: [String]?
    var collections: [String]?
    var collectedIssues: [String]?
    
    var saleDate: String?
    var focDate: String?
    var unlimitedDate: String?
    var digitalPurchaseDate: String?
    
    var printPrice: Double?
    var digitalPrice: Double?
    
    private var path: String?
    private var ext: String?
    
    private var imgPath: [String]?
    private var imgExt: [String]?
    
    var creators: [MiniCreator] = []
    var characters: [String]?
    var stories: [MiniStory] = []
    var events: [String]?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        digitalId = dictionary["digitalId"] as? Int
        title = dictionary["title"] as? String
        issueNumber = dictionary["issueNumber"] as? Int
        variantDescription = dictionary["variantDescription"] as? String
        description = dictionary["description"] as? String
        modified = dictionary["modified"] as? String
        isbn = dictionary["isbn"] as? String
        upc = dictionary["upc"] as? String
        diamondCode = dictionary["diamondCode"] as? String
        ean = dictionary["ean"] as? String
        issn = dictionary["issn"] as? String
        format = dictionary["format"] as? String
        pageCount = dictionary["pageCount"] as? Int
        
        if let urls = dictionary["urls"] as? [[String: Any]] {
            for url in urls {
                if let type = url["type"] as? String {
                    switch type {
                    case "detail":
                        detailURL = url["url"] as? String
                    case "purchase":
                        purchaseURL = url["url"] as? String
                    case "inAppLink":
                        inAppLinkURL = url["url"] as? String
                    default:
                        break
                    }
                }
            }
        }
        
        if let ser = dictionary["series"] as? [String: Any] {
            series = ser["name"] as? String
        }
        
        if let vari = dictionary["variants"] as? [[String: Any]] {
            for varient in vari {
                if let v = varient["name"] as? String {
                    variants?.append(v)
                }
            }
        }
        
        if let col = dictionary["collections"] as? [[String: Any]] {
            for collection in col {
                if let c = collection["name"] as? String {
                    collections?.append(c)
                }
            }
        }
        
        if let issue = dictionary["collectedIssues"] as? [[String: Any]] {
            for colIssue in issue {
                if let i = colIssue["name"] as? String {
                    collectedIssues?.append(i)
                }
            }
        }
        
        if let dates = dictionary["dates"] as? [[String: Any]] {
            for date in dates {
                if let type = date["type"] as? String{
                    switch type {
                    case "onsaleDate":
                        saleDate = date["date"] as? String
                    case "focDate":
                        focDate = date["date"] as? String
                    case "unlimitedDate":
                        unlimitedDate = date["date"] as? String
                    case "digitalPurchaseDate":
                        digitalPurchaseDate = date["date"] as? String
                    default:
                        break
                    }
                }
            }
        }
        
        if let prices = dictionary["prices"] as? [[String: Any]] {
            for price in prices {
                if let type = price["type"] as? String {
                    switch type {
                    case "printPrice":
                        printPrice = price["price"] as? Double
                    case "digitalPurchasePrice":
                        digitalPrice = price["price"] as? Double
                    default:
                        break
                    }
                }
            }
        }
        
        if let thumbnail = dictionary["thumbnail"] as? [String: Any] {
            path = thumbnail["path"] as? String
            ext = thumbnail["extension"] as? String
        }
        
        if let images = dictionary["images"] as? [[String: Any]] {
            for image in images {
                if let imgp = image["path"] as? String {
                    imgPath?.append(imgp)
                }else{
                    imgPath?.append("")
                }
                if let imge = image["extension"] as? String {
                    imgExt?.append(imge)
                }else{
                    imgExt?.append("")
                }
            }
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
                        characters?.append(name)
                    }
                }
            }
        }
        
        if let s = dictionary["stories"] as? [String: Any] {
            if let items = s["items"] as? [[String: Any]] {
                items.forEach { (story) in
                    stories.append(MiniStory(dictionary: story))
                }
            }
        }
        
        if let e = dictionary["events"] as? [String: Any] {
            if let items = e["items"] as? [[String: Any]] {
                for item in items {
                    if let name = item["name"] as? String {
                        events?.append(name)
                    }
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
