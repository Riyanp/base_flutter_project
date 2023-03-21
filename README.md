
# Flutter Base Project
## A flutter base project with clean use cases and cubit implementation

These current project include several features but are not limited to:

- Using Cubits instead of BLoC for state management.
- Every Cubit has its own use case to make it easier to use and track.
- Compatible with Android, iOS and Web.
- This project avoid the use of bloc builder and only use bloc listener to make it more tidy and readable.

## Installation

This repository requires [Flutter](https://flutter.dev/docs/get-started/install) to be installed and present in your development environment.

- Clone the project and enter the project folder.
- Get the dependencies.
```sh  
flutter pub get  
```  

## Run App
This project has 3 flavor; develop, staging and production. Each flavor has it own local env values that can be setup in `develop.env` | `staging.env` | `production.env`, you can check `app_config.dart` to see the detailed usages or add additional values.

### Run the app via command line.
```sh  
flutter run lib/main.dart  
```

Additional run or build options based on flavors.

### Develop
```sh
flutter run --flavor develop --target lib/main_develop.dart
```

### Staging
```sh
flutter run --flavor staging --target lib/main_staging.dart
```

### Production (currently using default main.dart for production)
```sh
flutter run --flavor production
```

Alternatively we can create new configurations in Android studio to make it easier to run the app.
Also, we can use Makefile to run some command and make it easier.

## Additional commands

- update app icon `flutter pub run flutter_launcher_icons:main`
- update app native splash screen `flutter pub run flutter_native_splash:create --path=/Users/riyanpramana/Documents/GitHub/flutter-skeleton-dugoy/flutter_native_splash.yaml`

## TODO(s)

- rename `base_flutter_project` to use it for a new project.
- you can remove unused lib (i'm too lazy to check which one is unused, lol).
- refactor the HTTP service to make it more readable and easier to use.
- use retrofit or dio for networking.

