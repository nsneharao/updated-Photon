//
//  mainViewController.swift
//  photon
//
//  Created by Sneha Nemaragomula on 3/8/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import XCTest
@testable import photon

class mainViewController: XCTestCase {
    var vc: ViewController?

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as? ViewController

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testCheckForValidMatix(){
        let matrix = vc?.StrinToMatrix("2,3,4\n2,3,1")
        XCTAssert(matrix! == [["2","3","4"],["2","3","1"]])

    }
    
    func testToConvertMatrixTostring()  {
       let string = vc?.MatrixToString(LoadMatrix.get6x5Matrix())
        XCTAssert(string! == "3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,8,6,4")

    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
