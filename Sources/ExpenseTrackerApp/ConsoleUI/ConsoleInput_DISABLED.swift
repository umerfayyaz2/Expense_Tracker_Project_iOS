// import Foundation

// enum ConsoleInput {

//     static func readString(prompt: String) -> String {
//         print(prompt, terminator: " ")
//         return readLine() ?? ""
//     }

//     static func readDouble(prompt: String) -> Double {
//         while true {
//             let input = readString(prompt: prompt)
//             if let value = Double(input) {
//                 return value
//             }
//             print("Invalid number. Try again.")
//         }
//     }

//     static func readInt(prompt: String) -> Int {
//         while true {
//             let input = readString(prompt: prompt)
//             if let value = Int(input) {
//                 return value
//             }
//             print("Invalid choice. Try again.")
//         }
//     }
// }
