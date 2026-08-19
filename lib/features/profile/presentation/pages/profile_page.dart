import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/services/navigation_service.dart';
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
            ProfileItem(iconPath: 'edit', label: 'Edit Profile', onTap: () {}),
            const SizedBox(height: 16),
            ProfileItem(
              iconPath: 'my-booking',
              label: 'My Bookings',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ProfileItem(
              iconPath: 'notification',
              label: 'Notifications',
              onTap: () => NavigationService.pushNamed(Routes.notification),
            ),
            const SizedBox(height: 16),
            ProfileItem(iconPath: 'setting', label: 'Settings', onTap: () {}),
            const SizedBox(height: 16),
            ProfileItem(
              iconPath: 'help',
              label: 'Help & Support',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ProfileItem(
              iconPath: 'shield',
              label: 'Privacy & Policy',
              onTap: () => NavigationService.pushNamed(Routes.privacyPolicy),
            ),
          ],
        ),
      ),
    );
  }
}
