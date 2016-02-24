//: Playground - noun: a place where people can play

import Cocoa


struct numgenerator {
    var current:Int
    var increment:Int
    
    init(increment:Int=1, start:Int=0) {
        self.current = start
        self.increment = increment
    }
    
    mutating func next() ->Int {
        let yield = self.current
        self.current += self.increment
        return yield
    }
}

func compression(first:Int, second:Int) -> Int {
    return Int(String(first) + String(second))!
}

compression(3, second: 5)
//35


