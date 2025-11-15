import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'about_us.dart';
import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF3E0), Color(0xFFD7CCC8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // 🐾 Lottie Animation (centered)
                Lottie.asset(
                  'assets/animations/paw_loading.json',
                  width: size.width * 0.5,
                  repeat: true,
                ),

                const SizedBox(height: 20),

                // 🐶 Title
                const Text(
                  "Bailey's Backyard 🐾",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "A safe and happy space for every pup!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),

                const SizedBox(height: 50),

                // 🎛️ Button Grid — symmetrical and adaptive
                LayoutBuilder(
                  builder: (context, constraints) {
                    double buttonWidth = (constraints.maxWidth - 60) / 2;
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildMenuButton(
                          context,
                          icon: Icons.qr_code_scanner,
                          label: "Check In",
                          color: Colors.brown.shade400,
                          width: buttonWidth,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoadingScreen(),
                              ),
                            );
                          },
                        ),
                        _buildMenuButton(
                          context,
                          icon: Icons.info_outline,
                          label: "About Us",
                          color: Colors.brown.shade400,
                          width: buttonWidth,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutUsScreen(),
                              ),
                            );
                          },
                        ),
                        _buildMenuButton(
                          context,
                          icon: Icons.photo_album,
                          label: "Gallery",
                          color: Colors.brown.shade400,
                          width: buttonWidth,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Gallery coming soon 🐕"),
                              ),
                            );
                          },
                        ),
                        _buildMenuButton(
                          context,
                          icon: Icons.contact_page,
                          label: "Contact",
                          color: Colors.brown.shade400,
                          width: buttonWidth,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Contact page coming soon 📞"),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 40),

                // 🐾 Footer
                const Text(
                  "© 2025 Bailey's Backyard",
                  style: TextStyle(color: Colors.brown),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required Color color,
        required double width,
        required VoidCallback onPressed,
      }) {
    return SizedBox(
      width: width,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
