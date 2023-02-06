# Numbers

[![CI](https://github.com/ubuntu-flutter-community/numbers/actions/workflows/ci.yaml/badge.svg)](https://github.com/ubuntu-flutter-community/numbers/actions/workflows/ci.yaml)

This sample application is powered by [numbersapi.com](http://numbersapi.com/#42)
and [Flutter](https://flutter.dev), a cross-platform UI toolkit by Google.

| Linux | macOS | Web | Windows |
|---|---|---|---|
| ![Linux](https://raw.githubusercontent.com/ubuntu-flutter-community/numbers/main/screenshots/linux.png) | ![macOS](https://raw.githubusercontent.com/ubuntu-flutter-community/numbers/main/screenshots/macos.png) | ![Web](https://raw.githubusercontent.com/ubuntu-flutter-community/numbers/main/screenshots/web.png) | ![Windows](https://raw.githubusercontent.com/ubuntu-flutter-community/numbers/main/screenshots/windows.png) |

The purpose of this project is to act as a starting point and demonstrate the
ease and simplicity of using the following [Yaru](https://github.com/ubuntu/yaru)
libraries:
- [yaru](https://pub.dev/packages/yaru):
  The distinct look and feel of the Ubuntu Desktop
- [yaru_icons](https://pub.dev/packages/yaru_icons):
  Ubuntu Yaru icons for Flutter
- [yaru_widgets](https://pub.dev/packages/yaru_widgets):
  Common widgets for building desktop and web applications

The main application layout and page navigation are provided by
[YaruNavigationPage](https://pub.dev/documentation/yaru_widgets/latest/yaru_widgets/YaruNavigationPage-class.html),
which is a high-level building block for creating applications with a
[navigation rail](https://m3.material.io/components/navigation-rail/overview)
and a stack of pages.

This sample aims to provide a clean starting point with a structure that scales
well and is easy to maintain and test. The pages are implemented using the
[MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)
pattern to separate the UI from the business logic, and the REST API calls are
handled by a [service layer](https://en.wikipedia.org/wiki/Service_layer_pattern)
accessed via a [service locator](https://en.wikipedia.org/wiki/Service_locator_pattern).

There are [many ways](https://docs.flutter.dev/development/data-and-backend/state-mgmt/options)
to manage state in Flutter. This project uses the recommended
[simple state management](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple)
approach together with the [provider](https://pub.dev/packages/provider) package.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/numbers)

## Getting Started

Follow the instructions to [install Flutter](https://docs.flutter.dev/get-started/install)
and run the following commands:

```
git clone https://github.com/ubuntu-flutter-community/numbers.git
cd numbers
flutter pub get
flutter run
```

## Testing

Flutter comes with great support for [testing](https://docs.flutter.dev/testing),
and this project uses various [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection)
techniques to make the code well testable.

There are various types of tests included:
- [unit test](https://github.com/ubuntu-flutter-community/numbers/blob/main/test/numbers_test.dart) (see [introduction to unit testing](https://docs.flutter.dev/cookbook/testing/unit/introduction))
- [widget test](https://github.com/ubuntu-flutter-community/numbers/blob/main/test/app_test.dart) (see [introduction to widget testing](https://docs.flutter.dev/cookbook/testing/widget/introduction))
- [golden file test](https://github.com/ubuntu-flutter-community/numbers/blob/main/test/color_indicator_test.dart) (see [golden file testing](https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html#golden-file-testing))
- [integration test](https://github.com/ubuntu-flutter-community/numbers/tree/main/integration_test) (see [introduction to integration testing](https://docs.flutter.dev/cookbook/testing/integration/introduction))

## License

| **NOTE:** Remember to update the [LICENSE](LICENSE) file with the license of your choice when using this template as a starting point for your own project. |
| --- |

The sample code in this repository is free to use or any purpose, commercial or
non-commercial, and by any means.

```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
