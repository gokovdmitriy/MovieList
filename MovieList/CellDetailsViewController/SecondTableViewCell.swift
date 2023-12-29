//
//  SecondTableViewCell.swift
//  MovieList
//
//  Created by MacBook Pro  on 24.12.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shortDescriptionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func secondTableViewCellconfigureWith(movie: Movie){
        shortDescriptionText.text = movie.description
    }
}
