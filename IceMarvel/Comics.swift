//
//  Comics.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/21/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

extension IceMarvel {
/*
     Fetches lists of comics with optional filters.
*/
    func getComics(completionHandler: @escaping(Result<[Comic?], Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var comics: [Comic] = []
                results.forEach({ (comic) in
                    comics.append(Comic(dictionary: comic))
                })
                completionHandler(.success(comics))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     This method fetches a single comic resource
*/
    func getComicByID(_ id: String, completionHamdler: @escaping(Result<Comic?, Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics/\(id)")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHamdler(.failure(error)); return}
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]  else { completionHamdler(.failure(error)); return}
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHamdler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHamdler(.failure(error)); return }
                let comic = Comic(dictionary: results[0])
                completionHamdler(.success(comic))
            }catch {
                completionHamdler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     Fetches lists of characters which appear in a specific comic
*/
    func getComicCharactersByID(_ id: String, completionHandler: @escaping(Result<[Character?], Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics/\(id)/characters")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var characters: [Character] = []
                results.forEach({ (character) in
                    characters.append(Character(dictionary: character))
                })
                completionHandler(.success(characters))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }

/*
     Fetches lists of comic creators whose work appears in a specific comic
*/
    func getComicCreatorsByID(_ id: String, completionHandler: @escaping(Result<[Creator?], Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics/\(id)/creators")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var creators: [Creator] = []
                results.forEach({ (creator) in
                    creators.append(Creator(dictionary: creator))
                })
                completionHandler(.success(creators))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
/*
     Fetches lists of events in which a specific comic appears
*/
    func getComicEventsByID(_ id: String, completionHandler: @escaping(Result<[Event?], Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics/\(id)/events")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var events: [Event] = []
                results.forEach({ (event) in
                    events.append(Event(dictionary: event))
                })
                completionHandler(.success(events))
            }catch {
                completionHandler(.failure(error))
            }
        }

        task.resume()
    }
    
/*
     Fetches lists of comic stories in a specific comic issue
*/
    func getComicStoriesByID(_ id: String, completionHandler: @escaping(Result<[Story?], Error?>) -> ()) {
        let url = getComicsURL(path: "/v1/public/comics/\(id)/stories")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var stories: [Story] = []
                results.forEach({ (story) in
                    stories.append(Story(dictionary: story))
                })
                completionHandler(.success(stories))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
    fileprivate func getComicsURL(path: String, limit: Int = 20, offset: Int = 0, orderBy: ComicsOrderBy = .focDate) -> URL {
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        var components = URLComponents(string: IceMarvel.baseURL)!
        components.path = path
        let ts = URLQueryItem(name: "ts", value: IceMarvel.ts)
        let apikey = URLQueryItem(name: "apikey", value: IceMarvel.publicKey)
        let hash = URLQueryItem(name: "hash", value: IceMarvel.hash)

        var lim: URLQueryItem?
        var off: URLQueryItem?
        var order: URLQueryItem?
        
        var queryItems = [ts, apikey, hash]
        
        if limit != 20 && limit <= 100 && limit > 0 {
            lim = URLQueryItem(name: "limit", value: "\(limit)")
            queryItems.append(lim!)
        }
        if offset > 0 {
            off = URLQueryItem(name: "offset", value: "\(offset)")
            queryItems.append(off!)
        }
        switch orderBy {
        case .focDate:
            break
        case .onSaleDate:
            order = URLQueryItem(name: "orderBy", value: "onSaleDate")
            queryItems.append(order!)
        case .title:
            order = URLQueryItem(name: "orderBy", value: "title")
            queryItems.append(order!)
        case .issueNumber:
            order = URLQueryItem(name: "orderBy", value: "issueNumber")
            queryItems.append(order!)
        case .modified:
            order = URLQueryItem(name: "orderBy", value: "modified")
            queryItems.append(order!)
        case .focDateDescending:
            order = URLQueryItem(name: "orderBy", value: "-focDate")
            queryItems.append(order!)
        case .onSaleDateDescending:
            order = URLQueryItem(name: "orderBy", value: "-onSaleDate")
            queryItems.append(order!)
        case .titleDescending:
            order = URLQueryItem(name: "orderBy", value: "-title")
            queryItems.append(order!)
        case .issueNumberDescending:
            order = URLQueryItem(name: "orderBy", value: "-issueNumber")
            queryItems.append(order!)
        case .modifiedDescending:
            order = URLQueryItem(name: "orderBy", value: "-modified")
            queryItems.append(order!)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    enum ComicsOrderBy {
        case focDate
        case onSaleDate
        case title
        case issueNumber
        case modified
        case focDateDescending
        case onSaleDateDescending
        case titleDescending
        case issueNumberDescending
        case modifiedDescending
    }
    
}
