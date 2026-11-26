import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  static const Color primary = Color(0xFF2563EB);
  static const Color background = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Item Details',
          style: TextStyle(
            color: Color(0xFF17315F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size.width > 600 ? 320 : 240,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EDFF),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.backpack_outlined,
                    size: 110,
                    color: primary,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Black Student Backpack',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17315F),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F8E9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Found',
                        style: TextStyle(
                          color: Color(0xFF16834A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  'A black backpack found near the university library.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 24),

                _detailCard(
                  Icons.location_on_outlined,
                  'Location',
                  'University Central Library',
                ),
                _detailCard(
                  Icons.calendar_today_outlined,
                  'Date Found',
                  '25 November 2026',
                ),
                _detailCard(
                  Icons.category_outlined,
                  'Category',
                  'Bags & Accessories',
                ),
                _detailCard(Icons.person_outline, 'Posted By', 'Ali Ahmed'),

                const SizedBox(height: 25),

                const Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17315F),
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFE5EDFF),
                        child: Icon(Icons.person, color: primary),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ali Ahmed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Computer Science Student',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.snackbar(
                        'Contact',
                        'Contact feature will be connected soon.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    icon: const Icon(Icons.chat_outlined),
                    label: const Text(
                      'Contact Owner',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _detailCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: primary, size: 23),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF17315F),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
