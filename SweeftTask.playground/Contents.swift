import UIKit

// MARK: Task1
//გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში)
//და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
//func minSplit(amount: Int) -> Int {
//// Your code goes here
//}
//Examples:
//minSplit(9) ➞ 5 //(1, 1, 1, 1, 5)
//minSplit(26) ➞ 3 //(1, 5, 20)
//minSplit(172) ➞ 6 //(1, 1, 20, 50, 50, 50)

func minSplit(amount: Int) -> Int {
    
    var remaining = amount
        var coinCount = 0
        let coins = [50, 20, 10, 5, 1]
        
        for coin in coins {
            if remaining >= coin {
                let count = remaining / coin
                coinCount += count
                remaining -= count * coin
            }
        }
        
        return coinCount
    
}

minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)



//2. დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
//მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
//// 19, 20, 21, 22
//// (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19
//func sumOfDigits(start: Int, end: Int) -> Int {
//// Your code goes here
//}
//sumOfDigits(7, 8) ➞ 15
//sumOfDigits(17, 20) ➞ 29
//sumOfDigits(10, 12) ➞ 6

