import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/badge_item.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BadgeItem(),
            ProfileItem(iconPath: 'edit', label: 'Edit Profile'),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'my-booking', label: 'My Bookings'),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'notification', label: 'Notifications'),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'setting', label: 'Settings'),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'help', label: 'Help & Support'),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'shield', label: 'Privacy & Policy'),
          ],
        ),
      ),
    );
  }
}
