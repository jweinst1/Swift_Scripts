//: Playground - noun: a place where people can play

import Cocoa

struct Bit {
    var state:Int
    
    init(state:Int) {
        assert(state == 0 || state == 1)
        self.state = state
    }
    //flips the bit
    mutating func flip() {
        if self.state == 0 {
            self.state = 1
        }
        else {
            self.state = 0
        }
    }
}


