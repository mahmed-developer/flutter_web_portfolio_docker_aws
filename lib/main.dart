import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/ProjectsPage.dart';
import 'Theme/Theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Ahmed – Portfolio',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/projects': (context) => const ProjectsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}