# README

# Switch Up

An animated toggle switch which can be fully customized with desired width, colors, text, corner radius, animation etc. It also maintains selection state.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:  ...  switch_up: latest_version
```

Import it:

```dart
import 'package:switch_up/switch_up.dart';
```

## Usage Examples

```dart
// Here, default theme color are used for selected item.
CustomSwitch<String>(
  backgroundColor: Colors.grey.shade200,
  items: const <String>['Home', 'Chat', 'Settings'],
  onChanged: (String value) {
    print(value);
  },
  value: 'Settings',
),
```

![ezgif.com-gif-maker(3).gif](https://github.com/ketan-glitch/switch_up/tree/master/assets/1.gif)

### Switch Up with custom Height, Color and Animation

```dart
CustomSwitch(
  backgroundColor: Colors.grey.shade200,
  color: Colors.amber,
  radius: 0,
	height: 50,
	curves: Curves.easeInOutBack,
  items: const ['Active', 'Pending'],
  onChanged: (value) {
    print(value);
  },
  value: 'Pending',
),
```

![ezgif.com-gif-maker(4).gif](https://github.com/ketan-glitch/switch_up/tree/master/assets/2.gif)

### Switch Up with a Gradient Color

```dart
CustomSwitch(
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF941F37),
      Color(0xFF590012),
    ],
  ),
  curves: Curves.bounceOut,
  backgroundColor: Colors.grey.shade200,
  items: const ['Male', 'Female', 'Other'],
  onChanged: (value) {
    print(value);
  },
  value: 'Female',
),
```

![ezgif.com-gif-maker(5).gif](https://github.com/ketan-glitch/switch_up/tree/master/assets/3.gif)

```dart
CustomSwitch(
  backgroundColor: Colors.grey.shade200,
  radius: 40,
  gradient: const RadialGradient(
    radius: 10,
    colors: [
      Color(0xFF941F37),
      Color(0xFF590012),
    ],
  ),
  curves: Curves.easeInOutQuart,
  items: const ['Normal', 'Bold', 'Italic'],
  onChanged: (value) {
    log(value);
  },
  value: 'Bold',
),
```

![ezgif.com-gif-maker(6).gif](https://github.com/ketan-glitch/switch_up/tree/master/assets/4.gif)

Switch Up with Custom Models

```dart
// Add toString() to your Custom model class
//   @override
//   String toString() {
//     return name;
//   } 
CustomSwitch<States>(
  backgroundColor: Colors.pink.withOpacity(.1),
  radius: 10,
  height: 60,`
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFC466B),
      Color(0xFF3F5EFB),
    ],
  ),
  curves: Curves.easeInOutQuart,
  items: states,
  onChanged: (States value) {
    if (kDebugMode) {
      print(value);
    }
  },
  value: states[2],
),

```

![ezgif.com-gif-maker(7).gif](https://github.com/ketan-glitch/switch_up/tree/master/assets/5.gif)

With icons, text and different active background colors

[Example code with explanation](https://github.com/ketan-glitch/switch_up/tree/master/example)