import UIKit
//find the pairs that give the sum

let arr1 = [1,2,3,9] // should turn false
let arr2 = [1,2,4,4] // should turn true


//naive
//Time Complexity O(n^2)
//Space Complexity O(1)

func hasPairWithSum(arr: [Int], sum: Int) -> Bool {
    let len = arr.count
    for i in 0..<len{
        for j in i+1..<len{
            if arr[i] + arr[j] == sum {
                return true
            }
        }
    }
    return false
}

hasPairWithSum(arr: arr2, sum: 8)


//--------------------------------------------------

//better version
//Time Complexity O(n)
//Space Complexity O(n)

//Have we seen sum-arr[i] in the past? We store this value in the set.

func hasPairWithSum2(arr: [Int], sum: Int) -> Bool {
    var prevNums = Set<Int>()
    let len = arr.count
    for i in 0..<len{
        if prevNums.contains(arr[i]){
            return true
        }else{
            prevNums.insert(sum - arr[i])
        }
    }
    return false
}

hasPairWithSum2(arr: arr1, sum: 8)

//----------------------------------------

//if the array is sorted:
//Time Complexity O(n)
//Space Complexity O(1)

func hasPairWithSum3(arr: [Int], sum: Int) -> Bool {
    var low = 0
    var high = arr.count - 1
    
    while(low<high){
        let s = arr[low] + arr[high]
        if s == sum{
            return true
        }else if s < sum {
            low += 1
        }else {
            high -= 1
        }
    }
    
    return false
}

hasPairWithSum3(arr: arr2, sum: 8)
