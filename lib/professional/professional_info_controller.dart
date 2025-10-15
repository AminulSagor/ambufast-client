import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'model/professional_info.dart';

class ProfessionalInfoController extends GetxController {
  // Keep only data; remove all edit state
  final info = const ProfessionalInfo(
    affiliationType: 'Hospital',
    organisationName: 'Bangladesh Business',
    role: 'AAA',
    zone: 'Dhaka',
    workIdPath: null,
    nidFrontPath: null,
    nidBackPath: null,
  ).obs;

  // NEW: under-review flag
  final underReview = false.obs;
  final notApproved = false.obs;

  // Navigate to edit page
  void goToEdit() {
    Get.toNamed(Routes.professionalInfoEdit, arguments: info.value);
  }

  // Called by edit page after save
  void updateInfo(ProfessionalInfo updated) {
    info.value = updated;
  }

  // NEW: call this right after the user submits for review
  void startUnderReviewMock() {
    underReview.value = true;

    // After 5s: end review, show NOT APPROVED for 5s, then clear.
    Future.delayed(const Duration(seconds: 10), () {
      // exit review
      if (!underReview.value) return;
      underReview.value = false;

      // show not approved
      notApproved.value = true;
      Future.delayed(const Duration(seconds: 5), () {
        if (notApproved.value) notApproved.value = false;
      });
    });
  }
}
