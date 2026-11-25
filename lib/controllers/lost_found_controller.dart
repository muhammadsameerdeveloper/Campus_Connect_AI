import 'package:get/get.dart';

class LostFoundItem {
  final String id;
  final String title;
  final String category;
  final String location;
  final String date;
  final String type;
  final String description;

  LostFoundItem({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.date,
    required this.type,
    required this.description,
  });
}

class LostFoundController extends GetxController {
  final selectedTab = 'Lost Items'.obs;
  final selectedCategory = 'All'.obs;
  final searchText = ''.obs;

  final categories = [
    'All',
    'Electronics',
    'Books',
    'Accessories',
    'Documents',
    'Other',
  ];

  final items = <LostFoundItem>[
    LostFoundItem(
      id: 'LF-1001',
      title: 'Black Samsung Headphones',
      category: 'Electronics',
      location: 'Library, Ground Floor',
      date: '25 Nov 2026',
      type: 'Lost',
      description:
          'Black wireless headphones were misplaced near the library study area.',
    ),
    LostFoundItem(
      id: 'LF-1002',
      title: 'Blue University Notebook',
      category: 'Books',
      location: 'Block A, Room 204',
      date: '24 Nov 2026',
      type: 'Found',
      description: 'A blue notebook was found after the afternoon lecture.',
    ),
    LostFoundItem(
      id: 'LF-1003',
      title: 'Student ID Card',
      category: 'Documents',
      location: 'Cafeteria',
      date: '23 Nov 2026',
      type: 'Found',
      description:
          'A student identity card was found near the cafeteria entrance.',
    ),
    LostFoundItem(
      id: 'LF-1004',
      title: 'Silver Wrist Watch',
      category: 'Accessories',
      location: 'Sports Complex',
      date: '22 Nov 2026',
      type: 'Lost',
      description: 'A silver wrist watch was lost around the sports complex.',
    ),
  ].obs;

  List<LostFoundItem> get filteredItems {
    final query = searchText.value.trim().toLowerCase();

    return items.where((item) {
      final matchesTab =
          selectedTab.value == 'All Items' ||
          (selectedTab.value == 'Lost Items' && item.type == 'Lost') ||
          (selectedTab.value == 'Found Items' && item.type == 'Found');

      final matchesCategory =
          selectedCategory.value == 'All' ||
          item.category == selectedCategory.value;

      final matchesSearch =
          item.title.toLowerCase().contains(query) ||
          item.location.toLowerCase().contains(query) ||
          item.id.toLowerCase().contains(query);

      return matchesTab && matchesCategory && matchesSearch;
    }).toList();
  }

  int get lostCount => items.where((item) => item.type == 'Lost').length;
  int get foundCount => items.where((item) => item.type == 'Found').length;

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void searchItems(String value) {
    searchText.value = value;
  }

  void addItem({
    required String title,
    required String category,
    required String location,
    required String description,
    required String type,
  }) {
    items.insert(
      0,
      LostFoundItem(
        id: 'LF-${1001 + items.length}',
        title: title.trim(),
        category: category,
        location: location.trim(),
        date: '25 Nov 2026',
        type: type,
        description: description.trim(),
      ),
    );

    selectedTab.value = type == 'Lost' ? 'Lost Items' : 'Found Items';
    selectedCategory.value = 'All';

    Get.back();

    Get.snackbar(
      'Report Added',
      'Your ${type.toLowerCase()} item has been added successfully (Demo).',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
