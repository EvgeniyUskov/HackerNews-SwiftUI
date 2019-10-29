//
//  ContentView.swift
//  HackerNews
//
//  Created by Evgeniy Uskov on 16.10.2019.
//  Copyright © 2019 Evgeniy Uskov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("Hacker News")
        }.onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1",title: "Get"),
//    Post(id: "2",title: "Shit"),
//    Post(id: "3",title: "Done")
//]
