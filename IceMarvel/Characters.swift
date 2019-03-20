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
    func getCharacters(completionHandler: @escaping(Result<[Character?], Error?>) -> (), offset: Int = 0, limit: Int = 20, orderBy: CharacterOrderBy = .name){
        let url = getCharactersURL(path: "/v1/public/characters", offset: offset, limit: limit, orderBy: orderBy)
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var characters: [Character] = []
                result.forEach({ (character) in
                    characters.append(Character(dictionary: character))
                })
                completionHandler(.success(characters))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
/*
    This method fetches a single character resource. It is the canonical URI for any character resource provided by the API.
*/
    func getCharacterBy(id: String, completionHandler: @escaping(Result<Character?, Error?>) -> ()){
        let url = getCharactersURL(path: "/v1/public/characters/\(id)")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                let character = Character(dictionary: result[0])
                completionHandler(.success(character))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }

/*
    Fetches lists of comics containing a specific character.
*/
    func getCharacterComicsBy(id: String, offset: Int = 0, limit: Int = 20, completionHandler: @escaping(Result<[Comic?], Error?>) -> ()) {
        let url = getCharactersURL(path: "/v1/public/characters/\(id)/comics", offset: offset, limit: limit)
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var comics: [Comic] = []
                result.forEach({ (comic) in
                    comics.append(Comic(dictionary: comic))
                })
                completionHandler(.success(comics))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }

/*
     Fetches lists of events in which a specific character appears, with optional filters.
*/
    func getCharacterEventsBy(id: String, offset: Int = 0, limit: Int = 20, completionHandler: @escaping(Result<[Event?], Error?>) -> ()){
        let url = getCharactersURL(path: "/v1/public/characters/\(id)/events", offset: offset, limit: limit)
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var events: [Event] = []
                result.forEach({ (event) in
                    events.append(Event(dictionary: event))
                })
                completionHandler(.success(events))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }

/*
    Fetches lists of comic series in which a specific character appears.
*/
    func getCharacterSeriesBy(id: String, completionHandler: @escaping(Result<[Series?], Error?>) -> ()) {
        let url = getCharactersURL(path: "/v1/public/characters/\(id)/series")
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var series: [Series] = []
                result.forEach({ (serie) in
                    series.append(Series(dictionary: serie))
                })
                completionHandler(.success(series))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }

/*
     Fetches lists of comic stories featuring a specific character with optional filters.
*/
    func getCharacterStoriesBy(id: String, completionHandler: @escaping(Result<[Story?], Error?>) -> ()){
        let url = getCharactersURL(path: "/v1/public/characters/\(id)/stories")
        let request = URLRequest(url: url as URL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { completionHandler(.failure(error)); return }
            do{
                guard let dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let info = dataDictionary["data"] as? [String: Any] else { completionHandler(.failure(error)); return }
                guard let result = info["results"] as? [[String: Any]] else { completionHandler(.failure(error)); return }
                var stories: [Story] = []
                result.forEach({ (story) in
                    stories.append(Story(dictionary: story))
                })
                completionHandler(.success(stories))
            }catch{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
    func getCharactersURL(path: String, offset: Int = 0, limit: Int = 20, orderBy: CharacterOrderBy = .name) -> URL {
        IceMarvel.ts = Timestamp().timestamp()
        IceMarvel.hash = (IceMarvel.ts + IceMarvel.privateKey + IceMarvel.publicKey).md5()
        
        var components = URLComponents(string: IceMarvel.baseURL)!
        components.path = path
        let ts = URLQueryItem(name: "ts", value: IceMarvel.ts)
        let apiKey = URLQueryItem(name: "apikey", value: IceMarvel.publicKey)
        let hash = URLQueryItem(name: "hash", value: IceMarvel.hash)
        var off: URLQueryItem?
        var lim: URLQueryItem?
        var order: URLQueryItem?
        var queryItems = [ts, apiKey, hash]
        
        if offset != 0 {
            off = URLQueryItem(name: "offset", value: "\(offset)")
            queryItems.append(off!)
        }
        if limit != 20 && limit < 100 && limit > 0 {
            lim = URLQueryItem(name: "limit", value: "\(limit)")
            queryItems.append(lim!)
        }
        switch orderBy {
        case .name:
            break
        case .nameDescending:
            order = URLQueryItem(name: "orderBy", value: "-name")
            queryItems.append(order!)
        case .modified:
            order = URLQueryItem(name: "orderBy", value: "modified")
            queryItems.append(order!)
        case .modifiedDescending:
            order = URLQueryItem(name: "orderBy", value: "-modified")
            queryItems.append(order!)
        }
        components.queryItems = queryItems
        return components.url!
    }
}
