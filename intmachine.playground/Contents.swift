//: Playground - noun: a place where people can play

import Cocoa

//can construct 2d arrays
struct twodarray {
    
    static func intarr(width:Int, height:Int)->[[Int]] {
        var twod = [[Int]]()
        var row = [Int]()
        for _ in 1...width {
            row.append(0)
        }
        for _ in 1...height {
            twod.append(row)
        }
        return twod
    }
}

struct MatrixMachine {
    var matrix:[[Int]]
    init() {
        self.matrix = twodarray.intarr(3, height: 3)
    }
    
    mutating func insert(col:Int, row:Int, value:Int) {
        self.matrix[row][col] = value
    }
    
    mutating func setzero(col:Int, row:Int) {
        self.matrix[row][col] = 0
    }
}






