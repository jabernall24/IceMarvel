//
//  Events.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/21/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

extension IceMarvel {
/*
     Fetches lists of events
*/
    func getEvents(completionHandler: @escaping(Result<[Event?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events")
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
     This method fetches a single event resource
*/
    func getEventBy(id: String, completionHandler: @escaping(Result<Event?, Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                let event = Event(dictionary: results[0])
                completionHandler(.success(event))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     Fetches lists of characters which appear in a specific event
*/
    func getEventCharactersBy(id: String, completionHandler: @escaping(Result<[Character?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)/characters")
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
     Fetches lists of comics which take place during a specific event
*/
    func getEventComicsBy(id: String, completionHandler: @escaping(Result<[Comic?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)/comics")
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
     Fetches lists of comic creators whose work appears in a specific event
*/
    func getEventCreatorsBy(id: String, completionHandler: @escaping(Result<[Creator?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)/creators")
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
     Fetches lists of comic series in which a specific event takes place
*/
    func getEventSeriesBy(id: String, completionHandler: @escaping(Result<[Series?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)/series")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var series: [Series] = []
                results.forEach({ (serie) in
                    series.append(Series(dictionary: serie))
                })
                completionHandler(.success(series))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     Fetches lists of comic stories from a specific event
*/
    func getEventStoriesBy(id: String, completionHandler: @escaping(Result<[Story?], Error?>) -> ()) {
        let url = getEventsURL(path: "/v1/public/events/\(id)/stories")
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
    
    fileprivate func getEventsURL(path: String, limit: Int = 20, offset: Int = 0, orderBy: EventsOrderBy = .name) -> URL {
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
        case .name:
            break
        case .startDate:
            order = URLQueryItem(name: "orderBy", value: "startDate")
            queryItems.append(order!)
        case .modified:
            order = URLQueryItem(name: "orderBy", value: "modified")
            queryItems.append(order!)
        case .nameDescending:
            order = URLQueryItem(name: "orderBy", value: "-name")
            queryItems.append(order!)
        case .startDateDescending:
            order = URLQueryItem(name: "orderBy", value: "-startDate")
            queryItems.append(order!)
        case .modifiedDescending:
            order = URLQueryItem(name: "orderBy", value: "-modified")
            queryItems.append(order!)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    enum EventsOrderBy {
        case name
        case startDate
        case modified
        case nameDescending
        case startDateDescending
        case modifiedDescending
    }
}
