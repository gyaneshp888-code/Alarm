import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';
import 'package:nova_alarm/features/auth/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Stack(
          children: [
            // Background particles effect (Simulated with random spots)
            ...List.generate(20, (index) {
              return Positioned(
                top: (index * 50) % MediaQuery.of(context).size.height,
                left: (index * 70) % MediaQuery.of(context).size.width,
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.neonBlue.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .fade(duration: 2.seconds, curve: Curves.easeInOut)
                    .moveY(begin: 0, end: -100, duration: 5.seconds),
              );
            }),
            
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neonBlue.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.alarm_rounded,
                        size: 60,
                        color: AppColors.neonBlue,
                      ),
                    ),
                  )
                      .animate()
                      .scale(duration: 1.seconds, curve: Curves.elasticOut)
                      .shimmer(duration: 2.seconds, color: AppColors.accentPurple.withOpacity(0.5)),
                  
                  const SizedBox(height: 32),
                  
                  Text(
                    'NOVA ALARM',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          letterSpacing: 4,
                          shadows: [
                            const Shadow(
                              color: AppColors.neonBlue,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 800.ms)
                      .moveY(begin: 20, end: 0),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    'Wake Smarter. Live Secure.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.softWhite.withOpacity(0.7),
                        ),
                  )
                      .animate()
                      .fadeIn(delay: 1.seconds, duration: 800.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
