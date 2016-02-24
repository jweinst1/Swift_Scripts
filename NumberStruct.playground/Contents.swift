//: Playground - noun: a place where people can play

import Cocoa
//play ground that implements the number struct

struct Number {
    var sequence:[Character]
    var current: [Character]
    var index:Int
    var last:Character
    
    init(seq:String) {
        self.sequence = Array(seq.characters)
        self.current = [self.sequence[0]]
        self.index = 0
        self.last = self.sequence[self.sequence.count-1]
        
    }
    //prints the current value of the number
    func value() ->Void {
        var printable = ""
        for elem in self.current {
            printable += String(elem)
        }
        print(printable)
    }
    
    mutating func increment() ->Void {
        //increments the number
    }
    
    mutating func decrement() ->Void {
        //decrements the number
    }
}
