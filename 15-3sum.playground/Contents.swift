import UIKit

/**
 暴力解法
 三次循环
 时间复杂度为O(n^3)
 空间复杂度为o(n)，排序之后的数组
 提交LeetCode失败，提示超时
 */
//func threeSum(_ nums: [Int]) -> [[Int]] {
//    // Set 集合去重
//    var set = Set<[Int]>()
//    guard nums.count > 2 else {
//        return Array(set)
//    }
//    let sortedNums =  nums.sorted { (n1, n2) -> Bool in
//        n1 < n2
//    }
//    for i in 0..<sortedNums.count {
//        for j in (i+1)..<sortedNums.count {
//            for k in (j+1)..<sortedNums.count {
//                if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
//                    let list = [sortedNums[i], sortedNums[j], sortedNums[k]]
//                    set.insert(list)
//                }
//            }
//        }
//    }
//    return Array(set)
//}

/**
 双指针
 三数之和，a + b + c = 0
 先排序数组
 拆解 a + b = -c，假设第一个数就是-c，变成了求两数之和
 使用双指针，一个在头部，一个在尾部，向中间靠拢确定出 a 和 b
 时间复杂度为O(n^2)
 空间复杂度为O(n) 排序后使用另外的数组保存
 执行结果：通过
 执行用时：264 ms, 在所有 Swift 提交中击败了77.39%的用户
 内存消耗：23.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 
 */
//func threeSum(_ nums: [Int]) -> [[Int]] {
//    var result = [[Int]]()
//    // 过滤数据
//    guard nums.count > 2 else {
//        return result
//    }
//    // 排序
//    let sortedNums = nums.sorted { (n1, n2) -> Bool in
//        n1 < n2
//    }
//    for i in 0..<sortedNums.count {
//        if sortedNums[i] > 0 {
//            break
//        }
//        // 去重
//        if i > 0 && sortedNums[i] == sortedNums[i-1] {
//            continue
//        }
//        // 假设第一个值为 目标值，之后进行两数之和计算，头尾双指针
//        let target = -sortedNums[i]
//        var left = i + 1
//        var right = sortedNums.count-1
//
//        while left < right {
//            if sortedNums[left] + sortedNums[right] == target {
//                let list = [sortedNums[i], sortedNums[left], sortedNums[right]]
//                result.append(list)
//                // 去除头部重复数据
//                while left < right && sortedNums[left] == sortedNums[left+1] {
//                    left += 1
//                }
//                // 去除尾部重复数据
//                while left < right && sortedNums[right] == sortedNums[right-1] {
//                    right -= 1
//                }
//                left += 1
//                right -= 1
//            } else if(sortedNums[left] + sortedNums[right] < target) {
//                left += 1
//            } else {
//                right -= 1
//            }
//        }
//    }
//    return result
//}

/**
 结合LeetCode上的其他朋友的提交记录进一步优化一些细节
 执行时间比上一个代码减少一些
 执行结果：通过
 执行用时：248 ms, 在所有 Swift 提交中击败了93.97%的用户
 内存消耗：23.8 MB, 在所有 Swift 提交中击败了52.17%的用户
 */
func threeSum(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    // 过滤数据
    guard nums.count > 2 else {
        return result
    }
    // 升序 排序
    let sortedNums = nums.sorted { (n1, n2) -> Bool in
        n1 < n2
    }
    // 遍历的最后节点从 count -> count-2 ，
    // i, left=i+1, right=count-1 这种状态才需要处理
    // i=count-1, left=count, right=count，left==count 无需在遍历中处理，直接在此过滤掉
    for i in 0..<sortedNums.count-2 {
        // 排序之后，第一个数大于0，之后全部大于0，没有满足条件的数据
        if sortedNums[i] > 0 {
            break
        }
        // 去重
        if i > 0 && sortedNums[i] == sortedNums[i-1] {
            continue
        }
        // 假设第一个值为 目标值，之后进行两数之和计算，头尾双指针
        let target = -sortedNums[i]
        var left = i + 1
        var right = sortedNums.count-1

        while left < right {
            if sortedNums[left] + sortedNums[right] == target {
                let list = [sortedNums[i], sortedNums[left], sortedNums[right]]
                result.append(list)
                // 去除头部重复数据
                while left < right && sortedNums[left] == sortedNums[left+1] {
                    left += 1
                }
                // 去除尾部重复数据
                while left < right && sortedNums[right] == sortedNums[right-1] {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if(sortedNums[left] + sortedNums[right] < target) {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return result
}

let nums = [-1,0,1,2,-1,-4]
threeSum(nums)

