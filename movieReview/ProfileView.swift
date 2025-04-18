import SwiftUI

struct ProfileView: View {
    let userName = "@jopitacung"
    let userBio = "Movie enthusiast 🍿"

    let movieStore = MovieStore.shared
    let likedMovies: [Movie] = MovieStore.shared.likedMoviesList

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Profile picture
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(.top, 40)

                    // Name and Bio
                    VStack(spacing: 4) {
                        Text(userName)
                            .font(.title2)
                            .bold()

                        Text(userBio)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }

                    Divider().padding(.horizontal)

                    // Liked Movies Grid
                    VStack(alignment: .leading) {
                        Text("Liked Movies")
                            .font(.headline)
                            .padding(.horizontal)

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(likedMovies) { movie in
                                NavigationLink(value: movie) {
                                    VStack {
                                        Image(movie.posterName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 150)
                                            .clipped()
                                            .cornerRadius(8)

                                        Text(movie.title)
                                            .font(.caption)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: 100)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 40)
                }
            }
            .navigationTitle("Profile")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

#Preview {
    ProfileView()
}
