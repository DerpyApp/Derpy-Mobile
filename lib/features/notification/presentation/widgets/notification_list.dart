import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/notification_model.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = NotificationModel.notifications;
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (_, _) => SizedBox(height: 6.h),
      itemBuilder: (context, index) {
        return NotificationItem(
          notification: notifications[index],
        );
      },
    );
  }
}
