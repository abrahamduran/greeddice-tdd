//: Playground - noun: a place where people can play

import Foundation
import XCTest

final class Greed {

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
    
}
