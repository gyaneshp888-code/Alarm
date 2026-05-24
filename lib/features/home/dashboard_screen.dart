import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';
import 'package:nova_alarm/shared/widgets/glass_card.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('HH:mm').format(DateTime.now());
    String currentDate = DateFormat('EEEE, d MMM').format(DateTime.now());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 20),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning,",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.textBody,
                            ),
                      ),
                      Text(
                        "Alex",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const GlassCard(
                    padding: EdgeInsets.all(8),
                    borderRadius: 12,
                    child: Icon(Icons.person_outline_rounded, color: AppColors.neonBlue),
                  ),
                ],
              ).animate().fadeIn(duration: 800.ms).moveX(begin: -20, end: 0),

              const SizedBox(height: 40),

              // Digital Clock Section
              Center(
                child: Column(
                  children: [
                    Text(
                      currentTime,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 80,
                            fontWeight: FontWeight.w200,
                            letterSpacing: -2,
                            color: AppColors.softWhite,
                          ),
                    ).animate().scale(duration: 1.seconds, curve: Curves.easeOut),
                    Text(
                      currentDate,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.neonBlue,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                    ).animate().fadeIn(delay: 500.ms),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Upcoming Alarm Card
              GlassCard(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.neonBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.alarm_rounded, color: AppColors.neonBlue),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Next Alarm",
                            style: TextStyle(color: AppColors.textBody, fontSize: 12),
                          ),
                          Text(
                            "Morning Workout",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "07:00 AM",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.neonBlue,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 800.ms).moveY(begin: 30, end: 0),

              const SizedBox(height: 20),

              // Grid Section (Weather, Sleep Score, etc)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildStatCard(
                    context,
                    "Weather",
                    "24°C",
                    Icons.cloud_queue_rounded,
                    AppColors.neonBlue,
                  ),
                  _buildStatCard(
                    context,
                    "Sleep Score",
                    "85/100",
                    Icons.speed_rounded,
                    AppColors.accentPurple,
                  ),
                ],
              ).animate().fadeIn(delay: 1.seconds),

              const SizedBox(height: 20),

              // AI Quote Section
              GlassCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome_rounded, color: AppColors.accentPurple, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          "AI INSIGHT",
                          style: TextStyle(
                            color: AppColors.accentPurple.withOpacity(0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "\"You sleep best when alarms are set before 11 PM. Try to wind down early today.\"",
                      style: TextStyle(
                        color: AppColors.softWhite,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 1.2.seconds),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.textBody, fontSize: 10),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
