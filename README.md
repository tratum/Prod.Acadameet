# Acadameet
![GitHub license](https://img.shields.io/badge/license-Apache_2.0-blue.svg)
<br>

A Web App that books appointments physical or video meeting between students and and their college faculty.

## Installation
1. Clone the repository
   ```bash
   git clone https://github.com/tratum/Acadameet.git
   ```
2. Navigate to the project directory
   ```bash
   cd Acadameet
   ```
3. Install Dependencies
   ```bash
   flutter pub get 
   ```
4. Run the WebApp
   ```bash
   flutter run -d chrome/edge
   ```
5. To Rebuild the WebApp
   ```
   flutter build web --web-renderer auto --profile
   ``` 
   <br>

## Configuration
1. Create `keys.dart` file in lib/config/
   <br>

   ```bash
   cd lib/config
   touch keys.dart    
   ```
2. Populate `keys.dart`
   <br>
    
   ```
   const String tenant = "organizations";
   const String redirectUrl = "REDIRECT_URI";
   const String scope = "SCOPES";
   const String clientID = "CLIENT_ID";
   const String firebaseSecretKey = "SECRET_KEY";
   ```    
<br>

## Contribution
Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.
<br>

## License
This project is licensed under the Apache-2.0 license. See the [LICENSE](LICENSE) file for details
<br>
