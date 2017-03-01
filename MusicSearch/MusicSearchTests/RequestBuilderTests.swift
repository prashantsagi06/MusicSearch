//
//  RequestBuilderTests.swift
//  MusicSearch
//
//  Created by Prashant on 3/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import XCTest

class RequestBuilderTests: XCTestCase {
    
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
    
    // Safe case to be passed
    func testGetBaseURL() {
        XCTAssert(RequestBuilder().getBaseURL() == "https://itunes.apple.com/search?term=", "Base URL is not correct")
    }
}
