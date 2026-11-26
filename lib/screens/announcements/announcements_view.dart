import 'package:flutter/material.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  static const Color primary = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF17315F);

  @override
  Widget build(BuildContext context) {
    final announcements = [
      {
        'title': 'Semester Registration Open',
        'description': 'Students can now register for the upcoming semester.',
        'date': '26 Nov 2026',
        'category': 'Academic',
        'icon': Icons.school_rounded,
        'color': Color(0xFF2563EB),
      },
      {
        'title': 'Annual Sports Week',
        'description':
            'Join us for exciting sports activities and competitions.',
        'date': '24 Nov 2026',
        'category': 'Events',
        'icon': Icons.sports_basketball_rounded,
        'color': Color(0xFF16A34A),
      },
      {
        'title': 'Library Timing Update',
        'description': 'The university library will remain open until 8 PM.',
        'date': '22 Nov 2026',
        'category': 'Notice',
        'icon': Icons.local_library_rounded,
        'color': Color(0xFFF59E0B),
      },
      {
        'title': 'Fee Submission Reminder',
        'description': 'Please submit your semester fee before the due date.',
        'date': '20 Nov 2026',
        'category': 'Important',
        'icon': Icons.payments_rounded,
        'color': Color(0xFFDC2626),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text(
          'Announcements',
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: darkBlue,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [primary, darkBlue]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.campaign_rounded, color: Colors.white, size: 35),
                    SizedBox(height: 14),
                    Text(
                      'University Updates',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Stay informed about the latest campus news and notices.',
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Recent Announcements',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
              const SizedBox(height: 15),
              ...announcements.map((item) {
                final color = item['color'] as Color;

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE8EDF5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Icon(item['icon'] as IconData, color: color),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: darkBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Text(
                        item['description'] as String,
                        style: const TextStyle(
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            item['category'] as String,
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.calendar_today_rounded,
                            size: 13,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item['date'] as String,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
