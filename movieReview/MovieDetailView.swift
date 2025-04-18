//
//  MovieDetailView.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//
import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var relatedMovies: [Movie] {
        MovieStore.shared.getSimilarMovies(to: movie)
    }
    
    private func ratingStars(for rating: Double) -> some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { star in
                if Double(star) <= rating {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if Double(star) - 0.5 <= rating {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
            
            Text(String(format: "%.1f", movie.rating))
                .foregroundColor(.white)
                .font(.headline)
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .bottomLeading) {
                    Image(movie.posterName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                        .clipped()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 150)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(movie.genre)
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Spacer()
                            
                            ratingStars(for: movie.rating)
                        }
                    }
                    .padding()
                }
                .cornerRadius(15)
                .shadow(radius: 8)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Synopsis")
                        .font(.title2)
                        .bold()
                    
                    Text(movie.description)
                        .font(.body)
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                VStack(alignment: .leading) {
                    if !relatedMovies.isEmpty {
                        Text("More \(movie.genre) Movies You'll Love")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        TabView {
                            ForEach(relatedMovies) { relatedMovie in
                                NavigationLink(value: relatedMovie) {
                                    VStack {
                                        Image(relatedMovie.posterName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(relatedMovie.title)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                                .lineLimit(1)
                                            
                                            HStack {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                                    .font(.caption)
                                                
                                                Text(String(format: "%.1f", relatedMovie.rating))
                                                    .font(.caption)
                                                    .bold()
                                                    .foregroundColor(.primary)
                                            }
                                            
                                            Text(relatedMovie.description)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                    }
                                    .padding()
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                }
                            }
                        }
                        .frame(height: 350)
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                    } else {
                        Text("No related movies found")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
    }
}

