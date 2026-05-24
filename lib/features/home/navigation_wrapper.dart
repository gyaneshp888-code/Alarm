import 'package:flutter/material.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';
import 'package:nova_alarm/features/home/dashboard_screen.dart';
import 'package:nova_alarm/features/alarm/alarm_screen.dart';
import 'package:nova_alarm/shared/widgets/glass_card.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const AlarmScreen(),
    const Center(child: Text("Weather")),
    const Center(child: Text("Vault")),
    const Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: GlassCard(
          borderRadius: 30,
          opacity: 0.1,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_rounded, "Home"),
              _buildNavItem(1, Icons.alarm_rounded, "Alarm"),
              _buildNavItem(2, Icons.cloud_outlined, "Weather"),
              _buildNavItem(3, Icons.security_rounded, "Vault"),
              _buildNavItem(4, Icons.settings_rounded, "Settings"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.neonBlue.withOpacity(0.2) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? AppColors.neonBlue : AppColors.softWhite.withOpacity(0.5),
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.neonBlue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
