import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDesktop = size.width > 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF17315F)),
        ),
        title: const Text(
          'Campus Services',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17315F),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF17315F)],
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.dashboard_customize_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'All Campus Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Access all university services from one place.',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Available Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17315F),
                  ),
                ),

                const SizedBox(height: 16),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isDesktop ? 3 : 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: isDesktop ? 1.25 : 0.95,
                  children: [
                    // Report Complaint
                    _serviceCard(
                      icon: Icons.report_problem_rounded,
                      title: 'Report Complaint',
                      subtitle: 'Submit a new complaint',
                      color: const Color(0xFF2563EB),
                      onTap: () => Get.toNamed(AppRoutes.reportComplaint),
                    ),

                    // My Complaints
                    _serviceCard(
                      icon: Icons.assignment_rounded,
                      title: 'My Complaints',
                      subtitle: 'Track your complaints',
                      color: const Color(0xFF8B5CF6),
                      onTap: () => Get.toNamed(AppRoutes.myComplaints),
                    ),

                    // Lost & Found
                    _serviceCard(
                      icon: Icons.search_rounded,
                      title: 'Lost & Found',
                      subtitle: 'Find or post lost items',
                      color: const Color(0xFF0D9488),
                      onTap: () => Get.toNamed(AppRoutes.lostFound),
                    ),

                    // AI Assistant
                    _serviceCard(
                      icon: Icons.smart_toy_rounded,
                      title: 'AI Assistant',
                      subtitle: 'Get instant assistance',
                      color: const Color(0xFFEC4899),
                      onTap: () => Get.toNamed(AppRoutes.aiAssistant),
                    ),

                    // Announcements
                    _serviceCard(
                      icon: Icons.campaign_rounded,
                      title: 'Announcements',
                      subtitle: 'University latest updates',
                      color: const Color(0xFFF59E0B),
                      onTap: () => Get.toNamed(AppRoutes.announcements),
                    ),

                    // Help & Support
                    _serviceCard(
                      icon: Icons.support_agent_rounded,
                      title: 'Help & Support',
                      subtitle: 'Get help when needed',
                      color: const Color(0xFF16A34A),
                      onTap: () => Get.toNamed(AppRoutes.helpSupport),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Information Banner
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F2FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFF2563EB),
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Need assistance? Use the AI Campus Assistant for quick guidance.',
                          style: TextStyle(
                            color: Color(0xFF17315F),
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Service Card Widget
  Widget _serviceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE8EDF5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(icon, color: color, size: 25),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF17315F),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
