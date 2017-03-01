//
//  DataManger.swift
//  MusicSearch
//
//  Created by Prashant on 2/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

struct DataManger {
    
    // This method makes a call to Request Manager class where we actually fetch the data and the fetched data is returned to this method using blocks. Once data is fetched, its parsed using JSONSerialization.
    
    func getMusicFor(_ term: String , completion: @escaping CompletionHandler) -> Void {
        RequestManager().getMusicFor(term) { (success, data, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(false, nil, error)
                }
                return
            }
            if let data = data {
                let dataSource = DataManger.parse(data as! NSData)
                DispatchQueue.main.async {
                    completion(true, dataSource, nil)
                }
            } else {
                // Throw error
                DispatchQueue.main.async {
                    completion(false, nil, error)
                }
            }
        }
    }
    
    
    // This method parses the data which is fetched from the iTunes Music Search API.
    
    static func parse(_ data: NSData) -> [Music]? {
        do {
            let res = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            if let dict: NSDictionary = res as? NSDictionary{
                var returnVal: Array = [Music]()
                print("Returned Data \(dict)")
                if let dataArray = dict["results"] as? NSArray {
                    for object in dataArray {
                        if object is NSDictionary {
                            returnVal.append(Music.init(data: (object as? NSDictionary)!))
                        }
                    }
                }
                
                return returnVal
            }
        } catch {
            
        }
        return nil
    }
}

