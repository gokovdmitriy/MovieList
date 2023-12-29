import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var movie: Movie?
    var watchlist: Watchlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        tableView.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdTableViewCell")
    }
    
    @objc func openLink() {
        if let url = URL(string: movie!.trailerLink ) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension DetailsViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        return
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let firstTableViewCellHeight  = UITableView.automaticDimension
        let secondTableViewCellHeight = UITableView.automaticDimension
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return UITableView.automaticDimension
        case 2:
            return tableView.frame.height-firstTableViewCellHeight-secondTableViewCellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            "FirstTableViewCell", for: indexPath) as? FirstTableViewCell
            else{ return MovieTableViewCell() }
            guard let watchlist = watchlist, let movie = movie else { return cell }
            cell.firstTableViewCellconfigureWith(movie: movie, addedToWatchlist: watchlist.contains(movie))
            cell.selectionStyle = .none
            cell.buttonTappedHandler = { [weak self] in
                guard let self = self, let movie = self.movie, let watchlist = self.watchlist else { return }
                if watchlist.contains(movie) {
                    watchlist.remove(movie)
                } else {
                    watchlist.add(movie)
                }
                self.tableView.reloadData()}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            "SecondTableViewCell", for: indexPath) as? SecondTableViewCell
            else{ return MovieTableViewCell() }
            guard let movie = self.movie else { return cell }
            cell.secondTableViewCellconfigureWith(movie: movie)
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:"ThirdTableViewCell", for: indexPath) as?                                                       ThirdTableViewCell
            else{ return MovieTableViewCell() }
            guard let movie = self.movie else { return cell }
            cell.thirdTableViewCellconfigureWith(movie: movie)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Invalid row")
        }
    }
}
