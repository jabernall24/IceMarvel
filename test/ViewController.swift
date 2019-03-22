//
//  ViewController.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/15/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iceMarvel = IceMarvel(PUBLIC_KEY: YOUR_PUBLIC_KEY, PRIVATE_KEY: YOUR_PRIVATE_KEY)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        iceMarvel.getComics { (result) in
//            switch result {
//            case .success(let comics):
//                print(comics[0]?.pageCount)
//                print(comics[0]?.title)
//            case .failure(let error):
//                print(error?.localizedDescription ?? "Unknown error")
//            }
//        }
        
//        iceMarvel.getComicByID("27238") { (result) in
//            switch result {
//            case .success(let comic):
//                print(comic?.diamondCode ?? "No Diamond code")
//                print(comic?.unlimitedDate ?? "No unlimited date")
//                print(comic?.digitalId ?? "No digital ID")
//                print(comic?.id ?? "No id")
//                print(comic?.title ?? "No title")
//                print(comic?.purchaseURL ?? "No purchase url")
//            case .failure(let error):
//                print(error?.localizedDescription ?? "Unknown error")
//            }
//        }
        
//        iceMarvel.getComicCharactersByID("27238") { (result) in
//            switch result {
//            case .success(let characters):
//                print(characters.count)
//                print(characters[0]?.comicLink)
//                print(characters[0]?.name)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getComicCreatorsByID("27238") { (result) in
//            switch result {
//            case .success(let creators):
//                print(creators.count)
//                print(creators[0]?.fullName)
//                print(creators[0]?.stories)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getComicEventsByID("37507") { (result) in
//            switch result {
//            case .success(let events):
//                print(events.count)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getComicStoriesByID("37507") { (result) in
//            switch result {
//            case .success(let stories):
//                print(stories.count)
//                print(stories[0]?.title)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
    }
    

}
