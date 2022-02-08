"# todo_app_clean_architecture"
A simple clean architecture flutter todo app with using firebase auth and database.

### TO START PROJECT ###

Run code generation
```flutter packages pub run build_runner build --delete-conflicting-outputs```

Run localization keys generation
```flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations -O lib/src/presentation/base/localization```