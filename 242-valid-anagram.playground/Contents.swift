import UIKit

/**
 暴力解法
 字符串 -> 有序字符数组，比较两个有序数组是否相等
 时间复杂度为O(nlogn)
 空间复杂度为O(n)
 */
//func isAnagram(_ s: String, _ t: String) -> Bool {
//    // 转换为小写字母，排序
//    let sArray = Array(s.lowercased()).sorted()
//    let tArray = Array(t.lowercased()).sorted()
//    // 判断转换后的两个数组是否相同
//    return tArray.elementsEqual(sArray)
//}

/**
 借助Dictionary
 遍历字符串，将字符作为key，出现的次数作为value保存到字典中
 最后比较两个字典是否相同
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
//func isAnagram(_ s: String, _ t: String) -> Bool {
//    if s.count != t.count {
//        return false
//    }
//    var sMap: [Character: Int] = [:]
//    var tMap: [Character: Int] = [:]
//    // 遍历字符串，保存到字典中[字符: 出现的次数]
//    for char in s {
//        if sMap.keys.contains(char) {
//            sMap[char] = sMap[char]! + 1
//        } else {
//            sMap[char] = 1
//        }
//    }
//    for char in t {
//        if tMap.keys.contains(char) {
//            tMap[char] = tMap[char]! + 1
//        } else {
//            tMap[char] = 1
//        }
//    }
//    return tMap == sMap
//}

/**
 计数器
 利用一个字母表出现次数的计数数组
 第一个字符串出现的字母数量++
 第二个字符串出现的字母数量--
 最后数组中所有索引处的值都为0，true
 参考官方题解：https://leetcode-cn.com/problems/valid-anagram/solution/you-xiao-de-zi-mu-yi-wei-ci-by-leetcode/
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    // 26个英文字母，对应索引保存出现次数
    var alphabetCount = [Int](repeating: 0, count: 26)
    for char in s {
        alphabetCount[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
    }
    for char in t {
        alphabetCount[Int(char.asciiValue! - Character("a").asciiValue!)] -= 1
    }
    for count in alphabetCount {
        if count != 0 {
            return false
        }
    }
    return true
}

/**
 在上一步的基础上参考提交记录中的算法优化
 */
//func isAnagram(_ s: String, _ t: String) -> Bool {
//    if s.count != t.count {
//        return false
//    }
//    var alphabetCount = [Int](repeating: 0, count: 26)
//    let aScalarValue = "a".unicodeScalars.first!.value
//    for scalar in s.unicodeScalars {
//        alphabetCount[Int(scalar.value - aScalarValue)] += 1
//    }
//    for scalar in t.unicodeScalars {
//        alphabetCount[Int(scalar.value - aScalarValue)] -= 1
//    }
//    for i in alphabetCount {
//        if i != 0 {
//            return false
//        }
//    }
//    return true
//}

/**
 提交记录中的算法
 时间复杂度为O(n)
 空间复杂度为O(1)
 */
//func isAnagram(_ s: String, _ t: String) -> Bool {
//    if s.count != t.count {
//        return false
//    }
//    var ans1: UInt32 = 1, ans2: UInt32 = 1
//    var sum1: UInt32 = 0, sum2: UInt32 = 0
//    for c in s.unicodeScalars {
//        // 字符相同，取余避免越界
//        ans1 = ans1*c.value % UInt32(100000)
//        // 总数相同
//        sum1 += c.value
//    }
//    for c in t.unicodeScalars {
//        ans2 = ans2*c.value % UInt32(100000)
//        sum2 += c.value
//    }
//    return ans1 == ans2 && sum1 == sum2
//}

let s = "anagram"
let t = "nagaram"
isAnagram(s, t)
