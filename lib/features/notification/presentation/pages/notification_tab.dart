import 'package:flutter/material.dart';

import '../widgets/notification_header_item.dart';
import '../widgets/notification_list.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            NotificationHeaderItem(),
            Expanded(child: NotificationList()),
          ],
        ),
      ),
    );
  }
}
