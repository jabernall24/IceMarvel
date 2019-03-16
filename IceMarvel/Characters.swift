//
//  Characters.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/15/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

extension IceMarvel {
    
/*
    Fetches lists of comic characters.
*/
    func getCharacters(success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()){
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()

        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch {
                failure(error)
            }
        }
        task.resume()
    }
    
/*
    This method fetches a single character resource. It is the canonical URI for any character resource provided by the API.
*/
    func getCharacterBy(id: String, success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()){
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters/\(id)?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch {
                failure(error)
            }
        }
        task.resume()
    }
    
/*
    Fetches lists of comics containing a specific character.
*/
    func getCharacterComicsBy(id: String, success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()) {
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters/\(id)/comics?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch {
                failure(error)
            }
        }
        task.resume()
    }

/*
     Fetches lists of events in which a specific character appears, with optional filters.
*/
    func getCharacterEventsBy(id: String, success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()){
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters/\(id)/events?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch{
                failure(error)
            }
        }
        task.resume()
    }

/*
    Fetches lists of comic series in which a specific character appears.
*/
    func getCharacterSeriesBy(id: String, success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()) {
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters/\(id)/series?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch{
                failure(error)
            }
        }
        task.resume()
    }

/*
     Fetches lists of comic stories featuring a specific character with optional filters.
*/
    func getCharacterStoriesBy(id: String, success: @escaping([[String: Any]]?) -> (), failure: @escaping(Error?) -> ()){
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        guard let url = NSURL(string: "\(IceMarvel.baseURL)v1/public/characters/\(id)/stories?ts=\(IceMarvel.ts)&apikey=\(IceMarvel.publicKey)&hash=\(IceMarvel.hash)") else { return }
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { failure(error); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { failure(error); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { failure(error); return }
                guard let result = info["results"] as? [[String: Any]] else { failure(error); return }
                success(result)
            }catch{
                failure(error)
            }
        }
        task.resume()
    }
}
