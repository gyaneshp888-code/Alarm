import 'package:flutter/material.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';
import 'package:nova_alarm/shared/widgets/glass_card.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alarms",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const GlassCard(
                    padding: EdgeInsets.all(8),
                    borderRadius: 12,
                    child: Icon(Icons.add_rounded, color: AppColors.neonBlue),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildAlarmCard(context, "06:45", "AM", "Morning Run", true),
              const SizedBox(height: 16),
              _buildAlarmCard(context, "08:30", "AM", "Work Meeting", false),
              const SizedBox(height: 16),
              _buildAlarmCard(context, "10:00", "PM", "Sleep Routine", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmCard(BuildContext context, String time, String period, String label, bool isEnabled) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      opacity: isEnabled ? 0.12 : 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    time,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: isEnabled ? AppColors.softWhite : AppColors.softWhite.withOpacity(0.3),
                        ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 16,
                      color: isEnabled ? AppColors.neonBlue : AppColors.neonBlue.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              Text(
                label,
                style: TextStyle(
                  color: isEnabled ? AppColors.textBody : AppColors.textBody.withOpacity(0.3),
                ),
              ),
            ],
          ),
          Switch(
            value: isEnabled,
            onChanged: (val) {},
            activeColor: AppColors.neonBlue,
            activeTrackColor: AppColors.neonBlue.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
