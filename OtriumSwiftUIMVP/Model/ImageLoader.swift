//
//  ImageLoader.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-07.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader:ObservableObject {
    @Published var data = Data()

    init(imageUrl:String) {
        if !imageUrl.contains("http") {return}
        guard let url = URL(string: imageUrl) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
