//
//  Medium_062_Unique_Paths_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/2/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_062_Unique_Paths_Test: XCTestCase {
    private static let ProblemName: String = "Medium_062_Unique_Paths"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [3, 7]
        let expected: Int = 28
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [10, 20]
        let expected: Int = 6906900
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_062_Unique_Paths_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Medium_062_Unique_Paths.uniquePaths(m: input[0], n: input[1])
            assertHelper(result == expected, problemName: Medium_062_Unique_Paths_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_062_Unique_Paths_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_062_Unique_Paths_Test.ProblemName, input: input, resultValue: Medium_062_Unique_Paths_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
