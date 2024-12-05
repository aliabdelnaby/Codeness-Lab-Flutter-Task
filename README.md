# Codeness Lab Flutter Task
This Flutter application fetches a list of items from a public API, allowing users to view, search, and tap on items to view detailed information. The app is built using GetX for state management, routing, and dependency injection, with a clean architecture following the MVVM pattern.

## Demo
https://github.com/user-attachments/assets/76732171-c97a-4338-b1a5-a9ce439da5fa

## Features
* View a list of items fetched from a public API (e.g., JSONPlaceholder).
* Search functionality to filter the list of items.
* Item detail view: Tap on an item to navigate to a new screen displaying detailed information.
* Loading indicator while data is being fetched.
* Error handling: Graceful error handling for API failures.
* Responsive UI: Ensures the app is usable across different screen sizes.

## Installation

1) Clone this repository:

```bash
  git clone https://github.com/aliabdelnaby/Codeness-Lab-Flutter-Task
```
2) Install dependencies:

```bash
  flutter pub get
```
3) Run the app:

```bash
flutter run
```
## Code Structure
* lib/core/controllers: Contains the controllers for state management and business logic using GetX.
* lib/core/models: Contains the data models (e.g., PostModel).
* lib/core/router: Contains classes responsible for routing and navigation setup.
* lib/core/services: Contains the service for API interaction (e.g., fetching data from the API).
* lib/presentation/view: Contains the views/screens (e.g., posts screen, detail screen).
* lib/presentation/widgets: Reusable UI components (e.g., custom post card item).

## Features Implemented
### List Screen
* Displays the list of items in a scrollable view.
Includes a search bar to filter the list based on the user's input.
### Detail Screen
* Shows detailed information about a selected item.
### Error Handling
* Proper error handling with user-friendly messages in case of API failure.
### Loading State
* A loading spinner is displayed while the data is being fetched.
### Dependency Injection
* GetX's dependency injection is used to manage controllers and services.
### Pull to Refresh
* Allows the user to refresh the list.
### Pagination
* Loads the list in chunks for improved performance.

## API Used
This project uses the JSONPlaceholder API to fetch a list of items.
