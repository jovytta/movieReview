//
//  AllMoviesView.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//

import SwiftUI

struct AllMoviesView: View {
    let movieStore = MovieStore.shared
    
    var genres: [String] {
        Set(movieStore.allMovies.map { $0.genre }).sorted()
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(genres, id: \.self) { genre in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(genre)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(movieStore.getMoviesByGenre(genre)) { movie in
                                        NavigationLink(value: movie) {
                                            VStack(alignment: .leading) {
                                                //poster
                                                ZStack(alignment: .bottomTrailing) {
                                                    Image(movie.posterName)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 130, height: 190)
                                                        .clipped()
                                                        .cornerRadius(10)
                                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                                                    
                                                    // Rating badge
                                                    HStack(spacing: 1) {
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(.yellow)
                                                            .font(.caption)
                                                        
                                                        Text(String(format: "%.1f", movie.rating))
                                                            .font(.caption)
                                                            .bold()
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(6)
                                                    .background(Color.black.opacity(0.7))
                                                    .cornerRadius(8)
                                                    .padding(8)
                                                }

                                                Text(movie.title)
                                                    .font(.callout)
                                                    .bold()
                                                    .foregroundColor(.primary)
                                                    .lineLimit(1)
                                                    .frame(width: 130, alignment: .leading)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("All Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

#Preview {
    AllMoviesView()
}
