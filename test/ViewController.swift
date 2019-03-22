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
        
//        iceMarvel.getSeries { (result) in
//            switch result {
//            case .success(let series):
//                print(series.count)
//                for s in series {
//                    print(s?.title)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getASeriesBy(id: "19501") { (result) in
//            switch result {
//            case .success(let series):
//                print(series?.startYear)
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getASeriesCharactersBy(id: "19244") { (result) in
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
        
//        iceMarvel.getASeriesComicsBy(id: "19244") { (result) in
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
        
//        iceMarvel.getASeriesCreatorsBy(id: "19244") { (result) in
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
        
//        iceMarvel.getASeriesEventsBy(id: "19245") { (result) in
//            switch result {
//            case .success(let events):
//                print(events.count)
//                for event in events {
//                    print(event?.id)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getASeriesStoriesBy(id: "19245") { (result) in
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
