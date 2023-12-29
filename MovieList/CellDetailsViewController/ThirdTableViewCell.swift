//
//  ThirdTableViewCell.swift
//  MovieList
//
//  Created by MacBook Pro  on 24.12.2023.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func thirdTableViewCellconfigureWith(movie: Movie){
        movieReleaseDate.text = movie.releaseDateString
        movieGenre.text = movie.genre.joined(separator: ", ")
    }
}
