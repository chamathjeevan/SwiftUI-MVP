    //
    //  HeaderView.swift
    //  OtriumSwiftUIMVP
    //
    //  Created by Chamath Jeevan on 2021-03-07.
    //
    
    import SwiftUI
    
    struct HeaderView: View {
        var imageUrl: String
        var profileName: String
        var description: String
        var email: String
        var followers: String
        var following: String
        var body: some View {
            
            VStack {
                VStack(alignment: .center, spacing: 0.0) {
                    HStack(alignment: .top) {
                        ImageView(imageUrl: imageUrl, width: 88, height: 88)
                            .padding(.leading, 16.0)
                        
                        VStack(alignment: .leading, spacing: 0.0){
                            Text(profileName)
                                .font(.custom("SourceSansPro-Regular", size: 32))
                                .frame(height: 40)
                            Text(description)
                                .font(.custom("SourceSansPro-Regular", size: 16))
                                .frame(height: 24)
                            Spacer()
                        }
                        .frame(height: 88)
                        Spacer()
                    }
                    .padding(.top, 16.0)
                    
                    HStack(alignment: .top) {
                        Text(email)
                            .font(.custom("SourceSansPro-Regular", size: 16))
                            .padding(.leading, 16.0)
                        Spacer()
                        
                    }.frame(height: 24).padding(.top, 10.0)
                    HStack(alignment: .center) {
                        Text("\(followers) followers")
                            .font(.custom("SourceSansPro-Regular", size: 14))
                            .padding(.leading, 16.0)
                            .frame(height: 24)
                        Text("\(following) following")
                            .font(.custom("SourceSansPro-Regular", size: 14))
                            .frame(height: 24)
                        Spacer()
                    }
                }
                
            }
        }
    }
    
    struct HeaderView_Previews: PreviewProvider {
        static var previews: some View {
            HeaderView(imageUrl: "", profileName: "Chamath", description: "iOS Developer", email: "chamath@test.com", followers: "45", following: "66")
        }
    }
