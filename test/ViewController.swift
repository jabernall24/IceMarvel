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
        
//        iceMarvel.getCreators { (result) in
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
        
//        iceMarvel.getCreatorByID("7646") { (result) in
//            switch result {
//            case .success(let creator):
//                print(creator?.fullName)
//                print(creator?.events)
//                print(creator?.getThumbnailWith(size: .detail))
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCreatorComicsByID("7646") { (result) in
//            switch result {
//            case .success(let comics):
//                print(comics.count)
//                print(comics[0]?.id)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCreatorEventsByID("5977") { (result) in
//            switch result {
//            case .success(let events):
//                print(events.count)
//                print(events[0]?.title)
//                print(events[0]?.getThumbnailWith(size: .detail))
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCreatorSeriesByID("5977") { (result) in
//            switch result {
//            case .success(let series):
//                print(series.count)
//                print(series[0]?.title)
//                print(series[0]?.rating)
//                print(series[0]?.getThumbnailWith(size: .detail))
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCreatorStoriesByID("5977") { (result) in
//            switch result {
//            case .success(let stories):
//                print(stories.count)
//                print(stories[0]?.title)
//                print(stories[0]?.characters.count)
//                print(stories[0]?.id)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
    }
    

}
