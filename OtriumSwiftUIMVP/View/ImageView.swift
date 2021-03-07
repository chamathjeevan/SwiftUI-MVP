//
//  ImageView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//
import SwiftUI
import Combine

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    var width:CGFloat
    var height:CGFloat
    
    init(imageUrl:String,width:CGFloat,height:CGFloat) {
        self.width = width
        self.height = height
        
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    var body: some View {
        Image(uiImage: (((imageLoader.data.count == 0) ? UIImage(named: "Avator")! : UIImage(data: imageLoader.data))!))
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/250px-Flag_of_the_Netherlands.svg.png", width: 100, height: 100)
    }
}
