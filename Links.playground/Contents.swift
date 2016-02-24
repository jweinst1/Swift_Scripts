//: Playground - noun: a place where people can play

import Cocoa

//link struct in swift
struct Link {
    var first:Any
    var second:Any
    
    init(first:Any, second:Any="nil") {
        self.first = first
        self.second = second
    }
    
}
//constructs a link of numbers
func makelink(numbers:[Int]) ->Link {
    var begin = Link(first: numbers[0])
    for i in 1..<numbers.count {
        begin = Link(first: numbers[i], second: begin)
    }
    return begin
}

var test = [1, 2, 3, 4, 5, 6, 7]



