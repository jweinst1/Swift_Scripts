//: Playground - noun: a place where people can play

import Cocoa

//implementation of hasharray, also called an arrayset

struct arrayset {
    var list:[Int]
    var container:Set<Int>
    
    init() {
        self.list = [Int]()
        self.container = Set<Int>()
    }
    
    subscript(index:Int) -> Int {
        get {
            return self.list[index]
        }
        set(newval) {
            self.container.remove(self.list[index])
            self.list[index] = newval
            self.container.insert(newval)
        }
    }
    
    mutating func append(val:Int) {
        self.list.append(val)
        self.container.insert(val)
    }
    
    func contains(val:Int) ->Bool {
        return self.container.contains(val)
    }
    //removes and returns last element in the array set.
    mutating func pop() ->Int {
        let popped = self.list.popLast()!
        if self.list.contains(popped) {
            return popped
        }
        else {
            self.container.remove(popped)
            return popped
        }
    }
}




