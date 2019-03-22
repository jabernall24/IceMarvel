//
//  Creators.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/21/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

extension IceMarvel {
/*
     Fetches lists of comic creators
*/
    func getCreators(completionHandler: @escaping(Result<[Creator?], Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators")
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
     This method fetches a single creator resource
*/
    func getCreatorByID(_ id: String, completionHandler: @escaping(Result<Creator?, Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators/\(id)")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                let creator = Creator(dictionary: results[0])
                completionHandler(.success(creator))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     Fetches lists of comics in which the work of a specific creator appears
*/
    func getCreatorComicsByID(_ id: String, completionHandler: @escaping(Result<[Comic?], Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators/\(id)/comics")
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
     Fetches lists of events featuring the work of a specific creator
*/
    func getCreatorEventsByID(_ id: String, completionHandler: @escaping(Result<[Event?], Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators/\(id)/events")
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
     Fetches lists of comic series in which a specific creator's work appears
*/
    func getCreatorSeriesByID(_ id: String, completionHandler: @escaping(Result<[Series?], Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators/\(id)/series")
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
     Fetches lists of comic stories by a specific creator
*/
    func getCreatorStoriesByID(_ id: String, completionHandler: @escaping(Result<[Story?], Error?>) -> ()) {
        let url = getCreatorsURL(path: "/v1/public/creators/\(id)/stories")
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
    
    fileprivate func getCreatorsURL(path: String, limit: Int = 20, offset: Int = 0, orderBy: CreatorsOrderBy = .lastName) -> URL {
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
        case .lastName:
            break
        case .firstName:
            order = URLQueryItem(name: "orderBy", value: "firstName")
            queryItems.append(order!)
        case .middleName:
            order = URLQueryItem(name: "orderBy", value: "middleName")
            queryItems.append(order!)
        case .suffix:
            order = URLQueryItem(name: "orderBy", value: "suffix")
            queryItems.append(order!)
        case .modified:
            order = URLQueryItem(name: "orderBy", value: "modified")
            queryItems.append(order!)
        case .lastNameDescending:
            order = URLQueryItem(name: "orderBy", value: "-lastName")
            queryItems.append(order!)
        case .firstNameDescending:
            order = URLQueryItem(name: "orderBy", value: "-firstName")
            queryItems.append(order!)
        case .middleNameDescending:
            order = URLQueryItem(name: "orderBy", value: "-middleName")
            queryItems.append(order!)
        case .suffixDescending:
            order = URLQueryItem(name: "orderBy", value: "-suffix")
            queryItems.append(order!)
        case .modifiedDescending:
            order = URLQueryItem(name: "orderBy", value: "-modified")
            queryItems.append(order!)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    enum CreatorsOrderBy {
        case lastName
        case firstName
        case middleName
        case suffix
        case modified
        case lastNameDescending
        case firstNameDescending
        case middleNameDescending
        case suffixDescending
        case modifiedDescending
    }
}
