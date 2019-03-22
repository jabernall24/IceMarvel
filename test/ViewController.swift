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
        
//        iceMarvel.getEvents { (result) in
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
        
//        iceMarvel.getEventBy(id: "116") { (result) in
//            switch result {
//            case .success(let event):
//                print(event?.title)
//                print(event?.getThumbnailWith(size: .detail))
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getEventCharactersBy(id: "116") { (result) in
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
        
//        iceMarvel.getEventComicsBy(id: "116") { (result) in
//            switch result {
//            case .success(let comics):
//                print(comics.count)
//                for comic in comics {
//                    print(comic?.title)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getEventCreatorsBy(id: "116") { (result) in
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
        
//        iceMarvel.getEventSeriesBy(id: "116") { (result) in
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
        
//        iceMarvel.getEventStoriesBy(id: "116") { (result) in
//            switch result {
//            case .success(let stories):
//                print(stories.count)
//                for story in stories {
//                    print(story?.title)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
    }
    

}
