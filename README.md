# Health Hub

Health Hub is a mobile application focused on health and fitness, where users can post articles and read articles. The app is developed using Flutter for the frontend, GetX for state management, and PHP for the backend.

## Features

- **User Authentication:** Sign up and login functionalities.
- **Post Articles:** Users can create and post their health and fitness articles.
- **Read Articles:** Users can browse and read articles posted by others.
- **User Profiles:** Users can view and edit their profiles.
- **Real-time Updates:** Articles and profiles are updated in real-time.

## Technology Stack

- **Frontend:** Flutter
- **State Management:** GetX
- **Backend:** PHP
- **Database:** MySQL
- **API:** RESTful APIs for backend communication

## Getting Started

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- GetX: [GetX Package](https://pub.dev/packages/get)
- PHP: [Installation Guide](https://www.php.net/manual/en/install.php)
- MySQL: [Installation Guide](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ismaildrs/health-hup-app
   cd health-hub-app
   ```

2. **Install Flutter dependencies:**
   ```sh
   flutter pub get
   ```

3. **Set up the backend:**
   - Make sure you have PHP and MySQL installed.
   - Create a database named `health_hub_db`.
   - Follow instructions in the `PHP_backend` directory to set up your backend.

4. **Run the PHP server:**
   ```sh
   php -S localhost:8000 -t backend
   ```

5. **Configure the Flutter app:**
   - Update the base URL in the `lib/api_connection/api_connection.dart` to point to your local PHP server:
     ```dart
     static const String path = "You're ip adress";
     ```

6. **Run the Flutter app:**
   ```sh
   flutter run
   ```

## Project Structure

```plaintext
health-hub-app/
│
├── PHP_backend/               
│   ├── api_health_hub/         # PHP backend files
│   ├── health_hub_db/          # SQL 
│
├── lib/                   # Flutter project files
│   ├── api_connection/      
│   ├── pages/           
│   ├── users/             
│   ├── main.dart          # Main entry point
│
├── assets/                # Images
│
├── pubspec.yaml           # Flutter dependencies
│
└── README.md              # Project readme
```

## Usage

- **Sign Up/Login:** Create an account or log in to access the app.
- **Post an Article:** Go to the "Post Article" section, write your article, and submit.
- **Read Articles:** Browse through the list of articles on the home screen.
- **Edit Profile:** Navigate to your profile to view or edit your information.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a pull request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
