import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
          'My Profile',
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w800,
            fontSize: 19,
          ),
        ),
        iconTheme: const IconThemeData(color: darkBlue),
        actions: [
          IconButton(
            onPressed: _editProfile,
            icon: const Icon(Icons.edit_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _profileHeader(),

                  const SizedBox(height: 24),

                  _sectionTitle('Personal Information'),

                  const SizedBox(height: 12),

                  _infoCard(),

                  const SizedBox(height: 24),

                  _sectionTitle('Account Settings'),

                  const SizedBox(height: 12),

                  _settingsCard(),

                  const SizedBox(height: 24),

                  _logoutButton(),

                  const SizedBox(height: 25),

                  const Center(
                    child: Text(
                      'CampusConnect AI • Version 1.0.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // PROFILE HEADER

  Widget _profileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2563EB), Color(0xFF1744B5)],
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white70, width: 4),
            ),
            child: const Icon(Icons.person_rounded, size: 52, color: primary),
          ),

          const SizedBox(height: 16),

          Obx(
            () => Text(
              controller.name.value,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Obx(
            () => Text(
              controller.email.value,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'STUDENT ACCOUNT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SECTION TITLE

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: darkBlue,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  // PERSONAL INFORMATION

  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Obx(
        () => Column(
          children: [
            _infoRow(Icons.person_outline, 'Full Name', controller.name.value),

            _divider(),

            _infoRow(
              Icons.email_outlined,
              'Email Address',
              controller.email.value,
            ),

            _divider(),

            _infoRow(
              Icons.school_outlined,
              'Department',
              controller.department.value,
            ),

            _divider(),

            _infoRow(
              Icons.badge_outlined,
              'Student ID',
              controller.studentIdController.text,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primary, size: 20),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),

                const SizedBox(height: 5),

                Text(
                  value.isEmpty ? '-' : value,
                  softWrap: true,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(color: Color(0xFFEDF0F5), height: 1);
  }

  // SETTINGS

  Widget _settingsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Obx(
            () => SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(
                Icons.notifications_active_outlined,
                color: primary,
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                'Receive campus updates',
                style: TextStyle(fontSize: 11),
              ),
              activeColor: primary,
              value: controller.isNotificationsEnabled.value,
              onChanged: controller.toggleNotifications,
            ),
          ),

          _divider(),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.lock_outline, color: primary),
            title: const Text(
              'Privacy & Security',
              style: TextStyle(
                color: darkBlue,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey,
            ),
            onTap: () {
              Get.snackbar('Privacy', 'Privacy settings coming soon.');
            },
          ),

          _divider(),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.help_outline, color: primary),
            title: const Text(
              'Help & Support',
              style: TextStyle(
                color: darkBlue,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey,
            ),
            onTap: () {
              Get.snackbar('Help & Support', 'Support section coming soon.');
            },
          ),
        ],
      ),
    );
  }

  // LOGOUT

  Widget _logoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: controller.logout,
        icon: const Icon(Icons.logout_rounded),
        label: const Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.redAccent,
          side: const BorderSide(color: Colors.redAccent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  // CARD DESIGN

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFE8EDF5)),
    );
  }

  // EDIT PROFILE DIALOG

  void _editProfile() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420, maxHeight: 550),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 20),

                _editField(
                  controller.nameController,
                  'Full Name',
                  Icons.person_outline,
                ),

                const SizedBox(height: 14),

                _editField(
                  controller.emailController,
                  'Email Address',
                  Icons.email_outlined,
                ),

                const SizedBox(height: 14),

                _editField(
                  controller.departmentController,
                  'Department',
                  Icons.school_outlined,
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Cancel'),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.saveProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // EDIT FIELD

  Widget _editField(
    TextEditingController textController,
    String label,
    IconData icon,
  ) {
    return TextField(
      controller: textController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primary),
        filled: true,
        fillColor: const Color(0xFFF8FAFF),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFFE5EAF2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFFE5EAF2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
      ),
    );
  }
}
