import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../data/model/activity_log_model.dart';

class TimelineTile extends StatelessWidget {
  final ActivityLog activityLog;
  final bool isLast;
  final bool isActive;

  const TimelineTile({
    super.key,
    required this.isLast,
    required this.isActive,
    required this.activityLog,
  });

  /// Format the date
  String formattedDate() {
    var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
        .parseUTC(activityLog.createdAt ?? "0000-00-00T00:00:21Z")
        .toLocal();
    String formattedDate =
        DateFormat("dd-mm-yyyy, h:mm:ss a").format(dateValue);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? R.colors.primaryColor : R.colors.secGray,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      width: 1,
                      color: R.colors.secGray,
                    ),
                  ),
                ),
            ],
          ),
          spacingH(16),
          // Timeline content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activityLog.description ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isActive ? R.colors.black : Colors.grey,
                  ),
                ),
                spacingV(4),
                Text(
                  'by ${activityLog.causer?.name ?? ''} At: ${formattedDate()}',
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? R.colors.black : Colors.grey,
                  ),
                ),
                // Show comment if available
                // if (activityLog.properties?.comment != null) ...[
                //   spacingV(4),
                //   Text(
                //     'Comment: ${activityLog.properties?.comment ?? ''}',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: isActive ? R.colors.black : Colors.grey,
                //     ),
                //   ),
                // ],
                spacingV(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
