# Challenge 2 Presentation Script — Home Handyman Portfolio

**COMP5450 Mobile Programming · Group 5 · May 27 2026 (Zoom)**
**Target length: 5–8 minutes**

---

## Slide 1 — Title (≈30 s)

Good morning/afternoon everyone. I am Liang Mingchen, presenting on behalf of Group 5.

Our Challenge 2 project is a **Home Handyman Portfolio** app built with Flutter and Dart.
The goal, as the handout says, is not to list every detail about a handyman business but to
**showcase skills in a way that attracts potential customers** — essentially a mobile-first
marketing portfolio.

---

## Slide 2 — Problem and Goal (≈45 s)

A homeowner searching for a handyman usually checks Google reviews, scrolls through photos,
and calls whoever looks most trustworthy. Our app puts all of that into one place:

- **Services** so the customer immediately knows what is offered
- **Portfolio** of completed projects to prove quality
- **Reviews** from past clients for social proof
- **Contact** form so the customer can reach out directly

This ties into the course theme of building real-world mobile applications with
cross-platform frameworks. Flutter lets us ship the same UI to Android, iOS, and
the web from a single Dart codebase.

---

## Slide 3 — Tech Stack (≈45 s)

We used:

- **Flutter 3.32** with Material 3 — the recommended cross-platform framework from our course
- **Dart** as the programming language
- **Repository pattern** for data access — currently backed by a mock data layer
- **Firebase-ready architecture** — the abstract `PortfolioRepository` interface means we can swap
  the mock with Firestore by changing one class, without touching any screen code

We built and tested for Chrome (web) and verified with `flutter analyze` (zero warnings) and
seven widget tests that all pass.

---

## Slide 4 — App Architecture (≈1 min)

The project follows a clean folder structure:

- `models/` — plain Dart classes for Service, Project, and Review
- `data/` — the repository interface and its mock implementation
- `screens/` — one file per screen (Home, Services, Portfolio, About, Reviews, Contact)
- `widgets/` — reusable UI components (HeroBanner, ServiceCard, ProjectCard, ReviewCard, StatChip)

This separation of concerns is important because when we plug in Firebase Firestore later, only
`mock_portfolio_repository.dart` gets replaced. No screen or widget needs to change. That is the
whole point of the repository pattern.

---

## Slide 5 — Live Demo / Screenshots: Home Screen (≈1 min)

*(show screenshot-home.png or run the app live)*

The Home screen features:

- A **hero banner** with the handyman's name and tagline, plus three quick-action buttons
  (Call, Book, Portfolio) — these navigate to the appropriate tabs.
- **Stat chips** showing 12 years of experience, 340+ completed projects, and 85% repeat clients.
- A **featured services grid** showing the top four services with icons and descriptions,
  plus a "View All Services" button that jumps to the Services tab.

The layout is wrapped in a `ConstrainedBox(maxWidth: 600)` so it looks clean on both phones
and wide desktop browsers.

---

## Slide 6 — Services and Portfolio Screens (≈1 min)

*(show screenshot-services.png and screenshot-portfolio.png)*

The **Services screen** displays all six categories in a two-column grid. Each card has a
color-coded icon, a title, and a brief description.

The **Portfolio screen** shows completed project cards with:
- A placeholder image area (solid color — no network images needed)
- A category tag badge
- Before/after labels where the project has them
- A short description of the work done

These cards are built from a reusable `ProjectCard` widget that could later pull images
from Firebase Storage.

---

## Slide 7 — Reviews and Contact Screens (≈1 min)

The **Reviews screen** shows an average rating at the top and a list of customer testimonial
cards. Each card has the client's initial in a circle avatar, name, date, star rating, and
an italicized quote.

The **Contact screen** has two sections:
1. Business info tiles (phone, email, hours, service area) with icons
2. A message form with three fields (name, email, message) and client-side validation —
   tapping "Send" with empty fields shows "Required" errors

The form currently calls `MockPortfolioRepository.submitContact()`, which simulates a
400ms network delay and shows a snackbar confirmation. When Firebase is connected, that
call would write to a Firestore collection.

---

## Slide 8 — About Screen (≈30 s)

The About screen is accessible from the info icon in the app bar. It shows:

- A profile avatar and name
- The same stat chips from the Home screen
- A bio paragraph about the handyman's background
- Certifications and training (Licensed Plumber, Electrician Level 1, WSIB, Fall Protection)
- Service area with a location icon

---

## Slide 9 — Testing and Quality (≈30 s)

We ran:

- `flutter analyze` — zero warnings or errors
- `flutter test` — seven widget tests covering all five tabs, the About page navigation,
  and the contact form validation logic
- `flutter build web` — successful web build used to take the screenshots in the README

---

## Slide 10 — Firebase Integration Plan (≈30 s)

To connect real Firebase:

1. Add `firebase_core`, `cloud_firestore`, and `firebase_storage` to `pubspec.yaml`
2. Create `FirestorePortfolioRepository` implementing the same `PortfolioRepository` interface
3. Replace the mock in `main.dart` — no screen code changes

This demonstrates a key software engineering principle: **program to an interface, not an
implementation**.

---

## Slide 11 — Conclusion (≈30 s)

To summarize:

- We built a six-screen Flutter portfolio app for a home handyman service
- Material 3 design with a warm amber theme
- Repository pattern keeps data access swappable
- All tests pass, analysis is clean
- Firebase can be plugged in without changing the UI layer

Thank you. I am happy to take any questions.
