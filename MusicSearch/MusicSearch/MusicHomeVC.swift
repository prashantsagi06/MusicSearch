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
    
    var dataSource: [Music] = [Music]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func setUP() -> Void {
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        apiCall("tom")
    }
    
    func apiCall(_ term: String ) -> Void {
        activityIndicator.startAnimating()
        DataManger().getMusicFor(term) { [weak self](success, response, error) in
            self?.activityIndicator.stopAnimating()
            self?.dataSource.removeAll()
            if success {
                self?.dataSource = (response as? [Music])!
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
}

extension MusicHomeVC: UISearchBarDelegate {
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        if searchBar.text != nil {
            apiCall(searchBar.text!)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


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
