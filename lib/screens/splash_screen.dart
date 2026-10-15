import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:untitled/widgets/net_image.dart';
import '../widgets/net_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background photo
          const NetImage(kHeroImg),

          // 2. Dark gradient on top of the photo
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF0B3C6B).withOpacity(0.85),
                  Colors.transparent,
                  const Color(0xFF0B2A3C).withOpacity(0.9),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // 3. Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.terrain, color: Colors.white, size: 64),
                  const SizedBox(height: 8),
                  const Text(
                    'TrekNepal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Discover  •  Explore  •  Go Further',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),

                  // Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Step 5 - navigate to HomeScreen
                      },
                      icon: const Icon(Icons.arrow_forward, size: 18),
                      label: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Login text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Already have an account?  ',
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      Text('Log In',
                          style: TextStyle(
                              color: Color(0xFF5ED6B4),
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Home indicator bar
                  Container(
                    width: 130,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}