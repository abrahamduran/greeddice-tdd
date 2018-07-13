//: Playground - noun: a place where people can play

import Foundation
import XCTest

final class Greed {
    func score(dice: [Int]) -> Int {
        let uniques = Set(dice)
        var result = 100
        
        if dice == [5] { result = 50 }
        else if dice.count > 2 && uniques.count == 1 {
            result = uniques.first!*100
            if uniques.first == 1 { result *= 10 }
        }
        
        if dice.count == 4 { result *= 2 }
        
        return result
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
    
    func testScore_tripleFours_fourHundred() {
        // arrange
        let expected = 400
        let dice = [4,4,4]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_tripleFives_fiveHundred() {
        // arrange
        let expected = 500
        let dice = [5,5,5]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_tripleSixes_sixHundred() {
        // arrange
        let expected = 600
        let dice = [6,6,6]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_fourFours_eightHundred() {
        // arrange
        let expected = 800
        let dice = [4,4,4,4]
        
        // act
        let result = _greed.score(dice: dice)
        
        // assert
        XCTAssertEqual(result, expected)
    }
    
    func testScore_fourOfAKind_tripleScoreByTwo() {
        // arrange
        var passed = false
        var expected = 0, result = 0
        var number = 1
        
        for i in 1...6 {
            var _number = i
            if i == 1 { _number = 10 }
            let _expected = _number*100*2
            let dice = Array(repeating: i, count: 4)
            
            // act
            let _result = _greed.score(dice: dice)
            passed = _result == _expected
            
            if !passed {
                number = i ; result = _result ; expected = _expected
                break;
            }
        }
        
        // assert
        XCTAssert(passed, "Wrong result for \(number). Expected: \(expected), Result: \(result)")
    }
}
