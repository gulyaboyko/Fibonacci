//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by Gulya Boiko on 5/9/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//
import XCTest
@testable import Fibonacci
import AlgoTester

final class FibonacciTests: XCTestCase {

    func test() {
        let sut = Tester(task: Fibonacci(), bundleID: "com.gulya.boiko.Fibonacci")
        sut.runTests()
    }
    
    func test_recursive_10() {
        measure {
            _ = Fibonacci().getWithRecursive(10)
        }
    }
    
    func test_recursive_42() {
        measure {
            _ = Fibonacci().getWithRecursive(42)
        }
    }
    
    func test_recursive_50() {
        measure {
            _ = Fibonacci().getWithRecursive(50)
        }
    }
    
    func test_iteractive_10() {
        measure {
            _ = Fibonacci().getWithIteractive(10)
        }
    }
    
    func test_iteractive_42() {
        measure {
            _ = Fibonacci().getWithIteractive(42)
        }
    }
    
    func test_iteractive_60() {
        measure {
            _ = Fibonacci().getWithIteractive(60)
        }
    }
    
    func test_gold_10() {
        measure {
            _ = Fibonacci().getWithGoldenRatio(10)
        }
    }
    
    func test_gold_42() {
        measure {
            _ = Fibonacci().getWithGoldenRatio(42)
        }
    }
    
    func test_gold_60() {
        measure {
            _ = Fibonacci().getWithGoldenRatio(60)
        }
    }
    
    func test_matrix_10() {
        measure {
            _ = Fibonacci().matrix(10)
        }
    }
    
    func test_matrix_42() {
        measure {
            _ = Fibonacci().matrix(42)
        }
    }
    
    func test_matrix_60() {
        measure {
            _ = Fibonacci().matrix(60)
        }
    }

}
