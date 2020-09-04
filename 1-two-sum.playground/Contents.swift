import UIKit


/**
 暴力法
 两层循环，所有元素两两相加直到等于target
 时间复杂度为O(n^2)
 空间复杂度为O(1)
 */
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    for i in 0..<nums.count-1 {
//        for j in (i+1)..<nums.count {
//            if nums[i] + nums[j] == target {
//                return [i, j]
//            }
//        }
//    }
//    return []
//}

/**
 双指针
 对数组排序，头尾指针向中间靠拢
 left + right == target return
 left + right < target left ++
 left + right > target right --
 根据left 和 right 的值在原数组中找到对应的索引
 时间复杂度为O(n)
 空间复杂度为O(1)
 */
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    // 排序
//    let sortNums = nums.sorted()
//    var left = 0
//    var right = nums.count-1
//    while left < right {
//        if sortNums[left] + sortNums[right] == target {
//            break
//        } else if sortNums[left] + sortNums[right] < target {
//            left += 1
//        } else {
//            right -= 1
//        }
//    }
//    // 找到left 和 right 对应未排序数组的索引
//    var result = [Int](repeating: 0, count: 2)
//    for i in 0..<nums.count {
//        if nums[i] == sortNums[left] {
//            result[0] = i
//            break
//        }
//    }
//    for i in 0..<nums.count {
//        if nums[i] == sortNums[right] && i != result[0] {
//            result[1] = i
//            return result
//        }
//    }
//    return []
//}

/**
 利用字典
 循环过的数据保存在字典中[nums[i]: i]
 循环过程中判断 keys 中是否包含 target - nums[i]
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else {
        return []
    }
    var map = [Int: Int]()
    for i in 0..<nums.count {
        let temp = target - nums[i]
        if map.keys.contains(temp) {
            return [i, map[temp]!]
        }
        map[nums[i]] = i
    }
    return []
}

let nums = [3,2,4]
let target = 6
twoSum(nums, target)
