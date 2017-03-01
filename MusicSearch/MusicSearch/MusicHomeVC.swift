//
//  MusicHomeVC.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


enum CellIdentifier: String {
    case MusicCell = "MusicCell"
}

class MusicHomeVC: UIViewController {
    
    private struct FileConstants {
        static let initialSearchText = "tom waits"
    }
    
    var dataSource: [Music] = [Music]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // setup View
    func setUP() -> Void {
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        apiCall(FileConstants.initialSearchText)
    }
    
    
    // This maethod makes the call the DataManager and passes the text which user searched in the search bar.
    func apiCall(_ term: String ) -> Void {
        activityIndicator.startAnimating()
        DataManger().getMusicFor(term) { [weak self](success, response, error) in
            self?.activityIndicator.stopAnimating()
            self?.dataSource.removeAll()
            if success {
                guard let fetchedResponse = response as? [Music] else {
                    return
                }
                self?.dataSource = fetchedResponse
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
}

// MARK: - UISearchBarDelegate methods

extension MusicHomeVC: UISearchBarDelegate {
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text != nil {
            guard let searchBarText = searchBar.text else {
                return
            }
            apiCall(searchBarText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


// MARK: - UITableViewDataSource methods
extension MusicHomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: Music = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MusicCell.rawValue, for: indexPath) as! MusicCell
        cell.data = data
        return cell
    }
}
