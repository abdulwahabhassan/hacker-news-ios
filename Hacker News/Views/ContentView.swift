//
//  ContentView.swift
//  Hacker News
//
//  Created by Hassan Abdulwahab on 01/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //create an instance and reference to network manager that can be observed //whenever the network manager updates, this will be triggered to notifier observers
    
    var body: some View {
        NavigationView {
            //because posts is a published property from an observable object, whenever its value changes, List will be reconstructed to account for the change
            List(networkManager.posts) { post in
                //NavigationLinked will create a button on the right hand side of each cell which when pressed will trigger a presentation of the DetailsView
                NavigationLink(destination: DetailsView(url: post.url)) {
                    //the label contains what will be shown in the navigation link
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData() //on view appear, fetch data from network manager
        } //every View has the onAppear method that will be called whenever the view appears
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

