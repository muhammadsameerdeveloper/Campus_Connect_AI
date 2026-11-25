import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/lost_found_controller.dart';

class LostFoundView extends GetView<LostFoundController> {
  const LostFoundView({super.key});

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
        title: const Text(
          'Lost & Found',
          style: TextStyle(
            color: darkBlue,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        iconTheme: const IconThemeData(color: darkBlue),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddItemDialog,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          'Report Item',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCard(),
              const SizedBox(height: 18),
              _statsRow(),
              const SizedBox(height: 23),
              _tabs(),
              const SizedBox(height: 17),
              _searchField(),
              const SizedBox(height: 16),
              _categories(),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Items',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '${controller.filteredItems.length} items',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              _itemsList(),
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
          Icon(Icons.travel_explore_rounded, color: Colors.white, size: 34),
          SizedBox(height: 13),
          Text(
            'Lost Something? Found Something?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Help your campus community reunite with their missing belongings.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _statsRow() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: _statCard(
              'Lost Items',
              controller.lostCount,
              const Color(0xFFFFF3E6),
              const Color(0xFFE58A24),
              Icons.search_off_rounded,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _statCard(
              'Found Items',
              controller.foundCount,
              const Color(0xFFE9F8F0),
              const Color(0xFF16A36A),
              Icons.check_circle_outline_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String title,
    int count,
    Color bg,
    Color iconColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count',
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    return Obx(() {
      final currentTab = controller.selectedTab.value;

      const tabs = ['Lost Items', 'Found Items', 'All Items'];

      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFFE9EEF7),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: tabs.map((title) {
            final isSelected = currentTab == title;

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(title),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 7,
                            ),
                          ]
                        : [],
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected ? primary : Colors.grey.shade700,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }

  Widget _tabButton(String title) {
    final selected = controller.selectedTab.value == title;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(title),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 7,
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? primary : Colors.grey.shade700,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      onChanged: controller.searchItems,
      decoration: InputDecoration(
        hintText: 'Search item, location or ID...',
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
          borderSide: const BorderSide(color: primary, width: 1.4),
        ),
      ),
    );
  }

  Widget _categories() {
    return Obx(() {
      final currentCategory = controller.selectedCategory.value;

      final categories = controller.categories;

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            final category = categories[index];

            final isSelected = currentCategory == category;

            return Padding(
              padding: EdgeInsets.only(
                right: index == categories.length - 1 ? 0 : 8,
              ),
              child: GestureDetector(
                onTap: () {
                  controller.changeCategory(category);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? primary : Colors.white,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      color: isSelected ? primary : const Color(0xFFE8EDF5),
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : darkBlue,
                      fontSize: 10,
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

  Widget _itemsList() {
    return Obx(() {
      final list = controller.filteredItems;

      if (list.isEmpty) {
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
              Icon(
                Icons.inventory_2_outlined,
                size: 42,
                color: Color(0xFFB8C3D4),
              ),
              SizedBox(height: 10),
              Text(
                'No items found',
                style: TextStyle(color: darkBlue, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Text(
                'Try another search or category.',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => _itemCard(list[index]),
      );
    });
  }

  Widget _itemCard(LostFoundItem item) {
    final isLost = item.type == 'Lost';
    final color = isLost ? const Color(0xFFE58A24) : const Color(0xFF16A36A);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _showItemDetails(item),
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
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: isLost
                          ? const Color(0xFFFFF3E6)
                          : const Color(0xFFE9F8F0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      isLost
                          ? Icons.search_off_rounded
                          : Icons.inventory_2_rounded,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: darkBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item.category} • ${item.id}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.type,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      item.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1, color: Color(0xFFEDF0F5)),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View Details',
                    style: TextStyle(
                      color: primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
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

  void _showItemDetails(LostFoundItem item) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          item.title,
          style: const TextStyle(
            color: darkBlue,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item ID: ${item.id}'),
            const SizedBox(height: 8),
            Text('Type: ${item.type}'),
            const SizedBox(height: 8),
            Text('Category: ${item.category}'),
            const SizedBox(height: 8),
            Text('Location: ${item.location}'),
            const SizedBox(height: 8),
            Text('Date: ${item.date}'),
            const SizedBox(height: 14),
            const Text(
              'Description',
              style: TextStyle(color: darkBlue, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            Text(item.description),
          ],
        ),
        actions: [TextButton(onPressed: Get.back, child: const Text('Close'))],
      ),
    );
  }

  void _showAddItemDialog() {
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final descriptionController = TextEditingController();
    final selectedType = 'Lost'.obs;
    final selectedCategory = 'Electronics'.obs;

    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Report an Item',
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.w800),
        ),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: selectedType.value,
                    decoration: _dialogDecoration('Report Type'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Lost',
                        child: Text('I Lost an Item'),
                      ),
                      DropdownMenuItem(
                        value: 'Found',
                        child: Text('I Found an Item'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) selectedType.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: titleController,
                  decoration: _dialogDecoration('Item name'),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: selectedCategory.value,
                    decoration: _dialogDecoration('Category'),
                    items: controller.categories
                        .where((category) => category != 'All')
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) selectedCategory.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: locationController,
                  decoration: _dialogDecoration('Location'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: _dialogDecoration('Description'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              titleController.dispose();
              locationController.dispose();
              descriptionController.dispose();
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (titleController.text.trim().isEmpty ||
                  locationController.text.trim().isEmpty ||
                  descriptionController.text.trim().isEmpty) {
                Get.snackbar(
                  'Missing Information',
                  'Please complete all fields.',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }

              controller.addItem(
                title: titleController.text,
                category: selectedCategory.value,
                location: locationController.text,
                description: descriptionController.text,
                type: selectedType.value,
              );

              titleController.dispose();
              locationController.dispose();
              descriptionController.dispose();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  InputDecoration _dialogDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
      filled: true,
      fillColor: background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE8EDF5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE8EDF5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary),
      ),
    );
  }
}
