//
//  CommitFacilitator.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import Foundation

protocol CommitFacilitator {
    func fetchAll(owner: String, repoName: String, completion: @escaping (Result<[CommitViewModel], CommitProviderError>) -> Void)
}

class CommitListFacilitator: CommitFacilitator {
    
    private let provider: CommitListProvider
    
    init(provider: CommitListProvider) {
        self.provider = provider
    }
    
    func fetchAll(owner: String, repoName: String, completion: @escaping (Result<[CommitViewModel], CommitProviderError>) -> Void) {
        provider.fetchCommits(owner: owner, repoName: repoName) { (result) in
            switch result {
                case .success( let data ):
                    let viewModel = data.map { payload -> CommitViewModel in
                        let model = CommitViewModel(
                            avatarUrl: payload.author.avatarUrl,
                            commitHash: payload.sha,
                            author: payload.author.login,
                            message: payload.commit.message,
                            commitUrl: payload.url)
                        
                        return model
                    }
                    completion(.success(viewModel))
                case .failure( let error ):
                    completion(.failure(error))
            }
        }
    }
}

