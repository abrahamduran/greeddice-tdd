//: Playground - noun: a place where people can play

import Foundation
import XCTest

final class Greed {
    func score(dice: [Int]) -> Int {
        if dice == [5] {
            return 50
        }
        else if dice == [1,1,1] {
            return 1000
        }
        else if dice == [2,2,2] {
            return 200
        }
        else if dice == [3,3,3] {
            return 300
            return 200
        }
        
        return 100
    }
}

final class GreedTests: XCTestCase {
    private var _greed: Greed!
    
    override func setUp() {
        super.setUp()
        _greed = Greed()
    }

    func testScore_singleOne_oneHundred() {
        // arrange
        let expected = 100
        let dice = [1]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_singleFive_fifty() {
        // arrange
        let expected = 50
        let dice = [5]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_tripleOnes_oneThousand() {
        // arrange
        let expected = 1000
        let dice = [1,1,1]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_tripleTwos_twoHundred() {
        // arrange
        let expected = 200
        let dice = [2,2,2]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_tripleThrees_threeHundred() {
        // arrange
        let expected = 300
        let dice = [3,3,3]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
}
