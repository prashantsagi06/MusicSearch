//
//  RequestBuilder.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation


struct RequestBuilder {
    
    // This method returns the iTuunes base URL
    
    func getBaseURL() -> String? {
        return Constants.baseURL
    }
}
