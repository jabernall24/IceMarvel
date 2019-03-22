//
//  Series.swift
//  IceMarvel
//
//  Created by Jesus Andres Bernal Lopez on 3/21/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

extension IceMarvel {
/*
     Fetches lists of comic series
*/
    func getSeries(completionHandler: @escaping(Result<[Series?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series")
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
     This method fetches a single comic series resource
*/
    func getASeriesBy(id: String, completionHandler: @escaping(Result<Series?, Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do {
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let results = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                let series = Series(dictionary: results[0])
                completionHandler(.success(series))
            }catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
/*
     Fetches lists of characters which appear in specific series
*/
    func getASeriesCharactersBy(id: String, completionHandler: @escaping(Result<[Character?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)/characters")
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
     Fetches lists of comics which are published as part of a specific series
*/
    func getASeriesComicsBy(id: String, completionHandler: @escaping(Result<[Comic?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)/comics")
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
     Fetches lists of comic creators whose work appears in a specific series
*/
    func getASeriesCreatorsBy(id: String, completionHandler: @escaping(Result<[Creator?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)/creators")
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
     Fetches lists of events which occur in a specific series
*/
    func getASeriesEventsBy(id: String, completionHandler: @escaping(Result<[Event?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)/events")
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
     Fetches lists of comic stories from a specific series
*/
    func getASeriesStoriesBy(id: String, completionHandler: @escaping(Result<[Story?], Error?>) -> ()) {
        let url = getSeriesURL(path: "/v1/public/series/\(id)/stories")
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
    
    fileprivate func getSeriesURL(path: String, limit: Int = 20, offset: Int = 0, orderBy: SeriesOrderBy = .title, contain: SeriesContains = .all) -> URL {
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
        var contains: URLQueryItem?
        
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
        case .title:
            break
        case .modified:
            order = URLQueryItem(name: "orderBy", value: "modified")
            queryItems.append(order!)
        case .startYear:
            order = URLQueryItem(name: "orderBy", value: "startYear")
            queryItems.append(order!)
        case .titleDescending:
            order = URLQueryItem(name: "orderBy", value: "-title")
            queryItems.append(order!)
        case .modifiedDescending:
            order = URLQueryItem(name: "orderBy", value: "-modified")
            queryItems.append(order!)
        case .startYearDescending:
            order = URLQueryItem(name: "orderBy", value: "-startYear")
            queryItems.append(order!)
        }
        
        switch contain {
        case .all:
            break
        case .comic:
            contains = URLQueryItem(name: "contains", value: "comic")
            queryItems.append(contains!)
        case .magazine:
            contains = URLQueryItem(name: "contains", value: "magazine")
            queryItems.append(contains!)
        case .tradePaperback:
            contains = URLQueryItem(name: "contains", value: "trade paperback")
            queryItems.append(contains!)
        case .hardcover:
            contains = URLQueryItem(name: "contains", value: "hardcover")
            queryItems.append(contains!)
        case .digest:
            contains = URLQueryItem(name: "contains", value: "digest")
            queryItems.append(contains!)
        case .graphicNovel:
            contains = URLQueryItem(name: "contains", value: "graphic novel")
            queryItems.append(contains!)
        case .digitalComic:
            contains = URLQueryItem(name: "contains", value: "digital comic")
            queryItems.append(contains!)
        case .infiniteComic:
            contains = URLQueryItem(name: "contains", value: "infinite comic")
            queryItems.append(contains!)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    enum SeriesOrderBy {
        case title
        case modified
        case startYear
        case titleDescending
        case modifiedDescending
        case startYearDescending
    }
    
    enum SeriesContains {
        case all
        case comic
        case magazine
        case tradePaperback
        case hardcover
        case digest
        case graphicNovel
        case digitalComic
        case infiniteComic
    }
}
