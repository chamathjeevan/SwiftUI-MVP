//
//  MockProfileServices.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation
class MockProfileServices: ServicesProtocol {
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        let repo = Repository(id: UUID(), name: "Test Repositery", title: "teleGraph-android", description: "Test Description", stargazerCount: "45", primaryLanguage: "C#")
        let mockRepos = [repo]
        
        let profile = Profile(id: UUID(), name: "Joel Arvidsson", avatarUrl: "teleGraph-android", bio: "oblador", company: "klarna", email: "arvidsson@test.com", followers: 45, following: 68, pinnedRepositories: mockRepos, topRepositories: mockRepos, starredRepositories: mockRepos)
        completion(.success(profile))
       }
}
