# 🏟️ Derpy

Official Flutter mobile application for **Derpy**, a modern sports field booking platform that enables users to discover, book, and manage football and padel courts with a seamless mobile experience.

---

## 📱 Overview

Derpy is a mobile application designed to simplify the process of booking sports fields. Users can browse available venues, check schedules, make reservations, manage bookings, and enjoy a smooth and modern experience.

---

## ✨ Features

- 🔐 Authentication
- 🏟️ Browse Sports Fields
- 📅 Book & Manage Reservations
- 📍 Search & Filter Fields
- ❤️ Favorite Fields
- ⭐ Ratings & Reviews
- 👤 User Profile
- 🔔 Push Notifications
- 🌙 Dark & Light Theme

---

## 🏗️ Architecture

This project follows modern Flutter best practices.

- Feature-First Architecture
- Clean Architecture
- Cubit / Bloc State Management
- Repository Pattern
- Dependency Injection
- Scalable Project Structure

---

## 📂 Project Structure

```text
lib
│
├── app
│
├── core
│   ├── constants
│   ├── dependency_injection
│   ├── errors
│   ├── helpers
│   ├── network
│   ├── routing
│   ├── services
│   ├── storage
│   ├── theme
│   ├── utils
│   └── widgets
│
├── features
│   ├── auth
│   ├── onboarding
│   ├── home
│   ├── booking
│   └── profile
│
└── main.dart
```

---

## 🛠️ Tech Stack

### Framework

- Flutter

### State Management

- flutter_bloc
- bloc

### Networking

- Dio

### Dependency Injection

- GetIt

### Local Storage

- Shared Preferences

### Responsive UI

- flutter_screenutil

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/YallaHagz/Derpy-Mobile.git
```

### Install packages

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

---

## 🌿 Git Workflow

```
main
│
└── develop
      │
      ├── feature/onboarding
      ├── feature/auth
      ├── feature/home
      ├── feature/profile
      └── feature/booking
```

### Development Flow

1. Create a feature branch from `develop`.
2. Implement the feature.
3. Commit changes.
4. Push the feature branch.
5. Open a Pull Request to `develop`.
6. Merge after review.
7. Merge `develop` into `main` for releases.

---

## 💬 Commit Convention

```text
feat: add login screen
fix: resolve booking issue
refactor: improve navigation
docs: update README
style: format project
chore: update dependencies
```

---

## 👥 Team

Developed by the Flutter Team at **Derpy**.

---

## 📄 License

This project is private and intended for internal development only.

©Derpy