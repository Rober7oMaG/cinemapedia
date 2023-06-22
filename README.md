# cinemapedia

# Dev

1. Copy ```.env.template``` file amd rename it to ```.env```
2. Change environment variables (TheMovieDB)
3. For changes on entities, execute the command
```
flutter pub run build_runner build
```

# Prod
Change application's name:
```
flutter pub run change_app_package_name:main dev.robertomacias.cinemapedia
```

To change application's icon:
```
flutter pub run flutter_launcher_icons
```

To change splash screen:
```
flutter pub run flutter_native_splash:create
```
