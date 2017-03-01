//
//  RequestManagerTests.swift
//  MusicSearch
//
//  Created by Prashant on 3/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import XCTest

class RequestManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRequestManageApiCall() -> Void {
        RequestManager().getMusicFor("Tom") { (success, data, response) in
            if let _response = response as? HTTPURLResponse{
                XCTAssert(_response.statusCode == 200, "statusCode is not matching the server data")
            }
        }
    }
}
