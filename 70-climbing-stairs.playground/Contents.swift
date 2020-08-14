import UIKit

/**
 斐波那契数列
 递归
 f(n) = f(n-1) + f(n-2)
 时间复杂度O(2^n)
 空间复杂度O(n)
 提交LeetCode 不成功，执行到44时提示超时
 */
//func climbStairs(_ n: Int) -> Int {
//    if n == 1 {
//        return 1
//    } else if n == 2 {
//        return 2
//    } else {
//        return climbStairs(n-1) + climbStairs(n-2)
//    }
//}

/**
 f(n) = f(n-1) + f(n-2)
 以空间换时间，新建一个数组，保存每次计算的结果，避免递归重复计算
 时间复杂度O(n)
 空间复杂度O(n)
 */
//func climbStairs(_ n: Int) -> Int {
//    if n < 3 {
//        return n
//    }
//    var temp = [Int]()
//    temp.append(1)
//    temp.append(2)
//    var i = 2
//    while i <= n {
//        temp.append(temp[i-1] + temp[i-2])
//        i += 1
//    }
//    return temp[n-1]
//}

/**
 f(n) = f(n-1) + f(n-2)
 LeetCode给出的题解
 滚动数组思想
 f(n)的值只与f(n-1)和f(n-2)有关系，所以不需要记录每次计算的结果，只利用最后的三个数值进行滚动
 有点类似UITableView中的cell缓存池，移出屏幕的cell补充到最下面未显示的位置
 时间复杂度O(n)
 空间复杂度O(1)
 */
//func climbStairs(_ n: Int) -> Int {
//    var p = 0
//    var q = 0
//    var r = 1
//    for _ in 0..<n {
//        p = q
//        q = r
//        r = p + q
//    }
//    return r
//}

/**
 国际站中看到的一种更简洁的解法：https://leetcode.com/problems/climbing-stairs/discuss/25296/3-4-short-lines-in-every-language
 只使用了两个数值进行计算，a代表当前阶梯的方法数，b代表下一个阶梯的方法数
 再上一个阶梯时，旧的b变成了a，新的b变成了a+b
 */
func climbStairs(_ n: Int) -> Int {
    var a = 1
    var b = 1
    for _ in 0..<n {
        (a, b) = (b, a + b)
    }
    return a
}

/**
 斐波那契数列公式：https://zh.wikipedia.org/wiki/%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97
 数学好的同学可以直接套用公式得出答案（论数学的重要性😭）
 时间复杂度O(logn):pow 方法将会用去 O(\logn) 的时间。
 空间复杂度O(1)
 */
//func climbStairs(_ n: Int) -> Int {
//    let sqrt5 = sqrt(5)
//    let fibn = pow(Double((1 + sqrt5) / 2), Double(n + 1)) - pow(Double((1 - sqrt5) / 2), Double(n + 1))
//    return Int(fibn / sqrt5)
//}


climbStairs(6)


