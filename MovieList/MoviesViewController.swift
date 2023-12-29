//
//  ViewController.swift
//  MovieList
//
//  Created by MacBook Pro  on 23.12.2023.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var sortBy: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    let watchlist = Watchlist()
    var arrayOfMovies: [Movie] = [Movie(title: "Tenet",
                                        rating: 7.8,
                                        duration: "2h 30 min",
                                        genre: ["Action", "Sci-Fi"],
                                        description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                                        releaseDateString: "03 September 2020",
                                        trailerLink: "https://youtube.com/watch?v=tg52up16eq0",
                                        imageName: "Tenet"),
                                  Movie(title: "Spider-Man: Into the Spider-Verse",
                                        rating: 8.4,
                                        duration: "1h 57min",
                                        genre: ["Action", "Animation", "Adventure"],
                                        description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                                        releaseDateString: "14 December 2018",
                                        trailerLink: "https://www.youtube.com/watch?v=tg52up16eq0",
                                        imageName: "Spider Man"),
                                  Movie(title: "Knives Out",
                                        rating: 7.9,
                                        duration: "2h 10min",
                                        genre: ["Comedy", "Crime", "Drama"],
                                        description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                                        releaseDateString: "27 November 2019",
                                        trailerLink: "https://www.youtube.com/watch?v=qGqiHJTsRkQ",
                                        
                                        imageName: "Knives Out"),
                                  Movie(title: "Guardians of the Galaxy",
                                        rating: 8.0,
                                        duration: "2h 1min",
                                        genre: ["Action", "Adventure", "Comedy"],
                                        description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                                        releaseDateString: "01 August 2014",
                                        trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA",
                                        imageName: "Guardians of The Galaxy"),
                                  Movie(title: "Avengers: Age of Ultron",
                                        rating: 7.3,
                                        duration: "2h 1min",
                                        genre: ["​Action", "Adventure", "Sci-Fi"],
                                        description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it`s up to Earth`s mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                                        releaseDateString: "01 May 2015",
                                        trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do",
                                        imageName: "Avengers")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        let sortBy = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItem = sortBy
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func sortButtonTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let sortByDateAction = UIAlertAction(title: "Release Date", style: .default) { _ in
            self.sortByDate()
        }
        let sortByTitleAction = UIAlertAction(title: "Title", style: .default) { _ in
            self.sortByTitle()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        sortByTitleAction.setValue(UIColor.lightGray, forKey: "titleTextColor")
        sortByDateAction.setValue(UIColor.lightGray, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(sortByTitleAction)
        alertController.addAction(sortByDateAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
   
    private func sortByDate() {
        arrayOfMovies.sort { $0.releaseDate > $1.releaseDate }
        tableView.reloadData()
    }
    
    private func sortByTitle() {
        arrayOfMovies.sort { $0.title < $1.title }
        tableView.reloadData()
    }
}

extension MoviesViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = main.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            viewController.movie = arrayOfMovies[indexPath.row]
            viewController.watchlist = watchlist
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        else{ return MovieTableViewCell() }
        let movie = arrayOfMovies[indexPath.row]
        cell.configureWith(movie: movie, addedToWatchlist: watchlist.contains(movie))
        return cell
    }
}
