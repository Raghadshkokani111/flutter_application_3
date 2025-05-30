import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/settings_screen.dart';
import 'package:flutter_application_3/pages/subjects_screen.dart';
import 'package:flutter_application_3/parents/parent_dashboard_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDarkMode = false;
  bool isArabic = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void openSettingsMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }

  void onSubjectsButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubjectsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = isDarkMode
        ? const Color.fromARGB(255, 72, 213, 235)
        : const Color.fromARGB(255, 255, 193, 143);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 157, 88, 237),
                    Color(0xFF7E3FF2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFD7FBE0), Color(0xFFAFFFD7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Settings Icon & Text Column
                  GestureDetector(
                    onTap: openSettingsMenu,
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 28,
                          color: isDarkMode
                              ? Colors.white
                              : const Color(0xFFEC5417),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'settings'.tr(),
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Profile Avatar
                  GestureDetector(
                    onTap: openSettingsMenu,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('images/logo.jpg'),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'profile'.tr(),
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Dark Mode Icon & Text Column
                  GestureDetector(
                    onTap: toggleDarkMode,
                    child: Column(
                      children: [
                        Icon(
                          isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                          size: 28,
                          color: isDarkMode
                              ? const Color(0xFFFFDA38)
                              : const Color(0xFFEC5417),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isDarkMode ? 'lightMode'.tr() : 'darkMode'.tr(),
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Image.asset('images/fox_main_screen2.png', height: 300),
            const SizedBox(height: 40),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Subjects button
                GestureDetector(
                  onTap: onSubjectsButtonPressed,
                  child: Container(
                    width: 170,
                    height: 210,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/subject.png', height: 150),
                        const SizedBox(height: 8),
                        Text(
                          'subjects'.tr(),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                // Parent button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParentDashboardScreen()),
                    );
                  },
                  child: Container(
                    width: 170,
                    height: 210,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/parents.png', height: 150),
                        const SizedBox(height: 8),
                        Text(
                          'parent'.tr(),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Container(
            //   height: 50,
            //   color: isDarkMode
            //       ? const Color(0xFF5C25C2)
            //       : const Color(0xFFFEAF6E),
            // ),
          ],
        ),
      ),
    );
  }
}
