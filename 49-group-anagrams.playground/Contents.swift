import UIKit

/**
 利用一个字典维护异位词数组
 key：排序之后的异位词，是异位词，排序之后相同，添加到这个key中的value中
 value：异位词数组
 时间复杂度为O(nklogk) n：字符串数组长度，k：字符串数组中字符串的最大长度
 空间复杂度为O(nk)
 */
//func groupAnagrams(_ strs: [String]) -> [[String]] {
//    if strs.count == 0 {
//        return []
//    }
//    if strs.count == 1 {
//        return [strs]
//    }
//    // key: strs中的字符串排序之后的数据(是异位词，排序之后的字符串相同)，value：异位词数组
//    var map: [String: [String]] = [:]
//    for str in strs {
//        // 字符串排序
//        let char = String(str.sorted())
//        // map中没有这个key
//        if !map.keys.contains(char) {
//            map[char] = [String]()
//        }
//        map[char]!.append(str)
//    }
//    return Array(map.values)
//}

/**
 当且仅当它们的字符计数（每个字符的出现次数）相同时，两个字符串是字母异位词。
 
 与上面解法有差异的一点是，判断异位词的key是以字母出现的次数
 时间复杂度为O(nk) n：字符串数组长度，k：字符串数组中字符串的最大长度
 空间复杂度为O(nk)
 */
func groupAnagrams(_ strs: [String]) -> [[String]] {
    if strs.count == 0 {
        return []
    }
    if strs.count == 1 {
        return [strs]
    }
    // key: 字符串中每个字母出现的次数组成的字符串，value：异位词数组
    var map: [String: [String]] = [:]
    for str in strs {
        // 字母出现的次数数组，按字母ASCII索引-'a' 保存对应字母出现次数
        var alphabet = [Int](repeating: 0, count: 26)
        let aScalarValue = "a".unicodeScalars.first!.value
        for scalar in str.unicodeScalars {
            alphabet[Int(scalar.value - aScalarValue)] += 1
        }
        // map中没有这个key
        let key = alphabet.description
        if !map.keys.contains(key) {
            map[key] = [String]()
        }
        map[key]!.append(str)
    }
    return Array(map.values)
}

let strs = ["eat","tea","tan","ate","nat","bat"]
groupAnagrams(strs)

