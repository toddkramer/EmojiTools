//
//  EmojiToolsTests.swift
//  EmojiToolsTests
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

import XCTest
@testable import EmojiTools

class EmojiToolsTests: XCTestCase {

    let nonEmojiString = "This string does not contain emoji."
    let emojiString = "This 😀😎👩‍👩‍👧‍👧 string 🌲🐯🌛 has 🍉☕️🍻 a 🎆🏀🎼 lot 🚌🗽✈️ of 📞🔦✉️ emoji. 8️⃣🔡🕒"
    let emojiOnlyWhitespaceString = "😀😎👩‍👩‍👧‍👧 🌲🐯🌛 🍉☕️🍻 🎆🏀🎼   🚌🗽✈️     📞🔦✉️ 8️⃣🔡🕒"
    let emojiOnlyString = "😀😎👩‍👩‍👧‍👧🌲🐯🌛🍉☕️🍻🎆🏀🎼🚌🗽✈️📞🔦✉️8️⃣🔡🕒"
    let emojiCodeString = "The :monkey: is trying to buy a :banana: with some :moneybag: at the :convenience_store:."

    func testContainsEmoji() {
        XCTAssertFalse(nonEmojiString.containsEmoji())
        XCTAssertTrue(emojiString.containsEmoji())
        XCTAssertTrue(emojiOnlyWhitespaceString.containsEmoji())
        XCTAssertTrue(emojiOnlyString.containsEmoji())
    }

    func testContainsEmojiOnly() {
        XCTAssertFalse(nonEmojiString.containsEmojiOnly())
        XCTAssertFalse(emojiString.containsEmojiOnly())
        XCTAssertFalse(emojiOnlyWhitespaceString.containsEmojiOnly(false))
        XCTAssertTrue(emojiOnlyWhitespaceString.containsEmojiOnly())
        XCTAssertTrue(emojiOnlyString.containsEmojiOnly())
        XCTAssertTrue(emojiOnlyString.containsEmojiOnly(false))
    }

    func testEmojiString() {
        let processedEmojiString = "The 🐒 is trying to buy a 🍌 with some 💰 at the 🏪."
        XCTAssertEqual(emojiCodeString.emojiString(), processedEmojiString)
    }

}
