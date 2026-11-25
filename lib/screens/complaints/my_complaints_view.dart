import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/my_complaints_controller.dart';

class MyComplaintsView extends GetView<MyComplaintsController> {
  const MyComplaintsView({super.key});

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
        centerTitle: false,
        title: const Text(
          'My Complaints',
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w800,
            fontSize: 19,
          ),
        ),
        iconTheme: const IconThemeData(color: darkBlue),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCard(),
              const SizedBox(height: 20),
              _summaryCards(),
              const SizedBox(height: 25),
              const Text(
                'Your Complaints',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: darkBlue,
                ),
              ),
              const SizedBox(height: 14),
              _searchField(),
              const SizedBox(height: 15),
              _filterChips(),
              const SizedBox(height: 18),
              _complaintList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF1744B5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.assignment_rounded, color: Colors.white, size: 32),
          SizedBox(height: 15),
          Text(
            'Track Your Complaints',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Keep track of your reported issues and stay updated on their progress.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _summaryCards() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: _summaryCard(
              'Pending',
              controller.pendingCount,
              const Color(0xFFFFF3E0),
              const Color(0xFFE58A24),
              Icons.schedule_rounded,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _summaryCard(
              'In Progress',
              controller.progressCount,
              const Color(0xFFEAF1FF),
              primary,
              Icons.autorenew_rounded,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _summaryCard(
              'Resolved',
              controller.resolvedCount,
              const Color(0xFFE9F8F0),
              const Color(0xFF16A36A),
              Icons.check_circle_outline_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(
    String title,
    int count,
    Color bgColor,
    Color iconColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 9),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      onChanged: controller.searchComplaints,
      decoration: InputDecoration(
        hintText: 'Search by title, ID or category...',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        prefixIcon: const Icon(Icons.search_rounded, color: primary),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE8EDF5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE8EDF5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: primary),
        ),
      ),
    );
  }

  Widget _filterChips() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(controller.filters.length, (index) {
            final filter = controller.filters[index];
            final isSelected = controller.selectedFilter.value == filter;

            return Padding(
              padding: EdgeInsets.only(
                right: index == controller.filters.length - 1 ? 0 : 8,
              ),
              child: GestureDetector(
                onTap: () => controller.changeFilter(filter),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? primary : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? primary : const Color(0xFFE8EDF5),
                    ),
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      color: isSelected ? Colors.white : darkBlue,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _complaintList() {
    return Obx(() {
      final items = controller.filteredComplaints;

      if (items.isEmpty) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE8EDF5)),
          ),
          child: const Column(
            children: [
              Icon(Icons.inbox_rounded, size: 45, color: Color(0xFFB8C3D4)),
              SizedBox(height: 10),
              Text(
                'No complaints found',
                style: TextStyle(color: darkBlue, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Text(
                'Try another filter or search term.',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 13),
        itemBuilder: (context, index) {
          final complaint = items[index];

          return _complaintCard(complaint);
        },
      );
    });
  }

  Widget _complaintCard(ComplaintItem complaint) {
    final statusColor = _statusColor(complaint.status);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _showDetails(complaint),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE8EDF5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      complaint.id,
                      style: const TextStyle(
                        color: primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      complaint.status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Text(
                complaint.title,
                style: const TextStyle(
                  color: darkBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.category_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    complaint.category,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      complaint.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              const Divider(height: 1, color: Color(0xFFEDF0F5)),
              const SizedBox(height: 11),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 13,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    complaint.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  const Spacer(),
                  const Text(
                    'View Details',
                    style: TextStyle(
                      color: primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 11,
                    color: primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Pending':
        return const Color(0xFFE58A24);
      case 'In Progress':
        return primary;
      case 'Resolved':
        return const Color(0xFF16A36A);
      default:
        return Colors.grey;
    }
  }

  void _showDetails(ComplaintItem complaint) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          complaint.title,
          style: const TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Complaint ID: ${complaint.id}'),
            const SizedBox(height: 8),
            Text('Category: ${complaint.category}'),
            const SizedBox(height: 8),
            Text('Location: ${complaint.location}'),
            const SizedBox(height: 8),
            Text('Date: ${complaint.date}'),
            const SizedBox(height: 8),
            Text('Status: ${complaint.status}'),
            const SizedBox(height: 15),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.w800, color: darkBlue),
            ),
            const SizedBox(height: 5),
            Text(complaint.description),
          ],
        ),
        actions: [TextButton(onPressed: Get.back, child: const Text('Close'))],
      ),
    );
  }
}
