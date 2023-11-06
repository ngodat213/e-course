# E-Course

E-Course is a mobile application that provides access to your ERPNext desk or any other Frappe desk from your smartphone.

<kbd><img width="216" height="432" src="screenshots/homepage.jpg" alt="Desk" /></kbd>
<kbd><img width="216" height="432" src="screenshots/course.jpg" alt="Awesome Bar" /></kbd>
<kbd><img width="216" height="432" src="screenshots/quiz.jpg" alt="Form View" /></kbd>

## Overview
E-Course is a powerful mobile application that brings the ERPNext desk and Frappe desk experience to your smartphone. With E-Course, you can conveniently manage your courses, participate in quizzes, and access educational content on the go. This application is designed to enhance your learning and course management experience.

## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Development](#development)
  - [Setup](#setup)
  - [Running the Project](#running-the-project)
- [Architecture](#architecture)

## Features
1. **User Authentication**: Includes login, signup, and password recovery functionality.
2. **Home Page**: Easily view all courses and search for specific ones.
3. **Course Management**: Access comments, reviews, and watch course videos.
4. **Quizzes**: Participate in quizzes with multiple-choice questions, view your results, and check your answers.
5. **Settings**: Manage your user account settings, choose between multiple languages (Vietnamese and English), mark courses as favorites, learn more about us, get in touch through contact information, and log out.

## Technologies
1. **Firebase**: Utilizes Firebase for authentication, storage, realtime database, and Firestore database.
2. **Cloudinary**: Employs Cloudinary for various cloud services.

## Development

### Setup
To run this project, ensure you have [Flutter](https://flutter.dev/docs/get-started/install) set up.

1. Install the required packages:
```sh
  flutter pub get
```   
2. Run the Project<br/>
```sh
  flutter run
```

### Architecture

This Project roughly follows MVVM Architecture where each screen has seperate file and each stateful screen is contained in a folder with 2 files 

1) View file (layout logic) 
2) View Model File (data processing and state management). 

This Project uses [provider](https://pub.dev/packages/provider) for State Management. 
[bloc](https://pub.dev/packages/bloc), [shared_preferences](https://pub.dev/packages/shared_preferences) for storage. 
[firebase](https://firebase.google.com/docs?hl=vi) for making network requests.
