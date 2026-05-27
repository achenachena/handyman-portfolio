#!/usr/bin/env python3
"""Generate README.pdf for Challenge 2 submission (requires: pip install reportlab)."""

import os
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib.colors import HexColor
from reportlab.platypus import (
    SimpleDocTemplate,
    Paragraph,
    Spacer,
    Image,
    PageBreak,
    HRFlowable,
)
from reportlab.lib.enums import TA_CENTER

HERE = os.path.dirname(os.path.abspath(__file__))


def build_pdf():
    path = os.path.join(HERE, "README.pdf")
    doc = SimpleDocTemplate(
        path,
        pagesize=letter,
        leftMargin=0.75 * inch,
        rightMargin=0.75 * inch,
        topMargin=0.6 * inch,
        bottomMargin=0.6 * inch,
    )

    styles = getSampleStyleSheet()
    styles.add(ParagraphStyle("Title2", parent=styles["Title"], fontSize=20, spaceAfter=6))
    styles.add(
        ParagraphStyle(
            "Sub",
            parent=styles["Normal"],
            fontSize=11,
            textColor=HexColor("#555555"),
            spaceAfter=12,
        )
    )
    styles.add(ParagraphStyle("H2", parent=styles["Heading2"], spaceBefore=14, spaceAfter=6))
    styles.add(ParagraphStyle("Body", parent=styles["Normal"], fontSize=10.5, leading=15))
    styles.add(
        ParagraphStyle(
            "CodeBlock",
            parent=styles["Code"],
            fontSize=8.5,
            leading=11.5,
            backColor=HexColor("#F3F4F6"),
            leftIndent=10,
        )
    )
    styles.add(ParagraphStyle("Center", parent=styles["Normal"], alignment=TA_CENTER))

    story = []

    story.append(Paragraph("Challenge 2 — Home Handyman Portfolio", styles["Title2"]))
    story.append(Paragraph("COMP5450 Mobile Programming · Group 5", styles["Sub"]))
    story.append(HRFlowable(width="100%", color=HexColor("#D97706"), thickness=2))
    story.append(Spacer(1, 12))

    story.append(Paragraph("Course requirements addressed", styles["H2"]))
    story.append(
        Paragraph(
            "• <b>Flutter</b> — full project runnable from Android Studio / IntelliJ IDEA (Flutter plugin).<br/>"
            "• <b>Firebase</b> — portfolio lists and contact submissions use <b>Cloud Firestore</b> "
            "(<font face='Courier'>services</font>, <font face='Courier'>projects</font>, "
            "<font face='Courier'>reviews</font>, <font face='Courier'>contact_messages</font>). "
            "First launch seeds empty collections from mock data.<br/>"
            "• <b>README.pdf</b> — configuration, exact structure, screenshots, and public GitHub link "
            "(this document).<br/>"
            "• <b>D2L ZIP</b> — submit Dart sources, screenshot images, and README.pdf (see course instructions).<br/>"
            "• <b>Zoom presentation</b> — per D2L schedule.",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 6))

    story.append(Paragraph("Overview", styles["H2"]))
    story.append(
        Paragraph(
            "A Flutter portfolio app for a fictional home handyman service. Six screens — Home, "
            "Services, Portfolio, About, Reviews, and Contact — use a Material 3 bottom navigation bar. "
            "<b>Firebase Core</b> initializes at startup; <b>FirestorePortfolioRepository</b> loads "
            "portfolio data. If Firebase is not configured (missing <font face='Courier'>google-services.json</font>), "
            "the app falls back to <font face='Courier'>MockPortfolioRepository</font> so the UI still runs.",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 6))

    story.append(Paragraph("App description", styles["H2"]))
    screens_desc = [
        (
            "<b>Home</b> — Hero banner with Call / Book / Portfolio actions, stat chips, "
            "featured services from Firestore (or mock)."
        ),
        (
            "<b>Services</b> — Grid of service categories with icons and descriptions "
            "from Firestore (or mock)."
        ),
        (
            "<b>Portfolio</b> — Project cards with categories, descriptions, and network header images "
            "(URLs in mock seed data)."
        ),
        (
            "<b>Reviews</b> — Average rating and testimonial cards from Firestore (or mock)."
        ),
        (
            "<b>Contact</b> — Business info and validated form; submissions written to Firestore "
            "<font face='Courier'>contact_messages</font> (or mock in tests / fallback)."
        ),
        (
            "<b>About</b> — From the app bar info icon: bio, certifications, service area."
        ),
    ]
    for desc in screens_desc:
        story.append(Paragraph(f"• {desc}", styles["Body"]))
        story.append(Spacer(1, 2))
    story.append(Spacer(1, 6))

    story.append(Paragraph("Architecture", styles["H2"]))
    story.append(
        Paragraph(
            "<font face='Courier'>PortfolioRepository</font> defines "
            "<font face='Courier'>getServices()</font>, <font face='Courier'>getProjects()</font>, "
            "<font face='Courier'>getReviews()</font>, and <font face='Courier'>submitContact()</font>. "
            "<font face='Courier'>FirestorePortfolioRepository</font> implements these with Firestore; "
            "<font face='Courier'>MockPortfolioRepository</font> is used for "
            "<font face='Courier'>AppEntry(forceMock: true)</font> in tests and as a runtime fallback. "
            "<font face='Courier'>PortfolioScope</font> (InheritedWidget) exposes lists + repository to screens.",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 6))

    story.append(Paragraph("Exact project structure (Dart sources)", styles["H2"]))
    tree_lines = [
        "lib/",
        "  main.dart",
        "  app_entry.dart",
        "  handyman_app.dart",
        "  app_shell.dart",
        "  portfolio_scope.dart",
        "  data/",
        "    portfolio_repository.dart",
        "    mock_portfolio_repository.dart",
        "    mock_data.dart",
        "    firestore_serializers.dart",
        "    firestore_seeder.dart",
        "    firestore_portfolio_repository.dart",
        "  models/",
        "    service.dart",
        "    project.dart",
        "    review.dart",
        "  screens/",
        "    home_screen.dart",
        "    services_screen.dart",
        "    portfolio_screen.dart",
        "    about_screen.dart",
        "    reviews_screen.dart",
        "    contact_screen.dart",
        "  widgets/",
        "    hero_banner.dart",
        "    stat_chip.dart",
        "    service_card.dart",
        "    project_card.dart",
        "    review_card.dart",
        "test/",
        "  widget_test.dart",
        "docs/",
        "  FIREBASE_SETUP.md",
        "firestore.rules",
        "pubspec.yaml",
        "android/ …   ios/ …   web/ …   (Flutter platform scaffolding)",
    ]
    for line in tree_lines:
        story.append(Paragraph(line, styles["CodeBlock"]))
    story.append(Spacer(1, 8))

    story.append(Paragraph("How to configure and run", styles["H2"]))
    story.append(
        Paragraph(
            "<b>IDE:</b> Android Studio or IntelliJ IDEA — install Flutter &amp; Dart plugins, then "
            "<b>File → Open</b> this project folder (contains <font face='Courier'>pubspec.yaml</font>).",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 4))
    run_steps = [
        "Install Flutter 3.32+ and add to PATH.",
        "Clone: <font face='Courier'>git clone https://github.com/achenachena/handyman-portfolio.git</font>",
        "<font face='Courier'>cd handyman-portfolio</font>",
        "<font face='Courier'>flutter pub get</font>",
        "Add <font face='Courier'>android/app/google-services.json</font> from Firebase Console; "
        "enable Firestore (see <font face='Courier'>docs/FIREBASE_SETUP.md</font>).",
        "<font face='Courier'>flutter run</font> — choose an Android emulator or Chrome.",
    ]
    for i, step in enumerate(run_steps, 1):
        story.append(Paragraph(f"{i}. {step}", styles["Body"]))
    story.append(Spacer(1, 6))

    story.append(Paragraph("Testing", styles["H2"]))
    story.append(
        Paragraph(
            "<font face='Courier'>flutter analyze</font> — zero issues. "
            "<font face='Courier'>flutter test</font> — 7 widget tests (mock repository). "
            "Screenshots below were captured from the running app (web or emulator).",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 6))

    story.append(PageBreak())
    story.append(Paragraph("Screenshots", styles["H2"]))

    shots = [
        ("screenshot-home.png", "Home screen"),
        ("screenshot-services.png", "Services screen"),
        ("screenshot-portfolio.png", "Portfolio screen"),
    ]
    for fname, caption in shots:
        fpath = os.path.join(HERE, fname)
        if os.path.exists(fpath):
            story.append(Paragraph(caption, styles["Center"]))
            story.append(Spacer(1, 4))
            img = Image(fpath, width=3.0 * inch, height=6.0 * inch)
            img.hAlign = "CENTER"
            story.append(img)
            story.append(Spacer(1, 14))

    story.append(Paragraph("Public GitHub repository", styles["H2"]))
    story.append(
        Paragraph(
            '<link href="https://github.com/achenachena/handyman-portfolio">'
            "https://github.com/achenachena/handyman-portfolio</link>",
            styles["Body"],
        )
    )
    story.append(Spacer(1, 8))

    story.append(Paragraph("Team — Group 5", styles["H2"]))
    story.append(Paragraph("(see D2L for member list)", styles["Body"]))

    doc.build(story)
    print(f"✓ Generated {path}")


if __name__ == "__main__":
    build_pdf()
