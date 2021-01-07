//
//  Alias_First_AppTests.swift
//  Alias-First-AppTests
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import XCTest
@testable import Alias_First_App

class Alias_First_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testTeamChooser() {
        let x = teamNames.count
        print(x)
        chooseTeamName()
        XCTAssert(x == teamNames.count + 1)
      
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
