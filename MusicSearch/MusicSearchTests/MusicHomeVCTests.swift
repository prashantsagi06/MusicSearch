//
//  MusicHomeVCTests.swift
//  MusicSearch
//
//  Created by Prashant on 3/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import XCTest

enum Controller: String {
    case MusicHomeVC = "MusicHomeVC"
}

class MusicHomeVCTests: XCTestCase {
    
    var testController:MusicHomeVC?
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        testController = storyboard.instantiateViewController(withIdentifier: Controller.MusicHomeVC.rawValue) as? MusicHomeVC
        testController?.loadView()
        print("testController \(testController)")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testController = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewDidLoad() {
        // Test if controller is nil
        XCTAssertNotNil(testController , "testController is nil")
        
        // Test if view is nil
        XCTAssertNotNil(testController?.view , "testController View is nil")
        // Test if ViwDidLoad is implemented and called
        testController?.viewDidLoad()
        testController?.setUP()
    }
    
    func testViewOutlet() {
        XCTAssertNotNil(testController?.tableView, "Table outlet is nil")
        XCTAssertNotNil(testController?.activityIndicator, "ActivityIndicator outlet is nil")
    }
    
    func testThatViewConformsToUITableViewDataSource() {
        XCTAssertTrue(((testController as? UITableViewDataSource) != nil), "View does not conform to UITableView datasource protocol")
    }
    
    func testThatTableViewHasDataSource() {
        XCTAssertNotNil(testController?.tableView.dataSource, "Table datasource cannot be nil")
    }
    
    func testTableViewIsConnectedToDelegate() {
        XCTAssertNotNil(testController?.tableView.delegate, "Table delegate cannot be nil")
    }
    
}

