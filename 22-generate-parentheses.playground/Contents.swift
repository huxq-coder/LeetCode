import UIKit

/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 示例：

 输入：n = 3
 输出：[
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
      ]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。 
 */

/**
 暴力
 添加所有括号集合，然后判断每个集合是否有效
 时间复杂度为O(2^2n * n)
 空间复杂度为O(n)
 */
func generateParenthesis(_ n: Int) -> [String] {
    // 过滤边界
    guard n > 0 else {
        return [String]()
    }
    var result = [String]()
    helper("", 2*n, &result)
    return result
}

func helper(_ currentString: String, _ max: Int, _ result: inout [String]) {
    if currentString.count == max {
        // 校验括号是否有效
        if validate(currentString) {
            result.append(currentString)
        }
        return
    }
    let leftString = currentString.appending("(")
    let rightString = currentString.appending(")")
    helper(leftString, max, &result)
    helper(rightString, max, &result)
}

func validate(_ str: String) -> Bool {
    var count = 0
    for char in str {
        if char == "(" {
            count += 1
        } else {
            count -= 1
        }
        if count < 0 {
            return false
        }
    }
    return count == 0
}

/**
 递归 + 过滤符合条件的括号
 参考题解：https://leetcode-cn.com/problems/generate-parentheses/solution/hui-su-suan-fa-by-liweiwei1419/
 时间复杂度为O(4^n/√n)
 空间复杂度为O(4^n/√n)
 */
//func generateParenthesis(_ n: Int) -> [String] {
//    // 过滤边界
//    guard n > 0 else {
//        return [String]()
//    }
//    var result = [String]()
//    // 左括号和右括号 从 0 开始递增，括号成对存在，故最后左括号个数 == 右括号个数 == 总个数
//    // 另一种方法是 递减法 left 和 right 从 n 开始递减到0
//    helper(0, 0, n, "", &result)
//    return result
//}
//
//func helper(_ left: Int, _ right: Int, _ max: Int, _ currentString: String, _ result: inout [String]) {
//    // 递归结束条件
//    if left == max && right == left {
//        result.append(currentString)
//        return
//    }
//    // 递归逻辑
//    // 添加左括号
//    if left < max {
//        helper(left+1, right, max, currentString.appending("("), &result)
//    }
//    // 添加右括号
//    if right < left {
//        helper(left, right+1, max, currentString.appending(")"), &result)
//    }
//}

let n = 3
generateParenthesis(n)

