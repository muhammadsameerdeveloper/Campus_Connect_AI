import 'package:get/get.dart';

class ComplaintItem {
  final String id;
  final String title;
  final String category;
  final String location;
  final String date;
  final String status;
  final String description;

  ComplaintItem({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.date,
    required this.status,
    required this.description,
  });
}

class MyComplaintsController extends GetxController {
  final selectedFilter = 'All'.obs;
  final searchText = ''.obs;

  final filters = ['All', 'Pending', 'In Progress', 'Resolved'];

  final complaints = <ComplaintItem>[
    ComplaintItem(
      id: 'CMP-1024',
      title: 'Classroom AC Not Working',
      category: 'Maintenance',
      location: 'Room 204, Block A',
      date: '25 Nov 2026',
      status: 'In Progress',
      description:
          'The air conditioner in the classroom is not working properly.',
    ),
    ComplaintItem(
      id: 'CMP-1023',
      title: 'Wi-Fi Connection Issue',
      category: 'Internet',
      location: 'Library',
      date: '23 Nov 2026',
      status: 'Pending',
      description: 'University Wi-Fi is not connecting to student devices.',
    ),
    ComplaintItem(
      id: 'CMP-1022',
      title: 'Classroom Lights Problem',
      category: 'Electrical',
      location: 'Room 105, Block B',
      date: '20 Nov 2026',
      status: 'Resolved',
      description: 'Some classroom lights were not working.',
    ),
  ].obs;

  List<ComplaintItem> get filteredComplaints {
    return complaints.where((complaint) {
      final matchesFilter =
          selectedFilter.value == 'All' ||
          complaint.status == selectedFilter.value;

      final query = searchText.value.toLowerCase();

      final matchesSearch =
          complaint.title.toLowerCase().contains(query) ||
          complaint.id.toLowerCase().contains(query) ||
          complaint.category.toLowerCase().contains(query);

      return matchesFilter && matchesSearch;
    }).toList();
  }

  int get pendingCount => complaints.where((e) => e.status == 'Pending').length;

  int get progressCount =>
      complaints.where((e) => e.status == 'In Progress').length;

  int get resolvedCount =>
      complaints.where((e) => e.status == 'Resolved').length;

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  void searchComplaints(String value) {
    searchText.value = value;
  }
}
