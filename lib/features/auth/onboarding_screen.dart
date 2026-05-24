import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';
import 'package:nova_alarm/features/home/navigation_wrapper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: "Smarter Alarms",
      description:
          "AI-driven alarm system that understands your sleep patterns.",
      icon: Icons.auto_awesome_rounded,
      color: AppColors.neonBlue,
    ),
    OnboardingData(
      title: "Private Vault",
      description:
          "Secure your personal memories behind a professional-grade vault.",
      icon: Icons.enhanced_encryption_rounded,
      color: AppColors.accentPurple,
    ),
    OnboardingData(
      title: "Sleep Intelligence",
      description:
          "Get detailed insights and AI recommendations for better rest.",
      icon: Icons.analytics_rounded,
      color: Colors.greenAccent,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(data: _pages[index]);
            },
          ),

          // Bottom Controls
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicators
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) {
                      final bool isActive = _currentPage == index;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 8),
                        width: isActive ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.neonBlue
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),

                // Next Button
                GestureDetector(
                  onTap: _nextPage,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.neonBlue,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neonBlue.withOpacity(0.35),
                          blurRadius: 18,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          _currentPage == _pages.length - 1
                              ? "GET STARTED"
                              : "NEXT",
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                )
                    .animate(
                      key: ValueKey(_currentPage),
                    )
                    .fadeIn(duration: 300.ms)
                    .scale(
                      duration: 400.ms,
                      curve: Curves.easeOutBack,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        color: AppColors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: data.color.withOpacity(0.1),
              border: Border.all(
                color: data.color.withOpacity(0.25),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: data.color.withOpacity(0.15),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Icon(
              data.icon,
              size: 100,
              color: data.color,
            ),
          )
              .animate()
              .scale(
                duration: 800.ms,
                curve: Curves.easeOutBack,
              )
              .shimmer(
                delay: 500.ms,
                duration: 2.seconds,
              ),

          const SizedBox(height: 60),

          // Title
          Text(
            data.title,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(
                delay: 200.ms,
                duration: 500.ms,
              )
              .moveY(
                begin: 20,
                end: 0,
                duration: 500.ms,
              ),

          const SizedBox(height: 18),

          // Description
          Text(
            data.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textBody,
                  height: 1.6,
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(
                delay: 400.ms,
                duration: 500.ms,
              )
              .moveY(
                begin: 20,
                end: 0,
                duration: 500.ms,
              ),
        ],
      ),
    );
  }
}