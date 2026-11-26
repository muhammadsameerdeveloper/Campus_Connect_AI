import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class ComplaintsOverviewView extends StatelessWidget {
  const ComplaintsOverviewView({super.key});

  static const Color primary = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF17315F);
  static const Color background = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkBlue),
        title: const Text(
          'Complaints',
          style: TextStyle(
            color: darkBlue,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 23),
                  const Text(
                    'Complaint Management',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GridView.count(
                    crossAxisCount: MediaQuery.sizeOf(context).width > 650
                        ? 4
                        : 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.55,
                    children: [
                      _statCard(
                        'Total',
                        '05',
                        Icons.assignment_rounded,
                        primary,
                      ),
                      _statCard(
                        'Pending',
                        '02',
                        Icons.hourglass_top_rounded,
                        Colors.orange,
                      ),
                      _statCard(
                        'In Progress',
                        '01',
                        Icons.sync_rounded,
                        const Color(0xFF8B5CF6),
                      ),
                      _statCard(
                        'Resolved',
                        '02',
                        Icons.check_circle_outline,
                        const Color(0xFF16A36A),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Manage Your Complaints',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _actionCard(
                    icon: Icons.add_circle_outline_rounded,
                    title: 'Report New Complaint',
                    subtitle: 'Submit a new campus issue.',
                    color: primary,
                    onTap: () => Get.toNamed(AppRoutes.reportComplaint),
                  ),
                  const SizedBox(height: 12),
                  _actionCard(
                    icon: Icons.history_rounded,
                    title: 'My Complaints',
                    subtitle: 'View details and track complaint status.',
                    color: const Color(0xFF16A36A),
                    onTap: () => Get.toNamed(AppRoutes.myComplaints),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF1FF),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_outline_rounded,
                          color: primary,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Tip: Provide a clear description and exact location when reporting an issue. This helps the university team resolve it faster.',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 12,
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
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF1744B5)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.support_agent_rounded, color: Colors.white, size: 35),
          SizedBox(height: 14),
          Text(
            'Your Voice Matters!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Report university issues and stay updated on their progress.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const Spacer(),
              Text(
                count,
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: darkBlue,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: const Color(0xFFE8EDF5)),
          ),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 25),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: darkBlue,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
