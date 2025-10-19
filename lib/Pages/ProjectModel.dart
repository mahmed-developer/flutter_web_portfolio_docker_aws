class ProjectModel {
  final String title;
  final String description;
  final String detailedDescription; // New field for full description
  final List<String> imagePaths; // Changed to list for multiple images
  final String playStoreLink;
  final String appStoreLink; // New field
  final String githubLink;
  final String externalLink; // New field for "View More" link
  final List<String> tags;
  final bool isFeatured;
  final List<String> features; // New field for key features

  ProjectModel({
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.imagePaths,
    this.playStoreLink = '',
    this.appStoreLink = '',
    this.githubLink = '',
    this.externalLink = '',
    required this.tags,
    this.isFeatured = false,
    this.features = const [],
  });

  static List<ProjectModel> getAllProjects() {
    return [
      ProjectModel(
        title: 'ERozgar',
        description:
        'Social platform for skilled workers to showcase their talents and connect with clients. Features user authentication, media sharing, user profiles, follow system, news feed, and real-time chat.',
        detailedDescription:
        'ERozgar is a comprehensive social platform designed specifically for skilled workers to showcase their talents and connect with potential clients. The platform features a robust authentication system, allowing users to create personalized profiles that highlight their skills and previous work. Users can share media content, follow other professionals, engage with a dynamic news feed, and communicate through real-time chat functionality. The app is built with scalability in mind, utilizing Firebase for backend services and Flutter for a smooth cross-platform experience.',
        imagePaths: [
          'assets/projects/erozgar.jpg',
          'assets/erozgar/erozgar_2.jpg', // Add more screenshots
          'assets/erozgar/erozgar_3.jpg',
          'assets/erozgar/erozgar_3.jpg',
          'assets/erozgar/erozgar_3.jpg',
          'assets/erozgar/erozgar_3.jpg',
          'assets/erozgar/erozgar_3.jpg',
        ],
        playStoreLink: '',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'Social Media', 'Real-time Chat'],
        isFeatured: true,
        features: [
          'User Authentication & Profile Management',
          'Media Sharing & Gallery',
          'Follow System & News Feed',
          'Real-time Chat Messaging',
          'Skill Showcase Portfolio',
          'Client-Worker Connection',
        ],
      ),
      ProjectModel(
        title: 'Pendora',
        description:
        'A multi-role platform connecting users and experts to help you make better life decisions. Features multi-role login, in-app subscriptions, live sessions, and admin panel.',
        detailedDescription:
        'Pendora is an innovative platform that bridges the gap between users seeking guidance and experts offering their knowledge. The app features a sophisticated multi-role authentication system, allowing different user types to access tailored functionalities. With integrated in-app subscriptions powered by RevenueCat, users can unlock premium features and book live sessions with experts. The comprehensive admin panel enables efficient management of users, sessions, and content.',
        imagePaths: [
          'assets/projects/pendora.jpg',
          'assets/pendora/1.jpg',
          'assets/pendora/2.jpg',
          'assets/pendora/3.jpg',
          'assets/pendora/4.jpg',
          'assets/pendora/5.jpg',
          'assets/pendora/6.jpg',
          'assets/pendora/7.jpg',
          'assets/pendora/8.jpg',
        ],
        playStoreLink:
        'https://play.google.com/store/apps/details?id=com.app.pendora',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'RevenueCat', 'Live Sessions'],
        isFeatured: true,
        features: [
          'Multi-role Authentication System',
          'In-app Subscriptions (RevenueCat)',
          'Live Video Sessions',
          'Expert Booking System',
          'Admin Dashboard',
          'Payment Integration',
        ],
      ),
      ProjectModel(
        title: 'Sunbloc App',
        description:
        'Reminder app that notifies users to apply sunblock regularly for skin protection. Features local notifications, CI/CD pipeline with GitHub Actions, and cross-platform support.',
        detailedDescription:
        'Sunbloc is a health-focused reminder application that helps users maintain their skin health by sending timely notifications to apply sunblock. The app features customizable reminder schedules, UV index tracking, and educational content about skin protection. Built with modern DevOps practices, it includes a complete CI/CD pipeline using GitHub Actions for automated testing and deployment to both Android and iOS platforms.',
        imagePaths: [
          'assets/projects/sunbloc.png',
          'assets/sunbloc/1.png',
          'assets/sunbloc/2.png',
          'assets/sunbloc/3.png',
          'assets/sunbloc/4.png',
          'assets/sunbloc/5.png',
        ],
        playStoreLink:
        'https://play.google.com/store/apps/details?id=com.sunblock.app.sunbloc',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'Notifications', 'CI/CD'],
        isFeatured: true,
        features: [
          'Smart Reminder System',
          'Customizable Notification Schedule',
          'UV Index Tracking',
          'Skin Protection Tips',
          'CI/CD Pipeline with GitHub Actions',
          'Cross-platform Support',
        ],
      ),
      ProjectModel(
        title: 'Mama Mindful',
        description:
        'Health-focused app to assist mothers during pregnancy with real-time progress tracking, personalized health tips, symptom logging, and push notifications.',
        detailedDescription:
        'Mama Mindful is a comprehensive pregnancy companion app designed to support expectant mothers throughout their journey. The app provides week-by-week pregnancy tracking, personalized health tips based on the pregnancy stage, symptom logging capabilities, and important milestone reminders. With push notifications for appointments and health checks, Mama Mindful ensures mothers stay informed and prepared throughout their pregnancy.',
        imagePaths: [
          'assets/projects/mamamindful.jpg',
          'assets/mamamindful/1.png',
          'assets/mamamindful/2.png',
          'assets/mamamindful/3.jpg',
          'assets/mamamindful/4.jpg',
          'assets/mamamindful/5.jpg',
        ],
        playStoreLink: 'https://play.google.com/store/apps/details?id=com.mama_mindfull.mama_mindfull',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'Healthcare', 'Tracking'],
        isFeatured: false,
        features: [
          'Week-by-week Pregnancy Tracking',
          'Personalized Health Tips',
          'Symptom Logger',
          'Appointment Reminders',
          'Push Notifications',
          'Milestone Tracking',
        ],
      ),
      ProjectModel(
        title: 'AuthSync',
        description:
        'A platform for secure user authentication, designed as the foundation for a task management system. Features user registration with bcrypt password hashing and API integration.',
        detailedDescription:
        'AuthSync is a robust authentication platform built as the foundation for a comprehensive task management system. The platform implements industry-standard security practices including bcrypt password hashing, JWT token authentication, and secure API endpoints. Built with a Node.js backend and MongoDB database, AuthSync provides a scalable authentication solution that can be integrated into various applications.',
        imagePaths: [
          'assets/projects/authsync.jpg',
          'assets/projects/authsync_2.jpg',
          'assets/projects/authsync_3.jpg',
        ],
        playStoreLink: '',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Node.js', 'MongoDB', 'Authentication'],
        isFeatured: false,
        features: [
          'Secure User Registration & Login',
          'Bcrypt Password Hashing',
          'JWT Token Authentication',
          'RESTful API Integration',
          'MongoDB Database',
          'Password Reset Functionality',
        ],
      ),
      ProjectModel(
        title: 'E-Commerce App',
        description:
        'Shopping platform tailored for sellers and buyers. Features product listing, shopping cart, push notifications, order tracking, and seller-side product management.',
        detailedDescription:
        'A full-featured e-commerce platform that connects sellers with buyers in a seamless shopping experience. The app includes comprehensive product listing with images and descriptions, a dynamic shopping cart system, secure checkout process, and real-time order tracking. Sellers have access to a dedicated dashboard for managing their products, inventory, and orders. Push notifications keep users informed about order status, promotions, and new arrivals.',
        imagePaths: [
          'assets/projects/ecommerce.jpg',
          'assets/projects/ecommerce_2.jpg',
          'assets/projects/ecommerce_3.jpg',
        ],
        playStoreLink: '',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'E-Commerce', 'Shopping Cart'],
        isFeatured: false,
        features: [
          'Product Listing & Search',
          'Shopping Cart System',
          'Order Tracking',
          'Seller Dashboard',
          'Push Notifications',
          'Payment Gateway Integration',
        ],
      ),
      ProjectModel(
        title: 'Answer2God',
        description:
        'A spiritual companion app offering guided lessons, daily reflections, and structured chapters to help users understand existence of God. Features interactive lessons and progress tracking.',
        detailedDescription:
        'Answer2God is a spiritual education platform designed to guide users through structured lessons about faith and spirituality. The app features carefully crafted chapters with interactive content, daily reflections for spiritual growth, and progress tracking to help users stay motivated on their journey. With in-app purchases for premium content, users can access advanced lessons and exclusive materials.',
        imagePaths: [
          'assets/projects/a2g.jpg',
          'assets/projects/a2g_2.jpg',
          'assets/projects/a2g_3.jpg',
        ],
        playStoreLink: '',
        appStoreLink: '',
        githubLink: '',
        externalLink: '',
        tags: ['Flutter', 'Firebase', 'Educational', 'In-App Purchase'],
        isFeatured: false,
        features: [
          'Structured Learning Chapters',
          'Daily Reflections',
          'Progress Tracking',
          'Interactive Lessons',
          'In-app Purchases',
          'Bookmarking System',
        ],
      ),
    ];
  }

  static List<ProjectModel> getFeaturedProjects() {
    return getAllProjects().where((project) => project.isFeatured).toList();
  }
}