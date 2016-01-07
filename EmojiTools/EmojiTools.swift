//
//  EmojiTools.swift
//  EmojiTools
//
//  Copyright © 2016 Todd Kramer.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

extension String {
    
    public func emojiString() -> String {
        return String.emojiStringFromString(self)
    }
    
    public static func emojiStringFromString(inputString: String) -> String {
        var token: dispatch_once_t = 0
        var regex: NSRegularExpression? = nil
        dispatch_once(&token) {
            let pattern = "(:[a-z0-9-+_]+:)"
            regex = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        }
        
        var resultText = inputString
        let matchRange = NSMakeRange(0, resultText.characters.count)
        regex?.enumerateMatchesInString(resultText, options: .ReportCompletion, range: matchRange, usingBlock: { (result, _, _) -> Void in
            guard let range = result?.range else { return }
            if range.location != NSNotFound {
                let emojiCode = (inputString as NSString).substringWithRange(range)
                if let emojiCharacter = emojiShortCodes[emojiCode] {
                    resultText = resultText.stringByReplacingOccurrencesOfString(emojiCode, withString: emojiCharacter)
                }
            }
        })
        
        return resultText
    }

    public func containsEmoji() -> Bool {
        return String.containsEmoji(self)
    }

    public static func containsEmoji(string: String) -> Bool {
        for scalar in string.unicodeScalars {
            if scalar.isEmoji() {
                return true
            }
        }
        return false
    }

    public func containsEmojiOnly(allowWhitespace: Bool = true) -> Bool {
        return String.containsEmojiOnly(self, allowWhitespace: allowWhitespace)
    }
    
    public static func containsEmojiOnly(string: String, allowWhitespace: Bool = true) -> Bool {
        var inputString = string
        if allowWhitespace {
            inputString = string.stringByReplacingOccurrencesOfString(" ", withString: "")
        }
        for scalar in inputString.unicodeScalars {
            if !scalar.isEmoji() {
                return false
            }
        }
        return true
    }
    
}

extension UnicodeScalar {

    public func isEmoji() -> Bool {
        return UnicodeScalar.isEmoji(self)
    }

    public static func isEmoji(scalar: UnicodeScalar) -> Bool {
        return emojis.unicodeScalars.contains(scalar)
    }
}

public struct EmojiCodeSuggestion {
    let code: String
    let character: String
}

public struct EmojiTools {

    public static func emojiCodeSuggestionsForSearchTerm(searchTerm: String) -> [EmojiCodeSuggestion] {
        let keys = Array(emojiShortCodes.keys)
        let filteredKeys = keys.filter { (key) -> Bool in
            return key.containsString(searchTerm)
            }.sort()
        let unicodeCharacters = filteredKeys.map({ emojiShortCodes[$0]! })
        var suggestions = [EmojiCodeSuggestion]()
        for index in 0...(filteredKeys.count - 1) {
            let suggestion = EmojiCodeSuggestion(code: filteredKeys[index], character: unicodeCharacters[index])
            suggestions.append(suggestion)
        }
        return suggestions
    }

}