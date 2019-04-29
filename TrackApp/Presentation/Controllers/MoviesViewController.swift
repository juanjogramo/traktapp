//
//  MoviesViewController.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/28/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum State {
        case loading
        case populated([Movie])
        case error
        
        var movies: [Movie] {
            switch self {
            case .populated(let movies):
                return movies
            default:
                return []
            }
        }
    }
    
    var state: State = .loading {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupCell()
        fetchMovies()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupCell() {
        let celNib = UINib(nibName: TableCell.movie, bundle: nil)
        let cellIdentifier = Identifiers.Cell.movie
        tableView.register(celNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func fetchMovies(){
        MovieService.shared.fetchMovies(onPage: 1) { (result) in
            switch result {
            case .success(let movies):
                self.state = .populated(movies)
            case .failure(let error):
                print("Error: ", error.localizedDescription)
            }
        }
    }

}


extension MoviesViewController: UITableViewDelegate {
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Cell.movie) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLable.text = state.movies[indexPath.row].title
        cell.yearLabel.text = state.movies[indexPath.row].year.toString
        cell.descriptionLabel.text = state.movies[indexPath.row].description
        cell.posterImageView.image = state.movies[indexPath.row].poster
        
        return cell
        
    }
    
}
