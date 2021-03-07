//
//  ProfileServices.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation

protocol ServicesProtocol: AnyObject {
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void)
}

class ProfileService: ServicesProtocol {
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        
        Network.shared.apollo.fetch(query: GitProfileQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                let userData = graphQLResult.data!.user!
                var pinnedRepos = [Repository]()
                
                // Loading starredRepositories
                for i in 0 ..< userData.pinnedItems.nodes!.count {
                    
                    var repoName:String = ""
                    var repoTitle:String = ""
                    var repoDescription:String = ""
                    var repoStargazer:String = ""
                    var repoLanguage:String = ""
                    
                    if let name =  userData.pinnedItems.nodes![i]?.resultMap["name"] as? String{
                        repoName = name
                    }
                    if let title =  userData.pinnedItems.nodes![i]?.resultMap["description"] as? String{
                        repoTitle = title
                    }
                    
                    if let description =  userData.pinnedItems.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let description =  userData.pinnedItems.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let stargazer =  userData.pinnedItems.nodes![i]?.resultMap["stargazerCount"] as? Int{
                        repoStargazer = "\(stargazer)"
                    }
                    if let primeLang =  userData.pinnedItems.nodes![i]?.resultMap["primaryLanguage"] as? [String:String] {
                        repoLanguage = primeLang["name"]!
                    }
                    pinnedRepos.append(Repository(id: UUID(), name: repoName, title: repoTitle, description: repoDescription, stargazerCount: repoStargazer, primaryLanguage: repoLanguage))
                }
                
                // Loading Top Repositories
                var topRepos = [Repository]()
                for i in 0 ..< userData.topRepositories.nodes!.count {
                    
                    var repoName:String = ""
                    var repoTitle:String = ""
                    var repoDescription:String = ""
                    var repoStargazer:String = ""
                    var repoLanguage:String = ""
                    
                    if let name =  userData.topRepositories.nodes![i]?.resultMap["name"] as? String{
                        repoName = name
                    }
                    if let title =  userData.topRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoTitle = title
                    }
                    
                    if let description =  userData.topRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let description =  userData.topRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let stargazer =  userData.topRepositories.nodes![i]?.resultMap["stargazerCount"] as? Int{
                        repoStargazer = "\(stargazer)"
                    }
                    if let primeLang =  userData.topRepositories.nodes![i]?.resultMap["primaryLanguage"] as? [String:String] {
                        repoLanguage = primeLang["name"]!
                    }
                    topRepos.append(Repository(id: UUID(), name: repoName, title: repoTitle, description: repoDescription, stargazerCount: repoStargazer, primaryLanguage: repoLanguage))
                }
                
                // Loading Started Repositories
                var startedRepos = [Repository]()
                for i in 0 ..< userData.starredRepositories.nodes!.count {
                    
                    var repoName:String = ""
                    var repoTitle:String = ""
                    var repoDescription:String = ""
                    var repoStargazer:String = ""
                    var repoLanguage:String = ""
                    
                    if let name =  userData.starredRepositories.nodes![i]?.resultMap["name"] as? String{
                        repoName = name
                    }
                    if let title =  userData.starredRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoTitle = title
                    }
                    
                    if let description =  userData.starredRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let description =  userData.starredRepositories.nodes![i]?.resultMap["description"] as? String{
                        repoDescription = description
                    }
                    
                    if let stargazer =  userData.starredRepositories.nodes![i]?.resultMap["stargazerCount"] as? Int{
                        repoStargazer = "\(stargazer)"
                    }
                    if let primeLang =  userData.starredRepositories.nodes![i]?.resultMap["primaryLanguage"] as? [String:String] {
                        repoLanguage = primeLang["name"]!
                    }
                    startedRepos.append(Repository(id: UUID(), name: repoName, title: repoTitle, description: repoDescription, stargazerCount: repoStargazer, primaryLanguage: repoLanguage))
                }
                
                
                let profile = Profile(id: UUID(), name: userData.name!, avatarUrl: userData.avatarUrl, bio: userData.bio!, company: userData.company!, email: userData.email, followers: userData.followers.totalCount, following: userData.following.totalCount, pinnedRepositories: pinnedRepos, topRepositories: topRepos, starredRepositories: startedRepos)
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func mapRepository(resultMap: [String: Any?])-> Repository{
        var repoName:String = ""
        var repoTitle:String = ""
        var repoDescription:String = ""
        var repoStargazer:String = ""
        var repoLanguage:String = ""
        
        if let name =  resultMap["name"] as? String{
            repoName = name
        }
        if let title =  resultMap["description"] as? String{
            repoTitle = title
        }
        
        if let description =  resultMap["description"] as? String{
            repoDescription = description
        }
        
        if let description =  resultMap["description"] as? String{
            repoDescription = description
        }
        
        if let stargazer =  resultMap["stargazerCount"] as? Int{
            repoStargazer = "\(stargazer)"
        }
        if let primeLang =  resultMap["primaryLanguage"] as? [String:String] {
            repoLanguage = primeLang["name"]!
        }
        return Repository(id: UUID(), name: repoName, title: repoTitle, description: repoDescription, stargazerCount: repoStargazer, primaryLanguage: repoLanguage)
    }
    
}
