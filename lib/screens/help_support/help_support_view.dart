import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  static const Color primary = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF17315F);

  void showAnswer(String question, String answer) {
    Get.dialog(
      AlertDialog(
        title: Text(
          question,
          style: const TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        content: Text(answer, style: const TextStyle(height: 1.6)),
        actions: [TextButton(onPressed: Get.back, child: const Text('Got it'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'How can I report a complaint?',
        'answer':
            'Open Campus Services, select Report Complaint, fill in the required details and submit your complaint.',
        'icon': Icons.report_problem_rounded,
      },
      {
        'question': 'How can I track my complaint?',
        'answer':
            'Open My Complaints to view the status and details of your submitted complaints.',
        'icon': Icons.track_changes_rounded,
      },
      {
        'question': 'How can I report a lost item?',
        'answer':
            'Open Lost & Found and use the option to post your lost or found item.',
        'icon': Icons.search_rounded,
      },
      {
        'question': 'How can I contact university support?',
        'answer':
            'Please contact your university administration or student affairs office for assistance.',
        'icon': Icons.support_agent_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: darkBlue,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [primary, darkBlue]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.support_agent_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'How can we help you?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Find answers to common questions about CampusConnect AI.',
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              ...faqs.map((faq) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE8EDF5)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F0FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(faq['icon'] as IconData, color: primary),
                    ),
                    title: Text(
                      faq['question'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: darkBlue,
                        fontSize: 13,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.grey,
                    ),
                    onTap: () => showAnswer(
                      faq['question'] as String,
                      faq['answer'] as String,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F2FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.headset_mic_rounded, color: primary, size: 35),
                    SizedBox(height: 10),
                    Text(
                      'Still need help?',
                      style: TextStyle(
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Contact your university administration for further assistance.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
