//
//  Constants.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionHandler = (_ success: Bool , _ data: Any? , _ error: Error?) -> Void

struct Constants {
    static let estimatedRowHeight: CGFloat = 100
    static let baseURL: String = "https://itunes.apple.com/search?term="
}
