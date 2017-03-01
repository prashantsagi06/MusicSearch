//
//  RequestManager.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

struct RequestManager {
    
    // This method makea a network call using dataTask of URLSession. Data is fetched using the data task and the passed to Data manager using completing handler.
    
    func getMusicFor(_ term: String, completion: @escaping CompletionHandler) -> Void {
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        guard let urlString = RequestBuilder().getBaseURL() else {
            print("URLString can't be nil")
            return
        }
        
        // Remove any white space from city to make sure that URL is not broken
        let updatedTerm = term.components(separatedBy: .whitespaces).joined()
        
        guard let url = URL.init(string: urlString + "\(updatedTerm)") else {
            print("URL can't be nil")
            return
        }
        
        
        let request = NSMutableURLRequest.init(url: url)
        request.httpMethod = "GET"
        print("Connecting....\(request)")
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard error == nil else {
                completion(false, nil , error)
                return
            }
            print("Response Header \(response)")
            print("Response Data \(data)")
            completion(true, data , nil)
            
        }
        task.resume()
    }
    
}
