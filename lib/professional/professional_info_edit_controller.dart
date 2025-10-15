import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../professional/widgets/affiliation_type_sheet.dart';
import '../professional/professional_info_controller.dart';
import 'model/professional_info.dart';
import 'widgets/confirm_change_sheet.dart';

class ProfessionalInfoEditController extends GetxController {
  // Form controllers/fields
  final formKey = GlobalKey<FormState>();
  late final TextEditingController orgCtrl;
  late final TextEditingController roleCtrl;
  late final TextEditingController zoneCtrl;

  final selectedAffiliation = ''.obs;

  // Upload paths (mock)
  final workIdPath = RxnString();
  final nidFrontPath = RxnString();
  final nidBackPath = RxnString();

  // From args
  late ProfessionalInfo original;

  // Static options (can still use your sheet)
  final affiliationTypes = const [
    'Hospital',
    'Pharmacy',
    'NGO/Clinic',
    'Community Health Volunteer',
    'Other (specify manually)',
  ];

  @override
  void onInit() {
    super.onInit();
    original = Get.arguments as ProfessionalInfo;
    orgCtrl = TextEditingController(text: original.organisationName);
    roleCtrl = TextEditingController(text: original.role);
    zoneCtrl = TextEditingController(text: original.zone);
    selectedAffiliation.value = original.affiliationType;

    workIdPath.value = original.workIdPath;
    nidFrontPath.value = original.nidFrontPath;
    nidBackPath.value = original.nidBackPath;
  }

  @override
  void onClose() {
    orgCtrl.dispose();
    roleCtrl.dispose();
    zoneCtrl.dispose();
    super.onClose();
  }

  Future<void> pickWorkId() async {
    await Future.delayed(const Duration(milliseconds: 200));
    workIdPath.value =
        '/mock/work_id_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> pickNidFront() async {
    await Future.delayed(const Duration(milliseconds: 200));
    nidFrontPath.value =
        '/mock/nid_front_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> pickNidBack() async {
    await Future.delayed(const Duration(milliseconds: 200));
    nidBackPath.value =
        '/mock/nid_back_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> openAffiliationSheet() async {
    final picked = await Get.bottomSheet<String>(
      AffiliationTypeSheet(
        current: selectedAffiliation.value,
        options: affiliationTypes,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(.35),
    );
    if (picked == null) return;
    if (picked == 'Other (specify manually)') {
      final t = TextEditingController();
      final res = await Get.dialog<String>(
        AlertDialog(
          title: Text('enter_affiliation_title'.tr),
          content: TextField(
            controller: t,
            decoration: InputDecoration(hintText: 'enter_affiliation_hint'.tr),
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
            TextButton(
              onPressed: () => Get.back(result: t.text.trim()),
              child: Text('ok'.tr),
            ),
          ],
        ),
      );
      if (res != null && res.isNotEmpty) selectedAffiliation.value = res;
    } else {
      selectedAffiliation.value = picked;
    }
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final updated = ProfessionalInfo(
      affiliationType: selectedAffiliation.value,
      organisationName: orgCtrl.text.trim(),
      role: roleCtrl.text.trim(),
      zone: zoneCtrl.text.trim(),
      workIdPath: workIdPath.value,
      nidFrontPath: nidFrontPath.value,
      nidBackPath: nidBackPath.value,
    );

    final main = Get.find<ProfessionalInfoController>();
    main.updateInfo(updated);

    // NEW: show "under review" on the view page for 5s
    main.startUnderReviewMock();

    Get.back(); // close edit page
  }

  Future<void> confirmBeforeSubmit() async {
    // simple validation before showing sheet
    if (!(formKey.currentState?.validate() ?? false)) return;

    final confirmed = await Get.bottomSheet<bool>(
      const ConfirmChangeSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(.35),
    );

    if (confirmed == true) {
      submit(); // existing method that updates the main controller & pops
    }
  }
}
