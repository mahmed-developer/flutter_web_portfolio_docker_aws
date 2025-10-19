import 'package:flutter/material.dart';
import '../Theme/Theme.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradient1, AppColors.gradient2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.code, color: AppColors.accent, size: 32),
                ),
                const SizedBox(height: 16),
                const Text(
                  'MUHAMMAD AHMED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Software Engineer',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary),
            title: const Text('Home', style: TextStyle(color: AppColors.text)),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            hoverColor: AppColors.surfaceLight,
          ),
          ListTile(
            leading: const Icon(Icons.work, color: AppColors.primary),
            title: const Text('Projects', style: TextStyle(color: AppColors.text)),
            onTap: () => Navigator.pushReplacementNamed(context, '/projects'),
            hoverColor: AppColors.surfaceLight,
          ),
          const Divider(color: AppColors.surfaceLight, thickness: 1),
        ],
      ),
    );
  }
}