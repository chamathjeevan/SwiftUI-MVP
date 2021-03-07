//
//  Repository.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation
struct Repository {
    var id: UUID
    var name: String
    var title: String
    var description: String
    var stargazerCount: String
    var primaryLanguage: String
}
struct RepositoryViewModel:Identifiable {
    var id: UUID
    var imageUrl:String
    var name: String
    var title: String
    var description: String
    var stargazer: String
    var language: String
}
