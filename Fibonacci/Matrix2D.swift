//
//  Matrix2D.swift
//  Fibonacci
//
//  Created by Gulya Boiko on 5/15/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class Matrix2D {
    let value: [[CUnsignedLongLong]]
    static let base = Matrix2D(value: [[1, 1], [1, 0]])
    static let identity = Matrix2D(value: [[1, 0], [0, 1]])
    
    private init(value: [[CUnsignedLongLong]]) {
        self.value = value
    }
    
    func multiply(with matrix: Matrix2D) -> Matrix2D {
        let x11 = (self.value[0][0] * matrix.value[0][0]) + (self.value[0][1] * matrix.value[1][0])
        let x12 = (self.value[0][0] * matrix.value[0][1]) + (self.value[0][1] * matrix.value[1][1])
        let x21 = (self.value[1][0] * matrix.value[0][0]) + (self.value[1][1] * matrix.value[1][0])
        let x22 = (self.value[1][0] * matrix.value[0][1]) + (self.value[1][1] * matrix.value[1][1])
        return Matrix2D(value: [[x11, x12], [x21, x22]])
    }
}
