//
//  ListView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import SwiftUI

struct ListView: View {
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
                Button(action: { }){ Text("View All").underline().font(.custom("SourceSansPro-Regular", size: 16))
                    .foregroundColor(Color.black)
                    .frame( height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)}
                    .padding(.trailing, 16.0)
                
            }
            ScrollView{
                VStack{
                    ForEach(repositories) { repository in
                        CellView(imageUrl: repository.imageUrl, name: repository.name, title: repository.title, description: repository.description, language: repository.language, stargazers: repository.stargazer)
                    }
                }.padding(.all, 16.0)
            }
            .frame(height:300)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RepositoryViewModel(id: UUID(), imageUrl: "", name: "setaylor", title: "teleGraph-android", description: "Telegraph X is Android client", stargazer: "45", language: "56")
        ListView( repositories: [viewModel], title: "Pinned")
    }
}
