//
//  photonTests.swift
//  photonTests
//
//  Created by Sneha Nemaragomula on 3/3/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import XCTest
@testable import photon

class photonTests: XCTestCase {
    var vc: ViewController?
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as? ViewController

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func Matric(matrix : [[String]] , sucessBool : Bool , count : Int) {
      let result =   MatrixAlgorithm.sharedInstance.findPath(matrix)
        print(result)
        XCTAssert((result.sucess) == sucessBool)
        XCTAssert((result.Cost) == count)
        
    }
    
    func testMatric5x6 (){
        let matrix =   LoadMatrix.get6x5Matrix()
        Matric(matrix, sucessBool: true, count: 16)
    }
    
    func testMatric6X6(){
        let matrix = LoadMatrix.get5x3Matrix()
        Matric(matrix, sucessBool: false, count: 48)

    }
  
    func testMatri1X5(){
       let matrix = LoadMatrix.get1x5Matrix()
        Matric(matrix, sucessBool: true, count: 26)
    }
    
    func testMatri5X1(){
        let matrix = LoadMatrix.Get5x1Matrix()
        Matric(matrix, sucessBool: true, count: 5)
    }
    
    func testMatricOther() {
        let matrix = [["69", "10", "19", "10", "19"],
                ["51", "23", "20", "19", "12"],
               ["60", "12", "20", "11", "10"]]
        Matric(matrix, sucessBool: false, count: 69)

    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
