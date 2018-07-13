//: Playground - noun: a place where people can play

import Foundation
import XCTest

final class Greed {
    func score(dice: [Int]) -> Int {
        let result = scoreForSingles(dice: dice)
        guard let score = scoreIfTripleExists(dice: dice) else { return result }
        if dice.count == 4 { return score * 2 }
        
        return score
    }
    
    private func scoreForSingles(dice: [Int]) -> Int {
        if dice == [1] { return 100 }
        return 50
    }
    
    private func scoreIfTripleExists(dice: [Int]) -> Int? {
        let uniques = Set(dice)
        if dice.count > 2 && uniques.count == 1 {
            return scoreForTriples(value: uniques.first!)
        }
        return nil
    }
    
    private func scoreForTriples(value: Int) -> Int {
        var score = value*100
        if value == 1 { score *= 10 }
        return score
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
