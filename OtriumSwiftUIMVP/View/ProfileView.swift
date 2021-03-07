//
//  ProfileView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import SwiftUI

struct ProfileView: View {
    var presenter: PresenterProtocol!
    @ObservedObject var profileStore: ProfileStore
    
    init(store: ProfileStore, presenter: PresenterProtocol) {
        self.profileStore = store
        self.presenter = presenter
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0) {
            HStack{ () -> AnyView in
                switch profileStore.state {
                case .loading:
                    return AnyView(Text("Fetching profile data from GitHub"))
                case .error(let message):
                    return AnyView(Text("Error : \(message)"))
                case .loaded(let profile):
                    return AnyView(
                        
                        NavigationView {
                            ScrollView{
                                VStack{
                                    HeaderView(imageUrl: profile.avatarUrl, profileName: profile.name, description: profile.bio, email: profile.email, followers: profile.followers, following: profile.following)
                                    ListView(repositories: profile.pinnedRepositories, title: "Pinned Repositeries")
                                    HorizontalView(repositories: profile.topRepositories, title: "Top Repositeries")
                                    HorizontalView(repositories: profile.starredRepositories, title: "Started Repositeries")
                                }
                                Spacer()
                            }
                            .navigationBarTitle("Profile", displayMode: .inline)
                        })
                }
            }
        }.onAppear(perform: presenter.fetchProfile)
    }
}

struct ProfileView_Previews:  PreviewProvider {
    static var previews: some View {
        let mockService = MockProfileServices()
        let mockStore = ProfileStore()
        let presenter = Presenter(service: mockService, delegate: mockStore)
        
        ProfileView(store: mockStore, presenter: presenter)
    }
}
