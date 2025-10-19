import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Theme/Theme.dart';
import '../Widgets/NavDrawer.dart';
import 'ProjectModel.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int _currentImageIndex = 0;

  void _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      drawer: isMobile ? const NavDrawer() : null,
      appBar: AppBar(
        title: Text(widget.project.title),
        leading: isMobile
            ? null
            : IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildImageGalleryPlayStoreStyle(screenWidth, isMobile),

            // Content Section
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.project.title,
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 42,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.tags
                        .map((tag) => _techTag(tag))
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  _buildActionButtons(isMobile),
                  const SizedBox(height: 32),

                  // Detailed Description
                  _buildSection(
                    'About This Project',
                    widget.project.detailedDescription,
                    isMobile,
                  ),

                  // Features Section
                  if (widget.project.features.isNotEmpty) ...[
                    const SizedBox(height: 32),
                    _buildFeaturesSection(isMobile, isTablet),
                  ],

                  // Technologies Section
                  const SizedBox(height: 32),
                  _buildTechnologiesSection(isMobile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(double screenWidth, bool isMobile) {
    return Container(
      height: isMobile ? 300 : 600,
      color: AppColors.background,
      child: Stack(
        children: [
          // Main Image with proper aspect ratio
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? screenWidth : 400,
                maxHeight: isMobile ? 300 : 600,
              ),
              child: PageView.builder(
                itemCount: widget.project.imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 32,
                      vertical: isMobile ? 20 : 40,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.project.imagePaths[index],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.surfaceLight,
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Image Indicators
          if (widget.project.imagePaths.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.project.imagePaths.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentImageIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentImageIndex == index
                          ? AppColors.primary
                          : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),

          // Navigation Arrows (Desktop only)
          if (!isMobile && widget.project.imagePaths.length > 1) ...[
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _currentImageIndex = (_currentImageIndex - 1) %
                            widget.project.imagePaths.length;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _currentImageIndex = (_currentImageIndex + 1) %
                            widget.project.imagePaths.length;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImageGalleryPlayStoreStyle(double screenWidth, bool isMobile) {
    final PageController controller = PageController(viewportFraction: isMobile ? 0.6 : 0.3);

    return Container(
      height: isMobile ? 600 : 700,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 40,
        horizontal: isMobile ? 16 : 40,
      ),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
            child: Text(
              'Screenshots',
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
                  itemCount: widget.project.imagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.project.imagePaths, index);
                      },
                      child: Container(
                        width: isMobile ? 220 : 320,
                        margin: EdgeInsets.only(right: isMobile ? 12 : 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.project.imagePaths[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: AppColors.surfaceLight,
                              child: const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 60,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Previous button
                Positioned(
                  left: isMobile ? 0 : 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                // Next button
                Positioned(
                  right: isMobile ? 0 : 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  /// Full-screen image viewer with next/previous navigation
  void _showImageDialog(
      BuildContext context, List<String> imagePaths, int initialIndex) {
    final PageController controller = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: controller,
                  onPageChanged: (index) => setState(() => currentIndex = index),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 800,
                          maxHeight: 800,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Close button
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),

                // Previous arrow
                if (currentIndex > 0)
                  Positioned(
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),

                // Next arrow
                if (currentIndex < imagePaths.length - 1)
                  Positioned(
                    right: 20,
                    child: IconButton(
                      icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        });
      },
    );
  }


  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (widget.project.playStoreLink.isNotEmpty)
          ElevatedButton.icon(
            onPressed: () => _launch(widget.project.playStoreLink),
            icon: const Icon(Icons.shop),
            label: const Text('Play Store'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 12 : 16,
              ),
            ),
          ),
        if (widget.project.appStoreLink.isNotEmpty)
          ElevatedButton.icon(
            onPressed: () => _launch(widget.project.appStoreLink),
            icon: const Icon(Icons.apple),
            label: const Text('App Store'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 12 : 16,
              ),
            ),
          ),
        if (widget.project.githubLink.isNotEmpty)
          OutlinedButton.icon(
            onPressed: () => _launch(widget.project.githubLink),
            icon: const Icon(Icons.code),
            label: const Text('Source Code'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 12 : 16,
              ),
            ),
          ),
        if (widget.project.externalLink.isNotEmpty)
          OutlinedButton.icon(
            onPressed: () => _launch(widget.project.externalLink),
            icon: const Icon(Icons.open_in_new),
            label: const Text('Learn More'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 12 : 16,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSection(String title, String content, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isMobile ? 4 : 3,
          ),
          itemCount: widget.project.features.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.surfaceLight),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.project.features[index],
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTechnologiesSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies Used',
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.project.tags
              .map((tag) => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Text(
              tag,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
          ))
              .toList(),
        ),
      ],
    );
  }

  Widget _techTag(String tag) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.surfaceLight,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      tag,
      style: const TextStyle(fontSize: 12, color: AppColors.text),
    ),
  );
}