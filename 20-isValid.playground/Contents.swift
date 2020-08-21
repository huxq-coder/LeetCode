import UIKit


/**
 栈
 利用 栈 左括号入栈，右括号对应栈顶左括号出栈，遍历完成后栈为空则true
 */
//func isValid(_ s: inout String) -> Bool {
//    // 过滤数据，单数不成立
//    guard s.count % 2 != 1 else {
//        return false
//    }
//    var stack = [Character]()
//    for char in s {
//        // 左括号入栈
//        if char == "(" || char == "[" || char == "{" {
//            stack.append(char)
//        } else if (char == ")" && stack.last == "(") || (char == "]" && stack.last == "[") || (char == "}" && stack.last == "{") {
//            stack.popLast()
//        }
//    }
//    return stack.isEmpty
//}

func isValid(_ s: inout String) -> Bool {
    // 过滤数据，单数不成立
    guard s.count % 2 != 1 else {
        return false
    }
    // 括号元素
    let map = [")": "(", "]": "[", "}": "{"]
    var stack = [Character]()
    for char in s {
        // 左括号入栈
        if map.values.contains(char.description) {
            stack.append(char)
        // 右括号对应栈顶左括号，出栈
        } else if map[char.description] == stack.last?.description {
            stack.popLast()
        // 不是括号
        } else {
            return false
        }
    }
    return stack.isEmpty
}


var str = "()"
isValid(&str)

