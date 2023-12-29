//
//  FirstTableViewCell.swift
//  MovieList
//
//  Created by MacBook Pro  on 24.12.2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
   
    var buttonTappedHandler: (() -> Void)?
    private var trailerLink: String?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var watchlistButton: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var watchTrailerButton: UIButton!
    @IBOutlet weak var title: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        watchlistButton.layer.cornerRadius = watchlistButton.frame.height/2
        watchTrailerButton.layer.cornerRadius = watchTrailerButton.frame.height/2
        watchTrailerButton.backgroundColor = UIColor.white
        watchTrailerButton.layer.borderWidth = 1
        watchTrailerButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func watchlistButtonPressed(_ sender: Any) {
        buttonTappedHandler?()
    }
    
    @IBAction func watchTrailerButtonPressed(_ sender: Any) {
        print("current URL \(trailerLink)")
        if let url = URL(string: trailerLink!) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func firstTableViewCellconfigureWith(movie: Movie, addedToWatchlist: Bool) {
        title.text = movie.title
        let attributedString = NSMutableAttributedString(string: "\(movie.rating)/10")
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17),
                                      range: NSRange(location: 0, length: 3))
        attributedString.addAttribute(.foregroundColor, value: UIColor.black,
                                      range: NSRange(location: 0, length: 3))
        rating.attributedText = attributedString
        movieImage.image = UIImage(named: movie.imageName)
        
        let buttonText = addedToWatchlist ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST"
        watchlistButton.setTitle(buttonText, for: .normal)
        trailerLink = movie.trailerLink
    }
}


