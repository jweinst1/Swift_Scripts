//: Playground - noun: a place where people can play

import Cocoa
//play ground that implements the number struct

struct Number {
    var sequence:[Character]
    var current:String
    var index:Int
    
    init(seq:String) {
        self.sequence = Array(seq.characters)
        self.current = String(self.sequence[0])
        self.index = 0
    }
    //prints the current value of the number
    func value() ->Void {
        print(self.current)
    }
    
    func increment() ->Void {
        if self.index == self.sequence.count {
            
        }
    }
}
