//
//  CellView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import SwiftUI

struct CellView: View {
    var imageUrl: String
    var name: String
    var title: String
    var description: String
    var language: String
    var stargazers: String
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0.0) {
                HStack(alignment: .center) {
                    ImageView(imageUrl: imageUrl, width: 32, height: 32)
                    
                    
                    Text(name)
                        .font(.custom("SourceSansPro-Regular", size: 16))
                        .frame( height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                }
                .frame(height: 32)
                
                HStack(alignment: .center) {
                    Text(title)
                        .font(.custom("SourceSansPro-Regular", size: 16))
                        .fontWeight(.regular)
                        .frame( height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                .frame(height: 24)
                
                HStack(alignment: .center) {
                    
                    Text(description) .font(.custom("SSourceSansPro-Regular", size: 16))
                        .frame( height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                }
                .frame(height: 24)
                
                HStack(alignment: .center) {
                    
                    Image("Start")
                        .resizable()
                        .frame(width: 12, height: 12)
                    
                    Text("\(stargazers)")
                        .font(.custom("SourceSansPro-Regular", size: 13))
                    Image("Oval")
                        .resizable()
                        .frame(width: 12, height: 12)
                    
                    
                    Text(language)
                        .font(.custom("SourceSansPro-Regular", size: 13))
                    
                    Spacer()
                }
                .padding(.top, 16.0)
                .frame(height: 24)
            }
        }
        .padding(.all, 16.0)
        .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(Color(red: 204/255, green: 204/255, blue: 204/255), lineWidth: 1)
        )
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(imageUrl: "", name: "setaylor", title: "teleGraph-android", description: "Telegraph X is Android client", language: "45", stargazers: "Ruby")
    }
}
