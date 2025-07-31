#  DoctorClinic - Flutter Appointment Booking App

DoctorClinic is a full-featured Flutter-based healthcare appointment app that allows **patients to book appointments with doctors**, view doctor profiles, track locations, and manage their health seamlessly. Built with **Firebase**, it supports both **doctor and patient roles** with user authentication, profile management, chat system, and real-time updates.

---

##  Features

### Authentication
- Firebase Email/Password login & signup
- Role-based registration (Doctor / Patient)
- Profile image upload via Firebase Storage
- Location permission & geo-coordinates saving

### For Doctors
- Register with details (specialization, experience, etc.)
- Upload profile image and location
- View scheduled appointments
- See reviews and ratings (if implemented)
- Real-time appointment booking updates

###  For Patients
- Browse doctors by category & city
- View detailed doctor profiles
- Book an appointment with preferred date/time
- View upcoming appointments
- Real-time chat with booked doctors

###  Chat System
- Real-time 1:1 chat between doctors and patients (Firebase Realtime Database)

### Location Tracking
- Stores doctor's latitude and longitude at registration
- Supports showing location in doctor details (Map integration optional)

### Firebase Integration
- Firebase Authentication (Login, Signup)
- Firebase Firestore for storing users, appointments, and doctor data
- Firebase Storage for profile images
- Firebase Realtime Database for chat messages

---

## App Demo 
[Click here to watch the demo video](https://drive.google.com/file/d/1FaS-19xhik5V3YZT9YWTIXgLGyAPm9qR/view?usp=drive_link)










## Tech Stack

- **Flutter** – Cross-platform UI framework
- **Firebase Auth** – User authentication
- **Cloud Firestore** – Data storage (users, appointments)
- **Firebase Storage** – Image uploads
- **Firebase Realtime Database** – Chat messages
- **Provider** – State management
- **Shared Preferences** – Local storage (optional)

---

###  Prerequisites

- Flutter 3.x or later
- Firebase account & project
- Android Studio / Xcode
- Enable the following in Firebase:
  - Authentication → Email/Password
  - Firestore Database
  - Realtime Database
  - Storage

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Mohitchaudhary0015/doctorclinic_app.git
   cd doctorclinic_app

