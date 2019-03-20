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
        
//        iceMarvel.getCharacters { (result) in
//            switch result {
//            case .success(let characters):
//                for character in characters{
//                    if let name = character?.name {
//                        print("\(name)\t\(String(describing: character?.detail))\t\(String(describing: character?.wiki))\t\(String(describing: character?.comicLink))")
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        iceMarvel.getCharacterBy(id: "1011334") { (result) in
//            switch result {
//            case .success(let character):
//                print(character?.name)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        iceMarvel.getCharacterComicsBy(id: "1011334") { (result) in
//            switch result {
//            case .success(let comics):
//                print(comics[0]!.creators)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        iceMarvel.getCharacterEventsBy(id: "1009148") { (result) in
//            switch result{
//            case .success(let events):
//                events.forEach({ (event) in
//                    if let characters = event?.characters {
//                        for character in characters {
//                            print(character)
//                        }
//                    }
//                })
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCharacterSeriesBy(id: "1009148") { (result) in
//            switch result {
//            case .success(let series):
//                for serie in series {
//                    if let m_serie = serie {
//                        print(m_serie.creators)
//                    }
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
        
//        iceMarvel.getCharacterStoriesBy(id: "1009148") { (result) in
//            switch result {
//            case .success(let stories):
//                for story in stories {
//                    print(story?.title)
//                }
//            case .failure(let error):
//                print(error?.localizedDescription)
//            }
//        }
    }
    

}
