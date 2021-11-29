## [Flutter](https://flutter.dev/) app consuming weather API [OpenWeatherMap API](https://openweathermap.org/)

### About the project
This app requests and display the current weather (no forecast service) based on user's coordinates or by city/location/region name. This app is designed to have some workarounds avoiding lots of packages and fancy state management. Running this app for the first time leads you to an unauthorised exception since there is no available API key. You can get an API key [here](https://openweathermap.org/api/weather-map-2).

### Dependencies
* [http package v0.12.2](https://pub.dev/packages/http)
* [flutter_spinkit: ^4.1.2+1](https://pub.dev/packages/flutter_spinkit)
* [geolocator: ^7.0.3](https://pub.dev/packages/geolocator)
* [geocoding: latest](https://pub.dev/packages/geocoding)
* [countup: ^0.1.3](https://pub.dev/packages/countup)
* [provider: ^4.0.1](https://pub.dev/packages/provider)
* [flutter_bloc: ^7.0.0](https://pub.dev/packages/flutter_bloc)
* [app_settings: 4.1.1](https://pub.dev/packages/app_settings)
* [flat icons](https://www.flaticon.com/)
  * Icons made by the following authors from www.flaticon.com
    * smashingstocks
    * Creative Stall Premium
    * Freepik
    * Dreamstale
    * Eight Black Dots

### Screenshots

| intro |
| :-: |
| <img src="https://user-images.githubusercontent.com/66192808/143773295-9f2f3f1c-909a-4d7e-a821-f44b4cb39428.png" width="20%" height="15%"/> <img src="https://user-images.githubusercontent.com/66192808/143773294-67aa2528-24ff-45d7-abfb-9c39b945b8ee.png" width="20%" height="15%"/> |


| weather status| UI |
| :---: | :----:     |
| cloudy night  | <img src="https://user-images.githubusercontent.com/66192808/143773492-fb9eef04-652f-4509-9fbc-a8a400dd4f04.png" width="20%" height="15%"/>|
| clear day     | <img src="https://user-images.githubusercontent.com/66192808/143773496-c8fb7caf-df60-48e8-87d4-f5e52cc8ad37.png" width="20%" height="15%"/>|
| night rain    | <img src="https://user-images.githubusercontent.com/66192808/143773497-bbb1e7d5-a6a0-49d8-8fa0-739b406aa4c7.png" width="20%" height="15%"/> |
| clear night   | <img src="https://user-images.githubusercontent.com/66192808/143773499-5ae34279-43a5-43aa-bd4e-b8fa1dda7445.png" width="20%" height="15%"/>|

| http exception |
| :--: |
| <img src="https://user-images.githubusercontent.com/66192808/143775940-dfba99bb-2f1c-4d4a-91af-f956f63f74d4.png" width="20%" height="15%"/>  <img src="https://user-images.githubusercontent.com/66192808/143775939-05dc0130-f8e0-4cd3-ae88-b92d3afc1892.png" width="20%" height="15%"/>|

| location denied |
| :--: |
| <img src="https://user-images.githubusercontent.com/66192808/143775987-7522c75e-4a09-416d-a42f-3739e2e64771.png" width="20%" height="15%"/> <img src="https://user-images.githubusercontent.com/66192808/143775985-e673e3b2-7252-48b8-b9f3-932f331a0eb5.png" width="20%" height="15%"/>|

| no results found |
| :--: |
| <img src="https://user-images.githubusercontent.com/66192808/143776052-c5e74e64-03c5-4983-ae69-280c2c9f27b2.png" width="20%" height="15%"/> <img src="https://user-images.githubusercontent.com/66192808/143776053-13255976-02f2-4e5a-a638-22ebf4060a39.png" width="20%" height="15%"/>|

