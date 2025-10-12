// lib/modules/account/account_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/logout_confirm_sheet.dart';
import 'account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    // Assumes ScreenUtilInit is set in your main.dart
    final divider = Divider(height: 1.h, color: const Color(0xFFEAEAEA));

    return Scaffold(
      backgroundColor: const Color(0xFFF7FBF8),
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle('profile_summary'.tr),
                  _Card(
                    children: [
                      _RowItem(
                        icon: 'assets/account/profile_icon.png',
                        label: 'profile'.tr,
                        onTap: () =>
                            controller.onItemTap(Routes.profileDetails),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/review_icon.png',
                        label: 'reviews'.tr,
                        onTap: () => controller.onItemTap(Routes.allReview),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),
                  _SectionTitle('settings_prefs'.tr),
                  _Card(
                    children: [
                      _RowItem(
                        icon: 'assets/account/booking_icon.png',
                        label: 'my_booking'.tr,
                        onTap: () => controller.onItemTap(Routes.home),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/donation_icon.png',
                        label: 'my_donation_request'.tr,
                        onTap: () =>
                            controller.onItemTap(Routes.myDonationRequest),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/save_address_icon.png',
                        label: 'save_address'.tr,
                        onTap: () => controller.onItemTap(Routes.home),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/language_icon.png',
                        label: 'language'.tr,
                        trailing: Text(
                          'english_us'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                        onTap: () =>
                            controller.onItemTap(Routes.selectLanguage),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/notification_icon.png',
                        label: 'notification'.tr,
                        onTap: () => controller.onTapItem('notification'),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),
                  _SectionTitle('security_privacy'.tr),
                  _Card(
                    children: [
                      _RowItem(
                        icon: 'assets/account/change_password_icon.png',
                        label: 'change_password'.tr,
                        onTap: () => controller.onTapItem('change_password'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/sos_icon.png',
                        label: 'tap_emergency_sos'.tr,
                        onTap: () => controller.onTapItem('tap_sos'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/delete_icon.png',
                        label: 'delete_account'.tr,
                        onTap: () => controller.onTapItem('delete_account'),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),
                  _SectionTitle('support_legal'.tr),
                  _Card(
                    children: [
                      _RowItem(
                        icon: 'assets/account/help_icon.png',
                        label: 'help_center_faqs'.tr,
                        onTap: () => controller.onTapItem('help_center'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/contact_icon.png',
                        label: 'contact_support'.tr,
                        onTap: () => controller.onTapItem('contact_support'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/cancellation_policy_icon.png',
                        label: 'cancellation_policy'.tr,
                        onTap: () =>
                            controller.onTapItem('cancellation_policy'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/notification_icon.png',
                        label: 'terms_conditions'.tr,
                        onTap: () => controller.onTapItem('terms_conditions'),
                      ),
                      divider,
                      _RowItem(
                        icon: 'assets/account/review_icon.png',
                        label: 'privacy_policy'.tr,
                        onTap: () => controller.onTapItem('refund_policy'),
                      ),
                    ],
                  ),

                  SizedBox(height: 18.h),
                  _LogoutButton(
                    text: 'logout'.tr,
                    onPressed: () async {
                      final ok = await showLogoutConfirmSheet(context);
                      if (ok == true) {
                        controller.logout();
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          const BottomNavBar(currentIndex: 3),
        ],
      ),
    );
  }
}

class _Header extends GetView<AccountController> {
  _Header({super.key});
  @override
  final AccountController controller = Get.find();

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good Morning';
    if (h < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final padTop = MediaQuery.of(context).padding.top;

    return Obx(() {
      final name = controller.userName.value.trim();
      final first = name.isEmpty ? '' : name.split(' ').first;
      final phone = controller.phone.value.trim();
      final avatar = controller.avatarUrl.value.trim();
      final rating = controller.rating.value;
      final unread =
          controller.unreadCount.value; // <-- see controller note below

      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: padTop + 12.h,
          left: 16.w,
          right: 16.w,
          bottom: 16.h,
        ),
        decoration: const BoxDecoration(color: Color(0xFFFF3B30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: brand logo (image) + bell with unread dot
            Row(
              children: [
                // Use your logo image (already in assets/)
                Image.asset(
                  'assets/logo.png', // or 'assets/logo_with_color.png'
                  height: 32.h,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {}, //controller.onTapNotifications,
                      tooltip: 'Notifications',
                    ),
                    if (unread > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 10.r,
                          height: 10.r,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF3B30),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 12.h),

            // Greeting line
            Text(
              '${_greeting()}, ${first.isEmpty ? 'User' : first}!',
              style: TextStyle(
                color: Colors.white.withOpacity(.9),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 14.h),

            // Name/phone + avatar with rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.isEmpty ? '—' : name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        phone.isEmpty ? '' : phone,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.95),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.white24,
                      backgroundImage: avatar.isEmpty
                          ? null
                          : NetworkImage(avatar),
                      child: avatar.isEmpty
                          ? Icon(Icons.person, color: Colors.white, size: 22.r)
                          : null,
                    ),
                    Positioned(
                      right: 5.w,
                      bottom: -4.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              rating.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF111111),
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Icon(
                              Icons.star,
                              size: 8.r,
                              color: const Color(0xFFFFB300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  const _Card({required this.children});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _RowItem extends StatelessWidget {
  final String icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _RowItem({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.black12,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          children: [
            Image.asset(icon, width: 26.w, height: 26.w, fit: BoxFit.contain),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ),
            if (trailing != null) trailing!,
            Icon(Icons.chevron_right, size: 18.w, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _LogoutButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // give left padding to align with other items (12.w in your case)
      padding: EdgeInsets.only(left: 4.w, top: 12.h, bottom: 12.h),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          'assets/account/logout_icon.png',
          width: 26.w,
          height: 26.w,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: const Color(0xFFFF3B30),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft, // ensure icon+text left-aligned
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          foregroundColor: const Color(0xFFFF3B30),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
