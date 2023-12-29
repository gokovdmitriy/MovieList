//
//  MovieInfo.swift
//  MovieList
//
//  Created by MacBook Pro  on 23.12.2023.
//

import Foundation


let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("dd MMMM YYYY")
    return formatter
}()

struct Movie {
    let title : String
    let rating : Float
    let duration : String
    let genre : [String]
    let description : String
    let releaseDateString : String
    let trailerLink : String
    let imageName : String
    var releaseDate : Date
    var id : String
    
    init(title: String,
         rating: Float,
         duration: String,
         genre: [String],
         description: String,
         releaseDateString: String,
         trailerLink: String,
         imageName: String){
        
        self.title = title
        self.rating = rating
        self.duration = duration
        self.genre = genre
        self.description = description
        self.releaseDateString = releaseDateString
        self.trailerLink = trailerLink
        self.imageName = imageName
        self.releaseDate = dateFormatter.date(from: releaseDateString) ?? Date()
        self.id = UUID().uuidString
    }
}
