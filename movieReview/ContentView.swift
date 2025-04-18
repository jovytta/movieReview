//
//  ContentView.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            AllMoviesView()
                .tabItem {
                    Label("Movies", systemImage: "list.star")
                }
            ToWatchListView()
                   .tabItem {
                       Label("To Watch", systemImage: "bookmark")
                   }
            ProfileView()
                .tabItem {
                        Label("Profile", systemImage: "person")
                    }
        }
    }
}

#Preview {
    ContentView()
}
