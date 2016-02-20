//playground for array functions and summation

import Cocoa

var str = "Hello, playground"

//creating arrays

struct arrmake {
    static func intarray(size:Int) ->[Int] {
        return [Int](count:size, repeatedValue:0)
    }
    
    static func strarray(size:Int) ->[String] {
        return [String](count:size, repeatedValue:"a")
    }
}

struct summer {
    static func sumtonum(end:Int) ->Int {
        var total = 0
        for num in 1...end {
            total += num
        }
        return total
    }
}

//given an empty array of zeros, incrment the index of the selected by it's sum

struct arrsum {
    static func sumtoindex_d(index:Int, var list:[Int]) -> [Int] {
        let summed = summer.sumtonum(index)
        list[index] = summed
        return list
    }
    //additive version
    static func sumtoindex_a(index:Int, var list:[Int]) -> [Int] {
        let summed = summer.sumtonum(index)
        list[index] += summed
        return list
    }
}

var tester = arrmake.intarray(5)
arrsum.sumtoindex_a(2, list:tester)

