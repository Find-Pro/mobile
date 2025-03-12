# Find Pro
Find Pro is a completely free innovative platform that connects professional service providers and customers. It's easy to find electricians, plumbers, software developers, cleaners and much more!

Available on online stores :
https://play.google.com/store/apps/details?id=com.kok.findpro

https://apps.apple.com/us/app/find-pro/id6740331723?platform=iphone

Features:
View professional profiles.Create your service requests.Communicate directly through the app.Make the best choice by reading trusted user reviews.
Getting or providing services has never been easier with Find Pro. Download now and discover professionals! It's available int 10 country.

I also prepared Backend app for this application with NodeJS Express.
[link](https://github.com/Find-Pro/server)

# Features
Auth system<br>
Friend management (search, follow,block)<br>
Real-Time chat <br>
Push Notification
## Dependencies
- state management
  * [riverpod](https://pub.dev/packages/flutter_riverpod)
- navigation
  * [auto_route](https://pub.dev/packages/auto_route)
- services
  * [dio](https://pub.dev/packages/dio)
  * [web_socket_channel](https://pub.dev/packages/web_socket_channel)
  * [onesignal_flutter](https://pub.dev/packages/onesignal_flutter)
- cache
  * [shared_preferences](https://pub.dev/packages/hive)
- Utils
  * [logger](https://pub.dev/packages/logger)
  * [json_annotation](https://pub.dev/packages/json_annotation)
  * [freezed](https://pub.dev/packages/freezed)
- UI
  * [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
  * [flutter_svg](https://pub.dev/packages/flutter_svg)
- dev_dependencies
  * [build_runner](https://pub.dev/packages/build_runner)
  * [auto_route_generator](https://pub.dev/packages/auto_route_generator)
  * [json_serializable](https://pub.dev/packages/json_serializable)
  * [very_good_analysis](https://pub.dev/packages/very_good_analysis)
 
  ## Images
  ![Apple iPhone 16 Pro Max Screenshot 8](https://github.com/user-attachments/assets/c4efef8e-1cb0-4aa8-873a-1852dc13b5f8)
![Apple iPhone 16 Pro Max Screenshot 7](https://github.com/user-attachments/assets/1ed742de-bc1d-4594-9b20-813559a8c47b)
![Apple iPhone 16 Pro Max Screenshot 6](https://github.com/user-attachments/assets/2352c413-c3da-4076-ad30-4e448c466aed)
![Apple iPhone 16 Pro Max Screenshot 5](https://github.com/user-attachments/assets/cde7af70-20f9-4bbd-b3c2-4f8a65c41c40)
![Apple iPhone 16 Pro Max Screenshot 4](https://github.com/user-attachments/assets/0e268b3a-c90e-488f-bf75-fcecae76317f)
![Apple iPhone 16 Pro Max Screenshot 3](https://github.com/user-attachments/assets/b1a71678-9198-4624-a88a-746c49509845)
![Apple iPhone 16 Pro Max Screenshot 2](https://github.com/user-attachments/assets/d410c049-b30d-44dc-b1ac-d01dd622736f)
![Apple iPhone 16 Pro Max Screenshot 1](https://github.com/user-attachments/assets/4d8cac24-8eab-40c7-9981-83ab63b28b94)
![Apple iPhone 16 Pro Max Screenshot 9](https://github.com/user-attachments/assets/71932b45-17e0-427d-b761-aef77256a84b)


install flutter packages
```
dart run build_runner build --delete-conflicting-outputs
```
create localization keys
```
dart run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations/ -o locale_keys.g.dart -S assets/translations/
```
run project
```
flutter run 
```

