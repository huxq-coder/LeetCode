import UIKit


/**
 时间复杂度 O(n^2)
 空间复杂度 O(1)
 从第一个数开始向后遍历，等于0与后面非0的数字进行交换
 提交LeetCode时不通过，因为数据量太大时耗时太多
*/
//func moveZeroes(_ nums: inout [Int]) {
//    for i in 0..<nums.count {
//        for j in stride(from: i+1, to: nums.count, by: 1) {
//            if nums[i] == 0 && nums[j] != 0 {
//                let temp = nums[i]
//                nums[i] = nums[j]
//                nums[j] = temp
//            }
//        }
//    }
//}
/**
 时间复杂度O(n)
 空间复杂度O(1)
 快慢指针
 i:快指针
 lastNonZeroIndex:最后一个非零指针，只有前面是非零的数字，才会向后移动一位
 第一次遍历，向前移动所有的非零数字，慢指针之前都是非零，之后都是零
 第二次遍历，慢指针之后的数字赋值为零
 */
//func moveZeroes(_ nums: inout [Int]) {
//    var lastNonZeroIndex = 0
//    for i in 0..<nums.count {
//        if nums[i] != 0 {
//            // 向前移动非零数字
//            nums[lastNonZeroIndex] = nums[i]
//            lastNonZeroIndex = lastNonZeroIndex + 1
//        }
//    }
//    // 以上遍历完成之后，lastNonZeroIndex之前的数字都是非零，之后的数字都是0
//    for i in lastNonZeroIndex..<nums.count {
//        nums[i] = 0
//    }
//}

/**
 时间复杂度O(n)
 空间复杂度O(1)
 快慢指针
 交换非零和零的数字，省去了上一个算法中的第二次遍历
 */
//func moveZeroes(_ nums: inout [Int]) {
//    var lastNonZeroIndex = 0
//    for i in 0..<nums.count {
//        if nums[i] != 0 {
//            // 交换
//            let temp = nums[lastNonZeroIndex]
//            nums[lastNonZeroIndex] = nums[i]
//            nums[i] = temp
//            // 交换也可以这么写
//            //    (nums[i], nums[lastNonZeroIndex]) = (nums[lastNonZeroIndex], nums[i])
//
//            lastNonZeroIndex = lastNonZeroIndex + 1
//        }
//    }
//}

/**
 时间复杂度O(n)
 空间复杂度O(1)
 快慢指针
 在上一个基础上再次优化
 */
func moveZeroes(_ nums: inout [Int]) {
    // 数组元素小于2个，直接返回
    guard nums.count > 1 else {
        return
    }
    var lastNonZeroIndex = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            // 避免 i 和 lastNonZeroIndex 相同时进行交换
            if i > lastNonZeroIndex {
                // 交换 改为 赋值，通过以上 i > lastNonZeroIndex 避免了两个非零的数字进行交换，所以需要交换的就是非零和零的数字
                // 非零数字赋值到零数字的位置，之前非零的位置可以直接赋值为零（交换也是赋值为零，所以直接进行赋值零）
                nums[lastNonZeroIndex] = nums[i]
                nums[i] = 0
            }
            // 非零就后移一位
            lastNonZeroIndex += 1
        }
    }
}

var nums = [2,1]
moveZeroes(&nums)



