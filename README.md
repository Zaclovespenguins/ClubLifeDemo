# Club Life App Demo

## Why this was created
I learn by doing, and initially I intended to fully redesign the club life app just on iOS to start my own portfolio. I started putting it together and had the thought I should look at cross platform solutions for SwiftUI which led me to trying out Skip Tools. 

I originally wasn't going to ask about App Developer positions at Peak since I've focused mostly on Swift and Peak doesn't really use that language anywhere. After looking at Skip and looking at competitor apps, however, I had the thought that it would be mutually beneficial for Peak to have a dedicated mobile developer that already has been with Peak for a couple years, and myself to get real experience.

Additionally, with the redesign of our internal systems for V2 it would be a great time to start planning an app overhaul (If that's not already in the works) to take advantage of V2 and create an app that stands out from what competitors have to offer. 

## How to build
### Built packages
I've included both an APK and IPA in the root directory of this repo that can be sideloaded onto an iOS/Android device. The app will function on tablets, but it looks very silly. 
### Requirements
- MacOS 13 or above
- XCode 16
- Homebrew
- Android Studio 2023 or above

To install Skip via Homebrew just run this command:

```
brew install skiptools/skip/skip
```
and then check the installation by running:
```
skip checkup
```

They have a getting started guide that covers some common issues here: 
https://skip.tools/docs/gettingstarted/

Once that's completed, clone this repo and open the project file in Xcode
```
club-life/Darwin/ClubLifeSwiftRewrite.xcodeproj
```
To build the app make sure you have either and ADB enabled Android device connected or a simulator running. It will crash otherwise.

## Expected behavior by area
### Home Tab
- Keycard button - Top bar
-- Expected to create a modal view on tap that has the user's name, member since date, QR Code, barcode and an "Add to Google/Apple Wallet" button. 
-- Adding to the wallet is only functional on iOS currently, as it creates a view in the app while Google Wallet must suspend the app and send the pass JWT to the Google Wallet app itself which causes some concurrency issues in Kotlin that I wasn't able to figure out in a timely manner.

- Notification Bell - Top bar
-- Expected to do nothing when tapped.
- Show Club hours button
-- Expected to do nothing when tapped
- Refer a Friend Button
-- Expected to create a share sheet with "Example.com".
- Check In Button
-- Expected to do nothing when tapped
- MyZONE Button
-- Expected to do nothing when tapped

### Calendar Tab
- Plus Button
-- Expected to do nothing when tapped
- Club Schedule and My Schedule picker
-- Expected to change the view from all services to just the ones that have been "Joined!"
- Search Bar
-- Expected to search against the service name
- Join Button on each service
-- Expected to change from "Join" to "Joined!" when tapped, and that service should now appear on the My Schedule tab

### Account Tab
- Payment Method, Usage History and Transaction History
-- Expected lead to a blank page
- Feedback
-- Expected to create a modal view where the user can input text. Does not send anything. 
- Privacy Policy
-- Opens the default web browser to Peak's Privacy Policy
- Link Employee Account
-- Expected to do nothing when tapped
- Log Out
--  Expected to do nothing when tapped


## Technologies used
### Skip Tools
Skip tools is a transpiler, which offers several advantages over a cross platform frameworks like Flutter or React Native. Specifically, in my experience, they tend to have memory and processing overhead that causes issues for more complex apps and limitations when implementing platform specific features like Apple Pay or Google Health integration.

Skip doesn't require any runtime overhead on either platform by transpiling from Swift to Kotlin and then compiling both Android and iOS versions of the app from their native language. It also side steps any limitations with platform specific features by allowing the developer to create native views in Kotlin and Compose for Android or Swift and SwiftUI for iOS and insert them with compiler directives. 
