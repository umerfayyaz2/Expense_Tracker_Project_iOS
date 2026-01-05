import Foundation

enum ConsoleUtils {

    static func clearScreen() {
        #if os(Windows)
            _ = system("cls")
        #else
            _ = system("clear")
        #endif
    }

    static func pause() {
        print("\nPress Enter to continue...")
        _ = readLine()
    }

    static func readInt(prompt: String) -> Int {
        while true {
            print(prompt, terminator: " ")
            if let input = readLine(), let value = Int(input) {
                return value
            }
            print("Invalid input. Enter a number.")
        }
    }

    static func readString(prompt: String) -> String {
        print(prompt, terminator: " ")
        return readLine() ?? ""
    }
}
