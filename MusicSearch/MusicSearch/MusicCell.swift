//
//  MusicCell.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackDescription: UILabel!
    
    var data: Music = Music.init(data: [:]) {
        didSet {
            trackName.text = data.trackName ?? ""
            artistName.text = data.artistName ?? ""
            trackDescription.text = data.longDescription ?? ""
            
            if let _urlString = data.artworkUrl60 {
                if let _url = URL.init(string: _urlString) {
                    self.icon.downloadedFrom(url: _url)
                }
            }
        }
    }
    
    // preparing the cell for reuse.
    
    override func prepareForReuse() {
        icon.image = nil
        trackName.text = nil
        artistName.text = nil
        trackDescription.text = nil
        
    }
    
}
