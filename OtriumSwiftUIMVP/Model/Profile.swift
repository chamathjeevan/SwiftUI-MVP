//
//  Profile.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation


struct Profile {
  var id: UUID
  var name: String
  var avatarUrl: String
  var bio: String
  var company: String
  var email: String
  var followers: Int
  var following: Int
  var pinnedRepositories: [Repository]
  var topRepositories: [Repository]
  var starredRepositories: [Repository]
}

struct ProfileViewModel {
    var name: String
    var avatarUrl: String
    var bio: String
    var company: String
    var email: String
    var followers: String
    var following: String
    var pinnedRepositories: [RepositoryViewModel]
    var topRepositories: [RepositoryViewModel]
    var starredRepositories: [RepositoryViewModel]
}
