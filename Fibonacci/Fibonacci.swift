//
//  Fibonacci.swift
//  Fibonacci
//
//  Created by Gulya Boiko on 5/15/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation
import AlgoTester

final class Fibonacci: Testable {
    func run(data: [String]) -> String {
        guard let n = Int(data[0]) else { return "" }
        return getWithIteractive(n).description
    }
    
    // Сложность O(2^N)
    func getWithRecursive(_ n: Int) -> CUnsignedLongLong {
        if n == 0 { return 0 }
        if n == 1 || n == 2 {
            return 1
        }
        return getWithRecursive(n-1) + getWithRecursive(n-2)
    }
    
    // ПОЧЕМУ С БЛОКОМ НЕ СРАБОТАЛО?
    // Сложность O(N)
    func getWithIteractive(_ n: Int) -> CUnsignedLongLong {
        if n == 0 { return 0 }
        if n == 1 || n == 2 {
            return 1
        }
        var a = CUnsignedLongLong(1) // 1
        var b = CUnsignedLongLong(1) // 2
        for _ in (3...n) {
            let new = a + b
            a = b
            b = new
        }
        return b
    }
    
    // Сложность log(N) но еще надо учитывать чтоб процессор мог норм делить на sqrt(5) - большие цифры не возьмет
    func getWithGoldenRatio(_ n: Int) -> CUnsignedLongLong {
        let f: Double = (1 + sqrt(5))/2
        let f_n_decimal = ExponentiationAlgorithms().binary(base: Decimal(f), power: UInt(n))
        let f_n = Double(truncating: f_n_decimal as NSNumber)
        return CUnsignedLongLong((f_n/sqrt(5) + 0.5).rounded(.down))
    }
    
    func matrix(_ n: Int) -> CUnsignedLongLong {
        if n == 0 { return 0 }
        var n = n-1
        var result = Matrix2D.identity
        var base = Matrix2D.base
        while n > 1 {
            if (n & 1) == 1 {
                result = result.multiply(with: base)
            }
            base = base.multiply(with: base)
            n = n >> 1
        }
        return result.multiply(with: base).value[0][0]
    }
}
