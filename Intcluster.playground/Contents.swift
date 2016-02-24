//: Playground - noun: a place where people can play

import Cocoa

//implementation of cluster struct for data science

struct cluster {
    var members:Set<Int>
    var average:Int
    var range:Int
    var max:Int
    var min:Int
    
    init() {
        self.members = Set<Int>()
        self.average = 0
        self.range = 0
        self.max = 0
        self.min = 0
    }
    
    mutating func add(num:Int) {
        self.members.insert(num)
        
    }
}
