//
//  WatchList.swift
//  MovieList
//
//  Created by MacBook Pro  on 28.12.2023.
//
import Foundation

class Watchlist {
    private var movies: [String] = []
    func add(_ movie: Movie){
        guard !contains(movie) else { return }
        movies.append(movie.id)
    }
    
    func remove(_ movie: Movie){
        if let index = movies.firstIndex(of: movie.id){
            movies.remove(at: index)
        }
    }
    
    func contains(_ movie: Movie) -> Bool{
        movies.contains(movie.id)
    }
}
