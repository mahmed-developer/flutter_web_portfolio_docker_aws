import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Theme/Theme.dart';
import '../Widgets/NavDrawer.dart';
import 'ProjectDetails.dart';
import 'ProjectModel.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final featuredProjects = ProjectModel.getFeaturedProjects();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      drawer: isMobile ? const NavDrawer() : null, // Only show drawer on mobile
      appBar: AppBar(
        title: Text(
          'MUHAMMAD AHMED',
          style: TextStyle(fontSize: isMobile ? 16 : 20),
        ),
        centerTitle: isMobile,
        automaticallyImplyLeading: isMobile, // Only show hamburger on mobile
        actions: [
          // Desktop/Tablet Navigation
          if (!isMobile) ...[
            TextButton.icon(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              icon: const Icon(Icons.home, color: AppColors.text),
              label: const Text('Home', style: TextStyle(color: AppColors.text)),
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              onPressed: () => Navigator.pushReplacementNamed(context, '/projects'),
              icon: const Icon(Icons.work, color: AppColors.text),
              label: const Text('Projects', style: TextStyle(color: AppColors.text)),
            ),
            const SizedBox(width: 16),
            Container(
              width: 1,
              height: 30,
              color: AppColors.surfaceLight,
            ),
            const SizedBox(width: 16),
            TextButton.icon(
              onPressed: () => _launch('https://github.com/mahmed-developer'),
              icon: const Icon(Icons.code, color: AppColors.text),
              label: const Text('GitHub', style: TextStyle(color: AppColors.text)),
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              onPressed: () => _launch('https://www.linkedin.com/in/m-ahmed-aa029a31b'),
              icon: const Icon(Icons.work_outline, color: AppColors.text),
              label: const Text('LinkedIn', style: TextStyle(color: AppColors.text)),
            ),
            const SizedBox(width: 16),
          ],
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section - Responsive
            _buildHeroSection(isMobile, isTablet,context),

            // Stats Section - Responsive
            _buildStatsSection(isMobile, isTablet),

            // Featured Projects - Responsive
            _buildFeaturedProjectsSection(context, featuredProjects, isMobile, isTablet),

            // Experience Section
            _buildExperienceSection(isMobile),

            // Skills Section - Responsive
            _buildSkillsSection(isMobile, isTablet),

            // Contact Section - Responsive
            _buildContactSection(isMobile, isTablet),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile, bool isTablet,BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradient1, AppColors.gradient2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 60,
        horizontal: isMobile ? 16 : 32,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildProfileImage(isMobile),
          const SizedBox(height: 24),
          _buildHeroContent(isMobile,context),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImage(isMobile),
          const SizedBox(width: 40),
          Expanded(child: _buildHeroContent(isMobile,context)),
        ],
      ),
    );
  }

  Widget _buildProfileImage(bool isMobile) {
    return Container(
      width: isMobile ? 120 : 180,
      height: isMobile ? 120 : 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.accent, width: 4),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/img.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeroContent(bool isMobile,BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'MUHAMMAD AHMED',
          style: TextStyle(
            fontSize: isMobile ? 28 : 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.accent.withOpacity(0.5)),
          ),
          child: Text(
            'SOFTWARE ENGINEER',
            style: TextStyle(
              fontSize: isMobile ? 12 : 16,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
            'FLUTTER • DEVOPS • CLOUD',
            style: TextStyle(
                fontSize: isMobile ? 12 : 16,
                color: Colors.white,
              letterSpacing: 1.5,
            ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          'Seeking a role in software development and DevOps to apply my skills in CI/CD and cloud automation. Experienced in automating deployments using Docker and GitHub Actions, and eager to build scalable, secure, cloud-native solutions.',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: Colors.white,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),
        isMobile
            ? Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/projects'),
                icon: const Icon(Icons.work),
                label: const Text('View Projects'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _launch('mailto:mahmed.dev2003@gmail.com'),
                icon: const Icon(Icons.email),
                label: const Text('Contact Me'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        )
            : Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              icon: const Icon(Icons.work),
              label: const Text('View Projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                elevation: 4,
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () => _launch('mailto:mahmed.dev2003@gmail.com'),
              icon: const Icon(Icons.email),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 24 : 40,
        horizontal: isMobile ? 16 : 32,
      ),
      color: AppColors.surface,
      child: isMobile
          ? Column(
        children: [
          _statBlock('3+', 'Years Experience', Icons.timeline),
          const SizedBox(height: 24),
          _statBlock('10+', 'Projects Completed', Icons.apps),
          const SizedBox(height: 24),
          _statBlock('100%', 'Client Satisfaction', Icons.star),
          const SizedBox(height: 24),
          _statBlock('AWS', 'Cloud Expert', Icons.cloud),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _statBlock('3+', 'Years Experience', Icons.timeline)),
          _verticalDivider(),
          Expanded(child: _statBlock('10+', 'Projects Completed', Icons.apps)),
          _verticalDivider(),
          Expanded(child: _statBlock('100%', 'Client Satisfaction', Icons.star)),
          _verticalDivider(),
          Expanded(child: _statBlock('AWS', 'Cloud Expert', Icons.cloud)),
        ],
      ),
    );
  }

  Widget _buildFeaturedProjectsSection(
      BuildContext context,
      List<ProjectModel> featuredProjects,
      bool isMobile,
      bool isTablet,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: isMobile ? 16 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Featured Projects',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/projects'),
                icon: const Icon(Icons.arrow_forward),
                label: Text(isMobile ? 'All' : 'View All'),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 32),
          isMobile
              ? Column(
            children: featuredProjects
                .map((project) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _projectCard(context, project),
            ))
                .toList(),
          )
              : Wrap(
            spacing: 24,
            runSpacing: 24,
            children: featuredProjects
                .map((project) => _projectCard(context, project))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: isMobile ? 16 : 32,
      ),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Professional Experience',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 32),
          _experienceCard(),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: isMobile ? 16 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 32),
          isMobile
              ? Column(
            children: [
              _skillCategory('Languages & Frameworks', ['Dart', 'Flutter', 'ReactJS', 'JavaScript', 'Python', 'C++']),
              const SizedBox(height: 24),
              _skillCategory('Databases', ['Firestore', 'Realtime DB', 'MySQL', 'MongoDB']),
              const SizedBox(height: 24),
              _skillCategory('DevOps & Cloud', ['Docker', 'GitHub Actions', 'AWS EC2', 'CI/CD Pipeline']),
            ],
          )
              : isTablet
              ? Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _skillCategory('Languages & Frameworks', ['Dart', 'Flutter', 'ReactJS', 'JavaScript', 'Python', 'C++'])),
                  const SizedBox(width: 24),
                  Expanded(child: _skillCategory('Databases', ['Firestore', 'Realtime DB', 'MySQL', 'MongoDB'])),
                ],
              ),
              const SizedBox(height: 24),
              _skillCategory('DevOps & Cloud', ['Docker', 'GitHub Actions', 'AWS EC2', 'CI/CD Pipeline']),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _skillCategory('Languages & Frameworks', ['Dart', 'Flutter', 'ReactJS', 'JavaScript', 'Python', 'C++'])),
              const SizedBox(width: 24),
              Expanded(child: _skillCategory('Databases', ['Firestore', 'Realtime DB', 'MySQL', 'MongoDB'])),
              const SizedBox(width: 24),
              Expanded(child: _skillCategory('DevOps & Cloud', ['Docker', 'GitHub Actions', 'AWS EC2', 'CI/CD Pipeline'])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: isMobile ? 16 : 32,
      ),
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 32),
          isMobile
              ? Column(
            children: [
              // Remove Expanded wrapper for mobile
              GestureDetector(
                onTap: null,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.location_on, size: 32, color: AppColors.primary),
                      const SizedBox(height: 12),
                      const Text(
                        'Location',
                        style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Rawalpindi, Pakistan',
                        style: TextStyle(fontSize: 14, color: AppColors.text),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _launch('tel:+923325348438'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.phone, size: 32, color: AppColors.primary),
                      const SizedBox(height: 12),
                      const Text(
                        'Phone',
                        style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '+92 332 5348438',
                        style: TextStyle(fontSize: 14, color: AppColors.text),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _launch('mailto:mahmed.dev2003@gmail.com'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.email, size: 32, color: AppColors.primary),
                      const SizedBox(height: 12),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'mahmed.dev2003@gmail.com',
                        style: TextStyle(fontSize: 14, color: AppColors.text),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : Row(
            children: [
              _contactCard(Icons.location_on, 'Location', 'Rawalpindi, Pakistan', null),
              const SizedBox(width: 24),
              _contactCard(Icons.phone, 'Phone', '+92 332 5348438', 'tel:+923325348438'),
              const SizedBox(width: 24),
              _contactCard(Icons.email, 'Email', 'mahmed.dev2003@gmail.com', 'mailto:mahmed.dev2003@gmail.com'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: AppColors.background,
      child: const Center(
        child: Text(
          '© 2025 Muhammad Ahmed. All rights reserved.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _skillCategory(String title, List<String> skills) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 16),
          ...skills.map((skill) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle, size: 16, color: AppColors.accent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    skill,
                    style: const TextStyle(color: AppColors.textSecondary, height: 1.3),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _statBlock(String value, String label, IconData icon) => Column(
    children: [
      Icon(icon, size: 40, color: AppColors.primary),
      const SizedBox(height: 12),
      Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.text)),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
    ],
  );

  Widget _verticalDivider() => Container(width: 1, height: 80, color: AppColors.surfaceLight);

  Widget _projectCard(BuildContext context, ProjectModel project) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailPage(project: project),
          ),
        );
      },
      child: Container(
        width: isMobile ? double.infinity : 380,
        height: 480,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                project.imagePaths.first,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 180,
                  color: AppColors.surfaceLight,
                  child: const Icon(Icons.image, size: 60, color: AppColors.textSecondary),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        project.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.tags.take(3).map((tag) => _techTag(tag)).toList(),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailPage(project: project),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward, size: 16),
                        label: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _techTag(String tag) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.surfaceLight,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(tag, style: const TextStyle(fontSize: 12, color: AppColors.text)),
  );

  Widget _experienceCard() => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.surfaceLight),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Software Engineer',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.text),
        ),
        SizedBox(height: 8),
        Text(
          'Infinite Algos • Aug 2024 - Present',
          style: TextStyle(fontSize: 16, color: AppColors.primary),
        ),
        SizedBox(height: 16),
        BulletPoint(text: 'Developed and maintained cross-platform apps using Flutter and Firebase'),
        BulletPoint(text: "Used Firebase's REST API to interact with Firebase Storage"),
        BulletPoint(text: 'Worked as internal/closed tester ensuring app stability before production'),
        BulletPoint(text: 'Integrated RevenueCat SDK for in-app subscriptions and consumables'),
        BulletPoint(text: 'Practiced Docker-based deployments and GitHub Actions CI/CD pipelines on AWS ECS'),
      ],
    ),
  );


  Widget _contactCard(IconData icon, String title, String value, String? link) {
    return Expanded(
      child: GestureDetector(
        onTap: link != null ? () => _launch(link) : null,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: AppColors.primary),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.text,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.primary, fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(color: AppColors.textSecondary))),
        ],
      ),
    );
  }
}