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

func sumOfDigits(start: Int, end: Int) -> Int {
    var totalSum = 0
    
    for number in start...end {
        var num = number
        while num > 0 {
            totalSum += num % 10
            num /= 10
        }
    }
    
    return totalSum
}

sumOfDigits(start: 7, end: 8)
sumOfDigits(start: 17, end: 20)
sumOfDigits(start: 10, end: 12)


//3. მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს
//ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
//func isProperly(sequence: String) -> Bool {
//// Your code goes here
//}
//Examples:
//isProperly(sequence: "(()())") ➞ true
//isProperly(sequence: ")(()") ➞ false
//isProperly(sequence: "(()())(") ➞ false


func isProperly(sequence: String) -> Bool {
    var balance = 0
    
    for char in sequence {
        if char == "(" {
            balance += 1
        } else if char == ")" {
            balance -= 1
        }
        
    
        if balance < 0 {
            return false
        }
    }
    
    
    return balance == 0
}

isProperly(sequence: "(()())")
isProperly(sequence: ")(()")
isProperly(sequence: "(()())(")


//4. გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია
//გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ ფიცარზე ვერ გადავა)
//ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა.
//გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს.
//დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის
//მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)
//
//func countWays(n: Int, steps: [Int]) -> Int {
//
//// Your code goes here
//}
//Examples:
//countWays(n: 3, steps: [0, 1, 0]) ➞ 1
//countWays(n: 4, steps: [0, 1, 1, 0]) ➞ 1
//countWays(n: 5, steps: [1, 1, 0, 1, 1]) ➞ 4 // (s, 1, 2, 4, 5, f), (s, 1, 2, 4, f), (s, 2,
//4, 5, f), (s, 2, 4, f) s - ხიდის ერთი მხარე, f - ხიდის მეორე მხარე


func countWays(n: Int, steps: [Int]) -> Int {
    guard n > 0 else { return 0 }

    var way = Array(repeating: 0, count: n + 2)
    way[0] = 1

    for i in 1...n + 1 {
        if i == n + 1 || steps[i - 1] == 1 {
            
            if i >= 2 {
                way[i] = way[i - 1] + way[i - 2]
            }
 
            else {
                way[i] = way[i - 1]
            }
        } else {

            way[i] = 0
        }
    }
    return way[n + 1]
}
countWays(n: 3, steps: [0, 1, 0])
countWays(n: 4, steps: [0, 1, 1, 0])
countWays(n: 5, steps: [1, 1, 0, 1, 1])

//5. გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N!
//(ფაქტორიალი)
//შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.
//func zeros(N: Int) -> Int {
//// Your code goes here
//}
//example:
//zeros(N: 7) ➞ 1
//zeros(N: 12) ➞ 2
//zeros(N: 490) ➞ 120

func zeros(N: Int) -> Int {
    var count = 0
    var divisor = 5
    
  
    while divisor <= N {
        count += N / divisor
        divisor *= 5
    }
    
    return count
}

zeros(N: 7)
zeros(N: 12)
zeros(N: 490)
