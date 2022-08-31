import UIKit

/*
 Have the function ArrayChallenge (strArr) read the
 array of strings stored in strArr, which will contain 2
 elements: the first element will be a sequence of characters,
 and the second element will be a long string of comma-
 separated words, in alphabetical order, that represents a
 dictionary of some arbitrary length. For example: strArr can
 be: l'hellocat", "apple,bat,cat,goodbye,hello,yellow, why/]. Your
 goal is to determine if the first element in the input can be
 split into two words, where both words exist in the dictionary
 that is provided in the second input. In this example, the first
 element can be split into two words: hello and cat because
 both of those words are in the dictionary.
 10
 D
 Your program should return the two words that exist in the
 dictionary separated by a comma. So for the example above,
 your program should return hello,cat. There will only be one
 correct way to split the first element of characters into two
 words. If there is no way to split string into two words that
 exist in the dictionary, return the string not possible. The first
 element itself will never exist in the dictionary as a real word.
 */

let arr = ["hellocat", "apple,hello,bat,cat,goodbye,yellow,why"]

func arrayChallenge(input: [String]) -> String {
    guard input.count == 2,
          let selectedWord = input.first,
          let subStrings = input.last else {
        return ""
    }
    let subStringArray = subStrings.components(separatedBy: ",")
    for i in 0..<selectedWord.count-1 {
        let index = selectedWord.index(selectedWord.startIndex, offsetBy: i+1)
        let firstWord = selectedWord[..<index]
        let secondword = selectedWord[index..<selectedWord.endIndex]
        print(firstWord, secondword)
        
        if subStringArray.contains(where: { $0 == firstWord }) && subStringArray.contains(where: { $0 == secondword }) {
            return firstWord + ", " + secondword
        }
    }
    
    return ""
}

print("sol = ", arrayChallenge(input: arr))
