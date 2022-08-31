import UIKit

/*
 Have the function ArzayChallenge (arr) take the array of
 numbers stored in arr and from the position in the array where
 a 1 is, return the number of spaces either left or right you must
 move to reach an enemy which is represented by a 2. For
 example: if arz is [0, 0, 1, 0, 0, 2, 0, 21 then your program should
 return 3 because the closest enemy (2) is 3 spaces away from
 the 1. The array will contain any number of O's and 2's, but only a
 single 1. It may not contain any 2's at all as well, where in that
 • case your program should return a 0.
 */

let arr = [0, 0, 0, 0, 2, 2, 2, 0, 0, 1, 0, 0]

func arrayChallenge(input: [Int]) -> Int {
    guard input.contains(2), let indexOf1 = input.firstIndex(of: 1) else {
        return 0
    }
    
    if indexOf1 == 0 {
        if let indexOf2 = input.firstIndex(of: 2) {
            return indexOf2
        }
    } else if indexOf1 == input.count - 1 {
        if let indexOf2 = input.lastIndex(of: 2) {
            return indexOf1 - indexOf2
        }
    } else {
        var minSpaces = input.count
        for i in 0..<input.count {
            if input[i] == 2 {
                var diff = 0
                if i < indexOf1 {
                    diff = indexOf1 - i
                } else if i > indexOf1 {
                    diff = i - indexOf1
                }
                
                if minSpaces > diff {
                    minSpaces = diff
                }
            }
        }
        return minSpaces
    }
    return 0
}

print(arrayChallenge(input: arr))
