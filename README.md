# Challenge 2 — Home Handyman Portfolio

**COMP5450 Mobile Programming · Group 5**

A Flutter app that acts as a portfolio website for a fictional home handyman service.
The idea is to showcase services, past projects, and customer reviews in a way that
would attract potential clients — not just dump a list of every detail.

## What the app does

- **Home** — hero banner with quick-action buttons (Call, Book, Portfolio), three stat chips, and a preview of featured services.
- **Services** — grid of six service categories (Plumbing, Electrical, Carpentry, Painting, Tiling, General Repairs) with icons and short descriptions.
- **Portfolio** — scrollable list of completed project cards with category tags, descriptions, and before/after labels where applicable.
- **Reviews** — customer testimonial cards showing name, star rating, date, and a quote.
- **Contact** — phone, email, hours, service area info, plus a message form with client-side validation.
- **About** — accessible from the info icon in the app bar; shows bio, certifications, years of experience, and service area.

Navigation is handled by a Material 3 `NavigationBar` at the bottom (5 tabs).

## Architecture

The code follows a **repository pattern**. Right now every call goes through
`MockPortfolioRepository`, which returns data from `mock_data.dart`. When we
connect Firebase later, only one class changes — all screen code stays the same.

```
lib/
  main.dart                          # theme, nav shell
  models/
    service.dart                     # Service data class
    project.dart                     # Project data class
    review.dart                      # Review data class
  data/
    portfolio_repository.dart        # abstract interface
    mock_portfolio_repository.dart   # mock impl (swap for Firestore)
    mock_data.dart                   # all sample data
  screens/
    home_screen.dart
    services_screen.dart
    portfolio_screen.dart
    about_screen.dart
    reviews_screen.dart
    contact_screen.dart
  widgets/
    hero_banner.dart
    stat_chip.dart
    service_card.dart
    project_card.dart
    review_card.dart
```

## How to run

```
git clone https://github.com/achenachena/handyman-portfolio.git
cd handyman-portfolio
flutter pub get
flutter run            # pick Chrome or an Android emulator
flutter run -d chrome  # force web
```

Tested with Flutter 3.32+ on macOS.

## Tests

```
flutter test      # 7 widget tests — all pass
flutter analyze   # no issues
```

## Screenshots

| Home | Services | Portfolio |
|------|----------|-----------|
| ![home](screenshot-home.png) | ![services](screenshot-services.png) | ![portfolio](screenshot-portfolio.png) |

## Firebase (next step)

The plan is to replace `MockPortfolioRepository` with a Firestore-backed implementation.
The abstract `PortfolioRepository` interface already defines `getServices()`, `getProjects()`,
`getReviews()`, and `submitContact()`, so screens won't need changes.

## GitHub

<https://github.com/achenachena/handyman-portfolio>

## Team — Group 5

*(see D2L for member list)*
