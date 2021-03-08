//
//  ProfilePresenter.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation

protocol PresenterProtocol: AnyObject {
    func fetchProfile()
    func viewAllPinnedRepors()
    func viewAllTopRepors()
    func viewAllStartedRepors()
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
    private var isViewAllPinned = false
    private var isViewAlltop = false
    private var isViewAllStared = false
    init(service: ServicesProtocol, delegate: PresenterDelegate?) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchProfile() {
        service.fetchProfile { result in
            switch result {
            case .failure( _):
                self.delegate?.render(errorMessage: "An error occurred while fetching GitHub data")
            case .success(let profile):
                self.profile = profile
                self.viewProfile = self.mapProfileViewModel(profile)
                self.delegate?.renderProfile(profile: self.viewProfile)
            }
        }
    }
    
    private func mapProfileViewModel(_ profile: Profile) -> ProfileViewModel {
        
        var pinnedRepoViewModels = [RepositoryViewModel]()
        
        for i in 0 ..< profile.pinnedRepositories.count {
            
            if  isViewAllPinned == false && i > 2 {
                break
            }
            pinnedRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.pinnedRepositories[i].name, title: profile.pinnedRepositories[i].title, description: profile.pinnedRepositories[i].description, stargazer: profile.pinnedRepositories[i].stargazerCount, language: profile.pinnedRepositories[i].primaryLanguage))
        }
        
        var topRepoViewModels = [RepositoryViewModel]()
        for i in 0 ..< profile.topRepositories.count {
            if isViewAlltop  == false && i > 2  {
                break
            }
            topRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.topRepositories[i].name, title: profile.topRepositories[i].title, description: profile.topRepositories[i].description, stargazer: profile.topRepositories[i].stargazerCount, language: profile.topRepositories[i].primaryLanguage))
        }
        
        var starredRepoViewModels = [RepositoryViewModel]()
        for i in 0 ..< profile.starredRepositories.count {
            if isViewAllStared  == false && i > 2  {
                break
            }
            starredRepoViewModels.append(RepositoryViewModel(id: UUID(), imageUrl: profile.avatarUrl, name: profile.starredRepositories[i].name, title: profile.starredRepositories[i].title, description: profile.starredRepositories[i].description, stargazer: profile.starredRepositories[i].stargazerCount, language: profile.starredRepositories[i].primaryLanguage))
        }
        
        let profileViewModel = ProfileViewModel(name: profile.name, avatarUrl: profile.avatarUrl, bio: profile.bio, company: profile.company, email: profile.email, followers: "\(profile.followers)", following: "\(profile.following)", pinnedRepositories: pinnedRepoViewModels, topRepositories: topRepoViewModels, starredRepositories: starredRepoViewModels)
        
        return profileViewModel
    }
    
    func viewAllPinnedRepors() {
        
        fetchProfile()
        isViewAllPinned = (isViewAllPinned ? false:true)
    }
    
    func viewAllTopRepors() {
        
        fetchProfile()
        isViewAlltop = (isViewAlltop ? false:true)
    }
    func viewAllStartedRepors() {

        fetchProfile()
        isViewAllStared = (isViewAllStared ? false:true)
    }
    
}


