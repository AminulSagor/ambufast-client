// lib/routes/app_pages.dart
import 'package:ambufast/ride/choose_date_time_controller.dart';
import 'package:ambufast/ride/choose_date_time_view.dart';
import 'package:ambufast/ride/request_ride_book_view.dart';
import 'package:ambufast/ride/request_ride_payment_controller.dart';
import 'package:ambufast/ride/request_ride_payment_view.dart';
import 'package:ambufast/saved_address/add_change_address_view.dart';
import 'package:ambufast/saved_address/widgets/set_location_map.dart';
import 'package:get/get.dart';

import '../account/account_controller.dart';
import '../account/account_view.dart';
import '../account/create_account_controller.dart';
import '../account/create_account_view.dart';
import '../activity/activity_controller.dart';
import '../activity/activity_view.dart';
import '../all_review/all_review_controller.dart';
import '../all_review/all_review_view.dart';
import '../bkash_payment/bkash_payment_controller.dart';
import '../bkash_payment/bkash_payment_view.dart';
import '../change_password/change_password_controller.dart';
import '../change_password/change_password_view.dart';
import '../contact_support/contact_support_controller.dart';
import '../contact_support/contact_support_view.dart';
import '../delete_account/delete_account_controller.dart';
import '../delete_account/delete_account_view.dart';
import '../donate/donate_money_controller.dart';
import '../donate/donate_money_view.dart';
import '../donate_payment_setection/support_payment_controller.dart';
import '../donate_payment_setection/support_payment_view.dart';
import '../edit_profile_details/edit_profile_details_controller.dart';
import '../edit_profile_details/edit_profile_details_view.dart';
import '../emergency_sos/emergency_sos_controller.dart';
import '../emergency_sos/emergency_sos_view.dart';
import '../help_center/help_center_controller.dart';
import '../help_center/help_center_view.dart';
import '../home/home_controller.dart';
import '../home/home_view.dart';
import '../language/language_controller.dart';
import '../launch/launch_screen_controller.dart';
import '../launch/launch_screen_view.dart';
import '../legal/legal_policy_controller.dart';
import '../legal/legal_policy_view.dart';
import '../legal/payment_cancellation_view.dart';
import '../login/login_controller.dart';
import '../login/login_view.dart';
import '../low_cost_intercity/intercity_detail_view.dart';
import '../low_cost_intercity/low_cost_intercity_controller.dart';
import '../low_cost_intercity/intercity_detail_controller.dart';
import '../low_cost_intercity/low_cost_intercity_view.dart';
import '../my_donation_request/my_donation_request_controller.dart';
import '../my_donation_request/my_donation_request_view.dart';
import '../notification/notification_controller.dart';
import '../notification/notification_view.dart';
import '../payment_success/payment_success_controller.dart';
import '../payment_success/payment_success_view.dart';
import '../profile_details/profile_details_controller.dart';
import '../profile_details/profile_details_view.dart';
import '../recover/recover_controller.dart';
import '../recover/recover_view.dart';
import '../request_submission_success/request_submission_success_controller.dart';
import '../request_submission_success/request_submission_success_view.dart';
import '../ride/request_ride_controller.dart';
import '../ride/request_ride_view.dart';
import '../saved_address/saved_address_controller.dart';
import '../saved_address/saved_address_view.dart';
import '../select_language/select_language_controller.dart';
import '../select_language/select_language_view.dart';
import '../set_password/set_password_controller.dart';
import '../set_password/set_password_view.dart';
import '../support_request/support_request_controller.dart';
import '../support_request/support_request_view.dart';
import '../support_request_review/support_request_review_controller.dart';
import '../support_request_review/support_request_review_view.dart';
import '../verify/verify_controller.dart';
import '../verify/verify_view.dart';
import 'app_routes.dart';
import '../language/language_view.dart';

class AppPages {
  AppPages._();

  static final initial = Routes.language;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.launch,
      page: () => const LaunchScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LaunchScreenController>(() => LaunchScreenController());
      }),
    ),

    GetPage(
      name: Routes.language,
      page: () => const LanguageView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LanguageController>(() => LanguageController());
      }),
    ),

    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        // ✅ Add fenix: true so a fresh LoginController is recreated
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),

    GetPage(
      name: Routes.recover,
      page: () => const RecoverView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RecoverController>(() => RecoverController());
      }),
    ),

    GetPage(
      name: Routes.verify,
      page: () => const VerifyView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<VerifyController>(() => VerifyController());
      }),
    ),

    GetPage(
      name: Routes.setPassword,
      page: () => const SetPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SetPasswordController>(() => SetPasswordController());
      }),
    ),
    GetPage(
      name: Routes.createAccount,
      page: () => const CreateAccountView(),
      binding: BindingsBuilder.put(() => CreateAccountController()),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),

    GetPage(
      name: Routes.donateMoney,
      page: () => const DonateMoneyView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DonateMoneyController>(() => DonateMoneyController());
      }),
    ),

    GetPage(
      name: Routes.supportPayment,
      page: () => const SupportPaymentView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportPaymentController>(() => SupportPaymentController());
      }),
    ),

    GetPage(
      name: Routes.bkashPayment,
      page: () => const BkashPaymentView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BkashPaymentController>(() => BkashPaymentController());
      }),
    ),

    GetPage(
      name: Routes.paymentSuccessful,
      page: () => const PaymentSuccessView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PaymentSuccessController>(() => PaymentSuccessController());
      }),
    ),

    GetPage(
      name: Routes.requestSupport,
      page: () => const SupportRequestView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportRequestController>(() => SupportRequestController());
      }),
    ),

    GetPage(
      name: Routes.supportRequestReview,
      page: () => const SupportRequestReviewView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportRequestReviewController>(
          () => SupportRequestReviewController(),
        );
      }),
    ),

    GetPage(
      name: Routes.requestSubmissionSuccess,
      page: () => const RequestSubmissionSuccessView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RequestSubmissionSuccessController>(
          () => RequestSubmissionSuccessController(),
        );
      }),
    ),

    GetPage(
      name: Routes.requestRide,
      page: () => const RequestRideView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RequestRideController>(() => RequestRideController());
      }),
    ),

    GetPage(
      name: Routes.account,
      page: () => const AccountView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AccountController>(() => AccountController());
      }),
    ),

    GetPage(
      name: Routes.profileDetails,
      page: () => const ProfileDetailsView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<ProfileDetailsController>()) {
          Get.delete<ProfileDetailsController>(force: true);
        }
        Get.put(ProfileDetailsController());
      }),
    ),

    GetPage(
      name: Routes.editProfileDetails,
      page: () => const EditProfileDetailsView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<EditProfileDetailsController>()) {
          Get.delete<EditProfileDetailsController>(force: true);
        }
        Get.put(EditProfileDetailsController());
      }),
    ),

    GetPage(
      name: Routes.allReview,
      page: () => const AllReviewView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<AllReviewController>()) {
          Get.delete<AllReviewController>(force: true);
        }
        Get.put(AllReviewController());
      }),
    ),
    GetPage(
      name: Routes.selectLanguage,
      page: () => const SelectLanguageView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<SelectLanguageController>()) {
          Get.delete<SelectLanguageController>(force: true);
        }
        Get.put(SelectLanguageController());
      }),
    ),

    GetPage(
      name: Routes.emergencySos,
      page: () => const EmergencySosView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<EmergencySosController>()) {
          Get.delete<EmergencySosController>(force: true);
        }
        Get.put(EmergencySosController());
      }),
    ),

    GetPage(
      name: Routes.myDonationRequest,
      page: () => const MyDonationRequestView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<MyDonationRequestController>()) {
          Get.delete<MyDonationRequestController>(force: true);
        }
        Get.put(MyDonationRequestController());
      }),
    ),

    GetPage(
      name: Routes.requestRideBook,
      page: () => const RequestRideBookView(),
      binding: BindingsBuilder(() {
        // if (Get.isRegistered<RequestRideController>()) {
        //   Get.delete<RequestRideController>(force: false);
        // }
        Get.put(RequestRideController());
      }),
    ),

    GetPage(
      name: Routes.requestRidePayment,
      page: () => const RequestRidePaymentView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<RequestRidePaymentController>()) {
          Get.delete<RequestRidePaymentController>(force: false);
        }
        Get.put(RequestRidePaymentController());
      }),
    ),

    GetPage(
      name: Routes.chooseDateTime,
      page: () => const ChooseDateTimeView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<ChooseDateTimeController>()) {
          Get.delete<ChooseDateTimeController>(force: false);
        }
        Get.put(ChooseDateTimeController());
      }),
    ),

    GetPage(
      name: Routes.lowCostIntercity,
      page: () => const LowCostIntercityView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<LowCostIntercityController>()) {
          Get.delete<LowCostIntercityController>(force: false);
        }
        Get.put(LowCostIntercityController());
      }),
    ),

    GetPage(
      name: Routes.intercityDetails,
      page: () => const IntercityDetailView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<IntercityDetailController>()) {
          Get.delete<IntercityDetailController>(force: false);
        }
        Get.put(IntercityDetailController());
      }),
    ),

    GetPage(
      name: Routes.helpCenter,
      page: () => const HelpCenterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HelpCenterController>(() => HelpCenterController());
      }),
    ),

    GetPage(
      name: Routes.contactSupport,
      page: () => const ContactSupportView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ContactSupportController>(() => ContactSupportController());
      }),
    ),

    GetPage(
      name: Routes.legalPolicy,
      page: () => const LegalPolicyView(),
      binding: BindingsBuilder(() {
        // New instance on every Get.find<LegalPolicyController>()
        Get.create<LegalPolicyController>(() => LegalPolicyController());
      }),
    ),

    GetPage(
      name: Routes.cancellationPaymentInfo,
      page: () => const PaymentCancellationInfoView(),
    ),

    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<ChangePasswordController>()) {
          Get.delete<ChangePasswordController>(force: true);
        }
        Get.put(ChangePasswordController());
      }),
    ),

    GetPage(
      name: Routes.deleteAccount,
      page: () => const DeleteAccountView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<DeleteAccountController>()) {
          Get.delete<DeleteAccountController>(force: true);
        }
        Get.put(DeleteAccountController());
      }),
    ),

    GetPage(
      name: Routes.notification,
      page: () => const NotificationView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<NotificationController>()) {
          Get.delete<NotificationController>(force: true);
        }
        Get.put(NotificationController());
      }),
    ),

    GetPage(
      name: Routes.activity,
      page: () => const ActivityView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ActivityController>(() => ActivityController());
      }),
    ),

    GetPage(
      name: Routes.savedAddress,
      page: () => const SavedAddressView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SavedAddressController>(() => SavedAddressController());
      }),
    ),

    GetPage(
      name: Routes.addChangeAddress,
      page: () => const AddChangeAddressView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SavedAddressController>(() => SavedAddressController());
      }),
    ),

    GetPage(name: Routes.setLocationMap, page: () => const SetLocationMap()),
  ];
}
