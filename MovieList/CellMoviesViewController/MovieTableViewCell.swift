//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by MacBook Pro  on 23.12.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var onMyWatchlist: UILabel!
    @IBOutlet weak var durationWithGenre: UILabel!
    
    func configureWith(movie: Movie, addedToWatchlist: Bool) {
        movieTitle.text = movie.title
        durationWithGenre.text = "\(movie.duration) - \(movie.genre.joined(separator: ", "))"
        thumbnail.image = UIImage(named: movie.imageName)
        onMyWatchlist.isHidden = !addedToWatchlist
    }
}
