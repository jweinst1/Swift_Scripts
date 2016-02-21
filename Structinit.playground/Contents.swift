//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
//variables changed on reinitalization
struct point {
    var x = 0
    var y = 0
}

struct sumtable {
    var table:[Int]
    var sums:[Int]
}

struct pointa {
    var num:Int
    var name:String
    init(num:Int, name:String) {
        self.num = num
        self.name = name
    }
}
//initialized via declared variables,
//collects words
struct collector {
    var bin:[String]
    mutating func collect( input:String) ->Void {
        let words = input.componentsSeparatedByString(" ")
        for elem in words {
            self.bin.append(elem)
        }
    }
    func getwords() ->[String] {
        return self.bin
    }
}

var tester = collector(bin: [String]())
tester.collect("hello sir i am your friend")
tester.getwords()
var newpoint = pointa(num: 4, name: "foo")
newpoint.num



