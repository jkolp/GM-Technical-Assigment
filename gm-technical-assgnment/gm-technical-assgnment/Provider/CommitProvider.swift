//
//  CommitProvider.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import Foundation

enum CommitProviderError: String, Error {
    case server = "Server error"
    case noInternet = "Internet connection is too slow..."
    case badUrl = "Bad repository URL"
    case noResult = "No commits were found in this repository"
}

struct Commit: Decodable {
    let message: String
}

struct CommitProviderPayload: Decodable {
    let url: String
    let sha: String
    let author: Author
    let commit: Commit
}

struct Author: Decodable {
    let login: String
    let avatarUrl: String
}

protocol CommitProvider {
    func fetchCommits(owner: String, repoName: String, completion: @escaping (Result<[CommitProviderPayload], CommitProviderError>) -> Void)
}


class CommitListProvider: CommitProvider {
    
    private let baseURL = "https://api.github.com"
    
    init() {}
    
    func fetchCommits(owner: String, repoName: String, completion: @escaping (Result<[CommitProviderPayload], CommitProviderError>) -> Void) {
        
        
        if !ConnectionManager.shared.isReachable(reachability: ConnectionManager.reachable!) {
            completion(.failure(.noInternet))
            return
        }
        
        guard let url = URL(string: "\(baseURL)/repos/\(owner)/\(repoName)/commits") else {
            completion(.failure(.badUrl))
            return
        }
        
        // TODO: Handle all errors i.e 400, 404, 500...
        let task = URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.server))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let results = try decoder.decode([CommitProviderPayload].self, from: data)

                    if results.count == 0 {
                        completion(.failure(.noResult))
                    } else {
                        completion(.success(results))
                    }
                    
                } catch {
                    completion(.failure(.server))
                }
            }
        }
        task.resume()
    }
}
