# EmojiTools

Tools for detecting emoji in strings and using emoji shortcut codes.

## Features
- supports all emojis including new ones released in iOS 9
- detect that a string contains emoji
- detect that a string contains emoji only, optionally allowing for whitespace (defaults to true)
- convert emoji shortcut codes in strings into their emoji equivalents
- get suggested emoji shortcut codes from a search string

##Requirements
Since EmojiTools is a dynamic framework, **iOS 8 or above is required**

##Manual Installation
To install EmojiTools manually:
  1. Download, clone, or submodule EmojiTools.
  2. Drag the **EmojiTools.xcodeproj** file into your project under the **Products** folder
  3. In your target's **Build Phases** settings, add **EmojiTools** to the **Target Dependencies** build phase.
  4. Add the **EmojiTools.framework** product to the **Link Binary With Libraries** build phase.
  5. If there is no **Copy Files** build phase, add one.
  6. Add **EmojiTools.framework** to the **Copy Files** build phase and set the destination to **Frameworks**

##Usage
Emoji Detection:
``` swift
import EmojiTools

func someFunction() {
    let emojiContainingString = "This 😀😎👩‍👩‍👧‍👧 string 🌲🐯🌛 has 🍉☕️🍻 a 🎆🏀🎼 lot 🚌🗽✈️ of 📞🔦✉️ emoji. 8️⃣🔡🕒"
    let containsEmoji = emojiContainingString.containsEmoji() // true 
    let emojiOnlyWhitespaceString = "😀😎👩‍👩‍👧‍👧 🌲🐯🌛 🍉☕️🍻 🎆🏀🎼   🚌🗽✈️     📞🔦✉️ 8️⃣🔡🕒"
    let containsEmojiOnly = emojiOnlyWhitespaceString.containsEmojiOnly() // true
    let containsEmojiOnlyAndNoWhitespace = emojiOnlyWhitespaceString.containsEmojiOnly(false) // false
}
```

Emoji Shortcut Codes
```swift
import EmojiTools

func someFunction() {
    let emojiShortcutCodeString = "The :monkey: is looking for a :banana: to sell for some :moneybag: at the :convenience_store:."
    let processedEmojiString = emojiShortcutCodeString.emojiString() // "The 🐒 is looking for a 🍌 to sell for some 💰 at the 🏪."
}
```

## Author
- [Todd Kramer](http://www.tekramer.com)

## License
EmojiTools is available under the MIT license. See the [full license here.](./LICENSE.txt)
