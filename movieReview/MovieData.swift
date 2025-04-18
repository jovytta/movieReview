//
//  MovieData.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//


//
//  MovieData.swift
//  movieReview
//
//  Created by Mac12 on 2025/4/18.
//

import Foundation

// Movie model definition
struct Movie: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let posterName: String
    let genre: String
    let description: String
    let rating: Double
}

// Central movie repository
class MovieStore {
    static let shared = MovieStore()
    
    var allMovies: [Movie] = [
        // Action movies
        Movie(title: "Inception", posterName: "inception", genre: "Action", description: "A thief who steals corporate secrets through dream-sharing technology is given the task of planting an idea into the mind of a CEO.", rating: 4.8),
        Movie(title: "The Dark Knight", posterName: "darkknight", genre: "Action", description: "Batman fights the menace known as the Joker in Gotham City.", rating: 4.9),
        Movie(title: "Mad Max: Fury Road", posterName: "madmax", genre: "Action", description: "In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler with the aid of a group of female prisoners.", rating: 4.6),
        Movie(title: "John Wick", posterName: "johnwick", genre: "Action", description: "An ex-hitman comes out of retirement to track down the gangsters that killed his dog.", rating: 4.4),
        Movie(title: "Mission Impossible", posterName: "missionimpossible", genre: "Action", description: "An IMF agent is framed for the bombing of the Kremlin and goes on the run to clear the organization's name.", rating: 4.2),
        
        // Romance movies
        Movie(title: "Titanic", posterName: "titanic", genre: "Romance", description: "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.", rating: 4.7),
        Movie(title: "The Notebook", posterName: "notebook", genre: "Romance", description: "A poor yet passionate young man falls in love with a rich young woman, giving her a sense of freedom, but they are soon separated because of their social differences.", rating: 4.5),
        Movie(title: "La La Land", posterName: "lalaland", genre: "Romance", description: "While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.", rating: 4.3),
        Movie(title: "Before Sunrise", posterName: "beforesunrise", genre: "Romance", description: "A young man and woman meet on a train in Europe, and wind up spending one evening together in Vienna.", rating: 4.4),
        Movie(title: "Pride & Prejudice", posterName: "pride", genre: "Romance", description: "Sparks fly when spirited Elizabeth Bennet meets single, rich, and proud Mr. Darcy.", rating: 4.2),
        
        // Comedy movies
        Movie(title: "The Hangover", posterName: "hangover", genre: "Comedy", description: "Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing.", rating: 4.2),
        Movie(title: "Superbad", posterName: "superbad", genre: "Comedy", description: "Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.", rating: 4.1),
        Movie(title: "Bridesmaids", posterName: "bridesmaids", genre: "Comedy", description: "Competition between the maid of honor and a bridesmaid, over who is the bride's best friend, threatens to upend the life of an out-of-work pastry chef.", rating: 4.0),
        Movie(title: "Dumb and Dumber", posterName: "dumbanddumber", genre: "Comedy", description: "After a woman leaves a briefcase at the airport terminal, a dumb limo driver and his dumber friend set out on a hilarious cross-country road trip to Aspen.", rating: 3.9),
        Movie(title: "Anchorman", posterName: "anchorman", genre: "Comedy", description: "Ron Burgundy is San Diego's top-rated newsman in the male-dominated broadcasting of the 1970s, but that's all about to change.", rating: 4.0),
        
        // Drama movies
        Movie(title: "The Social Network", posterName: "socialnetwork", genre: "Drama", description: "As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea.", rating: 4.6),
        Movie(title: "The Godfather", posterName: "godfather", genre: "Drama", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", rating: 4.9),
        Movie(title: "The Shawshank Redemption", posterName: "shawshank", genre: "Drama", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", rating: 4.8),
        Movie(title: "Whiplash", posterName: "whiplash", genre: "Drama", description: "A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student's potential.", rating: 4.7),
        Movie(title: "The Pianist", posterName: "pianist", genre: "Drama", description: "A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.", rating: 4.5),
        
        // Sci-Fi movies
        Movie(title: "Interstellar", posterName: "interstellar", genre: "Sci-Fi", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", rating: 4.8),
        Movie(title: "Blade Runner 2049", posterName: "bladerunner", genre: "Sci-Fi", description: "Young Blade Runner K's discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who's been missing for thirty years.", rating: 4.5),
        Movie(title: "The Matrix", posterName: "matrix", genre: "Sci-Fi", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", rating: 4.7),
        Movie(title: "Arrival", posterName: "arrival", genre: "Sci-Fi", description: "A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.", rating: 4.4),
        Movie(title: "Dune", posterName: "dune", genre: "Sci-Fi", description: "Feature adaptation of Frank Herbert's science fiction novel, about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy.", rating: 4.6),
        // to watch
        Movie(title: "Oppenheimer", posterName: "oppenheimer", genre: "Drama", description: "The story of J. Robert Oppenheimer and his role in the development of the atomic bomb.", rating: 4.7),
        Movie(title: "Past Lives", posterName: "pastlives", genre: "Romance", description: "Two childhood friends reunite in New York after decades apart.", rating: 4.5),
        Movie(title: "Everything Everywhere All at Once", posterName: "everything", genre: "Sci-Fi", description: "A middle-aged Chinese immigrant is swept up in an insane adventure where she alone can save existence by exploring other universes.", rating: 4.9),
        Movie(title: "The French Dispatch", posterName: "frenchdispatch", genre: "Comedy", description: "A love letter to journalists set in an outpost of an American newspaper in a fictional 20th-century French city.", rating: 4.3),
        Movie(title: "Nomadland", posterName: "nomadland", genre: "Drama", description: "A woman in her sixties embarks on a journey through the western United States after losing everything during the recession.", rating: 4.4),
        Movie(title: "Dune: Part Two", posterName: "dune2", genre: "Sci-Fi", description: "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.", rating: 4.7)
    ]
    
    func getMoviesByGenre(_ genre: String) -> [Movie] {
        return allMovies.filter { $0.genre == genre }
    }
    
    func getSimilarMovies(to movie: Movie, limit: Int = 3) -> [Movie] {
        return allMovies
            .filter { $0.genre == movie.genre && $0.title != movie.title }
            .prefix(limit)
            .map { $0 }
    }
    
    func getMovie(title: String) -> Movie? {
        return allMovies.first { $0.title == title }
    }
    
    // "liked" movies
    var likedMoviesList: [Movie] = []
    
    // "to watch" list
    var toWatchList: [Movie] = []
    
    private init() {
        
        let likedTitles = ["Inception", "Titanic", "The Hangover", "The Social Network", "Interstellar"]
        
        for title in likedTitles {
            if let movie = getMovie(title: title) {
                likedMoviesList.append(movie)
            }
        }
        
        let toWatchTitles = ["Oppenheimer", "Past Lives", "Everything Everywhere All at Once",
                             "Parasite", "The French Dispatch", "Nomadland", "Dune: Part Two"]
        
        for title in toWatchTitles {
            if let movie = getMovie(title: title) {
                toWatchList.append(movie)
            }
        }
    }
}

