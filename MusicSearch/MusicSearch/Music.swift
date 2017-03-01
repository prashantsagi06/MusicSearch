//
//  Music.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation


struct Music {
    
    var kind: String?
    var discCount: Int?
    var discNumber: Int?
    var country: String?
    var trackId: Double?
    var trackCount: Int?
    var trackNumber: Int?
    var currency: String?
    var trackName: String?
    var collectionId: Int?
    var trackPrice: Double?
    var artistName: String?
    var previewUrl: String?
    var wrapperType: String?
    var releaseDate: String?
    var trackTimeMillis: Int?
    var artworkUrl60: String?
    var trackViewUrl: String?
    var artworkUrl30: String?
    var trackHdPrice: Double?
    var artworkUrl100: String?
    var collectionName: String?
    var longDescription: String?
    var collectionPrice: Double?
    var hasITunesExtras: String?
    var collectionArtistId: Int?
    var primaryGenreName: String?
    var trackRentalPrice: Double?
    var shortDescription: String?
    var collectionViewUrl: String?
    var trackExplicitness: String?
    var trackCensoredName: String?
    var collectionHdPrice: Double?
    var contentAdvisoryRating: String?
    var collectionExplicitness: String?
    var collectionArtistViewUrl: String?
    
    
    init(data: NSDictionary) {
        self.kind = data["kind"] as? String
        self.country = data["country"] as? String
        self.trackId = data["trackId"] as? Double
        self.discCount = data["discCount"] as? Int
        self.discNumber = data["discNumber"] as? Int
        self.trackCount = data["trackCount"] as? Int
        self.trackName = data["trackName"] as? String
        self.trackNumber = data["trackNumber"] as? Int
        self.trackPrice = data["trackPrice"] as? Double
        self.artistName = data["artistName"] as? String
        self.previewUrl = data["previewUrl"] as? String
        self.collectionId = data["collectionId"] as? Int
        self.wrapperType = data["wrapperType"] as? String
        self.releaseDate = data["releaseDate"] as? String
        self.artworkUrl60 = data["artworkUrl60"] as? String
        self.trackViewUrl = data["trackViewUrl"] as? String
        self.artworkUrl30 = data["artworkUrl30"] as? String
        self.trackHdPrice = data["trackHdPrice"] as? Double
        self.artworkUrl100 = data["artworkUrl100"] as? String
        self.trackTimeMillis = data["trackTimeMillis"] as? Int
        self.collectionName = data["collectionName"] as? String
        self.longDescription = data["longDescription"] as? String
        self.collectionPrice = data["collectionPrice"] as? Double
        self.hasITunesExtras = data["hasITunesExtras"] as? String
        self.collectionArtistId = data["collectionArtistId"] as? Int
        self.primaryGenreName = data["primaryGenreName"] as? String
        self.trackRentalPrice = data["trackRentalPrice"] as? Double
        self.shortDescription = data["shortDescription"] as? String
        self.collectionViewUrl = data["collectionViewUrl"] as? String
        self.trackExplicitness = data["trackExplicitness"] as? String
        self.trackCensoredName = data["trackCensoredName"] as? String
        self.collectionHdPrice = data["collectionHdPrice"] as? Double
        self.contentAdvisoryRating = data["contentAdvisoryRating"] as? String
        self.collectionExplicitness = data["collectionExplicitness"] as? String
        self.collectionArtistViewUrl = data["collectionArtistViewUrl"] as? String
    }
}

