//
//  ProfileStore.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation

class ProfileStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(profile: ProfileViewModel)
    }
    @Published var state: State = .loading
}

extension ProfileStore: PresenterDelegate {
    func render(errorMessage: String) {
        self.state = .error(message: errorMessage)
    }
    func renderLoading() {
        self.state = .loading
    }
    func renderProfile(profile: ProfileViewModel) {
        self.state = .loaded(profile: profile)
    }
}
