import 'package:flutter/material.dart';

import '../models/project.dart';
import '../models/review.dart';
import '../models/service.dart';

const kServices = <Service>[
  Service(
    id: 'plumbing',
    title: 'Plumbing',
    description: 'Leak repairs, pipe fitting, faucet installation, and drain cleaning.',
    icon: Icons.plumbing,
    color: Color(0xFF2563EB),
  ),
  Service(
    id: 'electrical',
    title: 'Electrical',
    description: 'Light fixtures, outlets, ceiling fans, and panel upgrades.',
    icon: Icons.electrical_services,
    color: Color(0xFFD97706),
  ),
  Service(
    id: 'carpentry',
    title: 'Carpentry',
    description: 'Shelving, trim work, door hanging, and deck repairs.',
    icon: Icons.carpenter,
    color: Color(0xFF7C3AED),
  ),
  Service(
    id: 'painting',
    title: 'Painting',
    description: 'Interior and exterior painting, drywall patching, and staining.',
    icon: Icons.format_paint,
    color: Color(0xFF059669),
  ),
  Service(
    id: 'tiling',
    title: 'Tiling',
    description: 'Backsplashes, bathroom floors, shower walls, and grout repair.',
    icon: Icons.grid_view_rounded,
    color: Color(0xFFDC2626),
  ),
  Service(
    id: 'general',
    title: 'General Repairs',
    description: 'Furniture assembly, drywall fixes, weather stripping, and odd jobs.',
    icon: Icons.handyman,
    color: Color(0xFF0891B2),
  ),
];

// Portfolio header photos: Unsplash (https://unsplash.com/license) — demo only.
const kProjects = <Project>[
  Project(
    id: 'p1',
    title: 'Kitchen Backsplash Overhaul',
    category: 'Tiling',
    description: 'Removed old laminate and installed subway tile across a 12-foot kitchen wall. Included custom grout color matching.',
    placeholderColor: Color(0xFFDC2626),
    imageUrl:
        'https://images.unsplash.com/photo-1556911220-bff31c812dba?auto=format&fit=crop&w=900&q=80',
    beforeLabel: 'Peeling laminate',
    afterLabel: 'Clean subway tile',
  ),
  Project(
    id: 'p2',
    title: 'Basement Bathroom Plumbing',
    category: 'Plumbing',
    description: 'Ran new supply and drain lines for a basement half-bath addition. Passed city inspection on first visit.',
    placeholderColor: Color(0xFF2563EB),
    // Picsum (reliable); swap for your own photo in production.
    imageUrl: 'https://picsum.photos/seed/handyman-p2-plumbing/900/500',
  ),
  Project(
    id: 'p3',
    title: 'Full Exterior Repaint',
    category: 'Painting',
    description: 'Pressure-washed, primed, and applied two coats of exterior latex on a two-storey home. Trim and shutters included.',
    placeholderColor: Color(0xFF059669),
    imageUrl:
        'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&w=900&q=80',
    beforeLabel: 'Faded siding',
    afterLabel: 'Fresh two-coat finish',
  ),
  Project(
    id: 'p4',
    title: 'Custom Built-In Shelving',
    category: 'Carpentry',
    description: 'Designed and built floor-to-ceiling shelving for a home office using birch plywood and hardwood trim.',
    placeholderColor: Color(0xFF7C3AED),
    imageUrl:
        'https://images.unsplash.com/photo-1595428774223-ef52624120d2?auto=format&fit=crop&w=900&q=80',
  ),
  Project(
    id: 'p5',
    title: 'Panel Upgrade to 200A',
    category: 'Electrical',
    description: 'Upgraded an aging 100-amp panel to 200 amps, added dedicated circuits for workshop and EV charger.',
    placeholderColor: Color(0xFFD97706),
    imageUrl: 'https://picsum.photos/seed/handyman-p5-electrical/900/500',
  ),
  Project(
    id: 'p6',
    title: 'Deck Restoration',
    category: 'General Repairs',
    description: 'Replaced rotted boards, re-fastened railing, sanded, and sealed a 300 sq ft backyard deck.',
    placeholderColor: Color(0xFF0891B2),
    imageUrl:
        'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&w=900&q=80',
    beforeLabel: 'Rotted planks',
    afterLabel: 'Sealed and level',
  ),
];

const kReviews = <Review>[
  Review(
    id: 'r1',
    name: 'Sarah M.',
    rating: 5.0,
    comment: 'Fixed a leak under the kitchen sink in under an hour. Very professional and cleaned up after himself.',
    date: 'Apr 2026',
  ),
  Review(
    id: 'r2',
    name: 'James T.',
    rating: 4.5,
    comment: 'The deck looks brand new. Good communication throughout the project and fair pricing.',
    date: 'Mar 2026',
  ),
  Review(
    id: 'r3',
    name: 'Linda K.',
    rating: 5.0,
    comment: 'Installed ceiling fans in three bedrooms. Showed up on time, worked quickly, no mess left behind.',
    date: 'Feb 2026',
  ),
  Review(
    id: 'r4',
    name: 'David R.',
    rating: 4.0,
    comment: 'Did a solid job on the backsplash tile. One small grout spot needed a touch-up but he came back right away.',
    date: 'Jan 2026',
  ),
  Review(
    id: 'r5',
    name: 'Karen W.',
    rating: 5.0,
    comment: 'Built custom shelves for our living room. They look like they came from a furniture store.',
    date: 'Dec 2025',
  ),
  Review(
    id: 'r6',
    name: 'Mike P.',
    rating: 4.5,
    comment: 'Repainted our entire house exterior. Neighbors keep asking who did the work.',
    date: 'Nov 2025',
  ),
  Review(
    id: 'r7',
    name: 'Chris L.',
    rating: 5.0,
    comment: 'Replaced several windows and re-caulked the frames before winter. No drafts this year — huge difference on heating bills.',
    date: 'Oct 2025',
  ),
  Review(
    id: 'r8',
    name: 'Amanda F.',
    rating: 4.5,
    comment: 'Mounted our TV and hid the cables in the wall. Looks very clean and he double-checked the stud placement.',
    date: 'Sep 2025',
  ),
  Review(
    id: 'r9',
    name: 'Robert H.',
    rating: 4.0,
    comment: 'General handyman day: fixed a squeaky door, tightened cabinet hinges, and patched a hole in drywall. Good value.',
    date: 'Aug 2025',
  ),
];

const kHandymanName = 'Jake Morrison';
const kHandymanTagline = 'Your Trusted Local Handyman';
const kHandymanBio =
    'I have been doing residential repair and renovation work in Thunder Bay for over '
    '12 years. I started as a general labourer, earned my trade certificates, and '
    'eventually went independent so I could give homeowners the kind of focused, '
    'honest service that bigger contractors sometimes skip. Whether it is a leaky '
    'faucet or a full deck rebuild, I treat every job like it is my own home.';
const kYearsExperience = 12;
const kProjectsCompleted = 340;
const kRepeatClients = 85; // percent
const kServiceArea = 'Thunder Bay & surrounding area';
const kPhone = '(807) 555-0172';
const kEmail = 'jake@tbhandyman.ca';
const kHours = 'Mon–Sat  8 AM – 6 PM';
