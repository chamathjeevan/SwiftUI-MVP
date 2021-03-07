//
//  ContentView.swift
//  OtriumSwiftUIMVP
//
//  Created by Chamath Jeevan on 2021-03-06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let mockService = ProfileService()
    let mockStore = ProfileStore()
    var presenter : Presenter!
    init(){
         presenter = Presenter(service: mockService, delegate: mockStore)
    }
   
    var body: some View {
        
        ProfileView(store: mockStore, presenter: presenter)
    //  Text("Hello World")
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
