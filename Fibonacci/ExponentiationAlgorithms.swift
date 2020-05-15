//
//  ExponentiationAlgorithms.swift
//  ExponentiationAlgorithms
//
//  Created by Gulya Boiko on 5/11/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation
import AlgoTester

final class ExponentiationAlgorithms {
    // Через двоичное разложение показателя степени. Сложность O(logN)
    func binary(base: Decimal, power: UInt) -> Decimal {
        if power == 0 { return 1 }
        var power = power
        var tempResult = base
        var result = Decimal(1.0)
        while power > 1 {
            if power & 1 == 1 {
                result *= tempResult
            }
            power = power >> 1
            tempResult *= tempResult // 2^2, 2^4, 2^8, 2^16
        }
        result *= tempResult
        return result.rounded(toPlaces: 11)
    }
}

extension Decimal {
    /// Rounds the Float80 to decimal places value
    mutating func rounded(toPlaces places: Int) -> Decimal {
        var rounded = Decimal()
        NSDecimalRound(&rounded, &self, places, .bankers)
        return rounded
    }
}


