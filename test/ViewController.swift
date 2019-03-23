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
        
//        iceMarvel.getStories(offset: 300, limit: 100) { (result) in
//            switch result {
//            case .success(let stories):
//                for story in stories {
//                    if (story?.events.count)! > 0 {
//                        print(story?.id)
//                    }
//                }
//                print("done")
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStoryBy(id: "30") { (result) in
//            switch result {
//            case .success(let story):
//                print(story?.title)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStoryCharactersBy(id: "236") { (result) in
//            switch result {
//            case .success(let characters):
//                print(characters.count)
//                for character in characters {
//                    print(character?.name)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStoryComicsBy(id: "30") { (result) in
//            switch result {
//            case .success(let comics):
//                print(comics.count)
//                for comic in comics {
//                    print(comic?.printPrice)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStoryCreatorsBy(id: "10") { (result) in
//            switch result {
//            case .success(let creators):
//                print(creators.count)
//                for creator in creators {
//                    print(creator?.fullName)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStoryEventsBy(id: "543") { (result) in
//            switch result {
//            case .success(let events):
//                print(events.count)
//                for event in events {
//                    print(event?.title)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getStorySeriesBy(id: "543") { (result) in
//            switch result {
//            case .success(let series):
//                print(series.count)
//                for s in series {
//                    print(s?.id)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
    }
    

}
