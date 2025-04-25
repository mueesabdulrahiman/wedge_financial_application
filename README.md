# wedge_financial_appliation

## Requirements

To run this project on macOS:

### General Setup
- macOS Ventura or later
- Flutter SDK (Install from [flutter.dev](https://flutter.dev/docs/get-started/install))
- Visual Studio Code or Android Studio
- Internet connection (for fetching dependencies)


Run this to verify setup:

```bash
flutter doctor
```

#### Environment Setup (after installing Flutter SDK)

Open your terminal and add the following line to your .zshrc file (replace your-username with your actual mac username):

```bash
export PATH="$PATH:/Users/your-username/flutter/bin"
```
- Then run:

```bash
source ~/.zshrc   
```

### Android
- Android Studio with Android SDK & AVD Manager
- A physical Android device with Developer Mode + USB Debugging enabled (optional)

### iOS
- Xcode (latest stable version from the Mac App Store)
- CocoaPods (install via sudo gem install cocoapods or brew install cocoapods)
- A physical iPhone device with Developer Profile (optional)
- Apple Developer Account for physical device testing (optional)

## Getting Started

After installing the requirements, clone and install dependencies:

```bash
git clone https://github.com/yourusername/hedge-wealth-project.git
cd hedge-wealth-project
flutter pub get
```
iOS Only – Install CocoaPods:

```bash
cd ios
pod install
cd ..
```
## Running the App

### Android

#### Run on Android Emulator

- Open Android Studio
- Launch an emulator via AVD Manager
- Run using the Run button, or use Terminal:

```bash
flutter run
```

#### Run on Physical Android Device

- Connect your Android phone via USB
- Enable USB Debugging in Developer Options
- Confirm device is detected:

```bash
flutter devices
```
- Run the app:

```bash
flutter run
```

### iOS

#### Run on iOS Simulator

- Open Simulator via Xcode or Terminal:

```bash
open -a Simulator
```
 - Or boot a specific simulator:

 ```bash
xcrun simctl list devices
xcrun simctl boot "iPhone 14 Pro"
```

- Then run:

```bash
flutter run
```

#### Run on Physical iPhone

- Connect iPhone via USB
- Trust the Mac from the iPhone popup
- Ensure Developer Mode is enabled on the iPhone (Settings → Privacy & Security → Developer Mode → ON)
- In Terminal:

```bash
flutter devices
flutter run
```

##### Note: You must open the iOS project in Xcode (open ios/Runner.xcworkspace) and set up a valid signing team for first-time physical device use.

### Using VS Code (Android & iOS)

#### iOS (Simulator or Physical)

- Open the project in VS Code
- Plug in iPhone and tap "Trust This Computer" if asked
- Select the iOS device or simulator from the bottom status bar
- Or launch Simulator manually:

```bash
open -a Simulator
```

- Run the app: Press F5 or
- Run in Terminal:

```bash
flutter run
```

#### Android (Emulator or Physical)

- Start emulator:
- Press Cmd+Shift+P → Type Flutter: Launch Emulator → Choose emulator
- Or connect physical Android device via USB
- Select device from bottom status bar in VS Code
- Run the app: Press F5 or
- In Terminal:

```bash
flutter run
```

#### All setup steps and run instructions should work without issues if dependencies are installed correctly. For troubleshooting, use:

```bash
flutter doctor -v
```













