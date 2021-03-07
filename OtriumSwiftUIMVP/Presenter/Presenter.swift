//
//  ProfilePresenter.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation

protocol PresenterProtocol: AnyObject {
    func fetchProfile()
    func viewAllList()
}

protocol PresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func renderProfile(profile: ProfileViewModel)
}

class Presenter : PresenterProtocol {
    private var service: ServicesProtocol
    private weak var delegate: PresenterDelegate?
    private var profile: Profile!
    private var viewProfile: ProfileViewModel!
    
    init(service: ServicesProtocol, delegate: PresenterDelegate?) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchProfile() {
        service.fetchProfile { result in
            switch result {
            case .failure(let error):
                self.delegate?.render(errorMessage: "\(error)")
            case .success(let profile):
                self.profile = profile
                self.viewProfile = self.mapProfileViewModel(profile)
                self.delegate?.renderProfile(profile: self.viewProfile)
            }
        }
    }
    
    private func mapProfileViewModel(_ profile: Profile) -> ProfileViewModel {
        let limit = 3
        
        var pinnedRepoViewModels = [RepositoryViewModel]()
        for i in 0 ..< profile.pinnedRepositories.count {
            if i == limit {
                break
            }
            pinnedRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.pinnedRepositories[i].name, title: profile.pinnedRepositories[i].title, description: profile.pinnedRepositories[i].description, stargazer: profile.pinnedRepositories[i].stargazerCount, language: profile.pinnedRepositories[i].primaryLanguage))
            
        }
        
        var topRepoViewModels = [RepositoryViewModel]()
        for i in 0 ..< profile.topRepositories.count {
            if i == limit {
                break
            }
            topRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.topRepositories[i].name, title: profile.topRepositories[i].title, description: profile.topRepositories[i].description, stargazer: profile.topRepositories[i].stargazerCount, language: profile.topRepositories[i].primaryLanguage))
            
        }
        
        var starredRepoViewModels = [RepositoryViewModel]()
        for i in 0 ..< profile.starredRepositories.count {
            if i == limit {
                break
            }
            starredRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.starredRepositories[i].name, title: profile.starredRepositories[i].title, description: profile.starredRepositories[i].description, stargazer: profile.starredRepositories[i].stargazerCount, language: profile.starredRepositories[i].primaryLanguage))
            
        }
        
        let profileViewModel = ProfileViewModel(name: profile.name, avatarUrl: profile.avatarUrl, bio: profile.bio, company: profile.company, email: profile.email, followers: "\(profile.followers)", following: "\(profile.following)", pinnedRepositories: pinnedRepoViewModels, topRepositories: topRepoViewModels, starredRepositories: starredRepoViewModels)
        
        return profileViewModel
    }
    
    func viewAllList() {
    }
}

