//
//  ToWatchListView.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//

import SwiftUI

struct ToWatchListView: View {


    // Use the shared movie store
    let toWatchMovies: [Movie] = MovieStore.shared.toWatchList

    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(toWatchMovies) { movie in
                        NavigationLink(value: movie) {
                            HStack {
                                Image(movie.posterName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 90)
                                    .clipped()
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.headline)
                                    Text(movie.genre)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("To Watch List")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

#Preview {
    ToWatchListView()
}
