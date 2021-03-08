//
//  HorizontalView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import SwiftUI

struct HorizontalView: View {
    var presenter: PresenterProtocol!
    @State var isViewAll = false
    var isTopRepos = true
    var repositories: [RepositoryViewModel]
    var title: String
    var body: some View {
        VStack{
            HStack(){
                Text(title)
                    .font(.custom("SourceSansPro-Bold", size: 24))
                    .padding(.leading, 16.0)
                    .frame(height: 32)
                Spacer()
                Button(action: {
                    if isTopRepos {
                        presenter.viewAllTopRepors()
                    }else{
                        presenter.viewAllStartedRepors()
                    }
                    isViewAll = isViewAll ? false: true
                }){ Text(isViewAll ? "Show less": "View All").underline().font(.custom("SourceSansPro-Regular", size: 16))
                    .foregroundColor(Color.black)
                    .frame( height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)}
                .padding(.trailing, 16.0)
                
            }
            
            ScrollView (.horizontal) {
                HStack {
                    ForEach(repositories) { repository in
                        CellView(imageUrl: repository.imageUrl, name: repository.name, title: repository.title, description: repository.description, language: repository.language, stargazers: repository.stargazer).frame(width: 200)
                        
                    }
                }
                .padding([.leading, .trailing], 16.0)
            }
            .frame(height: 200, alignment: .center)
        }
    }
}

struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RepositoryViewModel(id: UUID(), imageUrl: "", name: "setaylor", title: "teleGraph-android", description: "Telegraph X is Android client", stargazer: "45", language: "56")
        HorizontalView(repositories: [viewModel], title: "Top View")
    }
}
