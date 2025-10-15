// lib/core/localization/app_translations.dart
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // ======================= ENGLISH =======================
    'en_US': {
      // ----- Common -----
      'back': 'Back',
      'powered':
          'Powered By SafeCare24/7 Medical Services Limited\nBeta Version 1.0',
      'choose': 'Choose',
      'done': 'Done',
      'select': 'Select',

      // ----- Welcome -----
      'welcome_title': 'Welcome to AmbuFast',
      'welcome_subtitle':
          'The largest ambulance network and ride sharing platform in Bangladesh',
      'login': 'Login',
      'create_account': 'Create Account',

      // ----- Language -----
      'language_english': 'English',
      'language_bangla': 'Bangla',
      'continue_btn': 'Continue',

      // ----- Login -----
      'login_title': 'Welcome to AmbuFast',
      'login_subtitle': 'Your Emergency Ride sharing Partner.',
      'tab_phone': 'Phone Number',
      'tab_email': 'Email Address',
      'label_phone': 'Phone',
      'label_email': 'Email',
      'label_password': 'Password',
      'hint_phone': 'Enter phone number',
      'hint_email': 'Enter email address',
      'hint_password': 'Enter password',
      'recover_password': 'Recover Password',
      'login_btn': 'Login',
      'no_account': 'Don’t have an account?',
      'create': 'Create',
      'country_code_bd': '+880',

      // ----- Recover Password -----
      'recover_title': 'Recover Password',
      'recover_subtitle_phone':
          'Please enter the phone number you used during registration to proceed with resetting your password.',
      'recover_subtitle_email':
          'Please enter the email address you used during registration to proceed with resetting your password.',
      'send_otp': 'Send OTP',
      'have_account_q': 'Have an account?',

      // ----- Verify OTP -----
      'verify_title': 'Verify Your Account',
      'verify_subtitle_phone':
          'We’ve sent a one-time password (OTP) to your phone number. Please enter the code below to complete verification.',
      'verify_subtitle_email':
          'We’ve sent a one-time password (OTP) to your email address. Please enter the code below to complete verification.',
      'resend_otp': 'Resend OTP',
      'change_phone': 'Change Phone Number',
      'change_email': 'Change Email',
      'verify_btn': 'Verify',
      'timer_mm_ss': '%s:%s',

      // ----- Create Account -----
      'create_account_title': 'Create Your AmbuFast Account',
      'full_name': 'Full Name*',
      'hint_full_name': 'Enter full name',
      'dob': 'Date of Birth*',
      'gender_q': 'What is your gender?*',
      'male': 'Male',
      'female': 'Female',
      'others': 'Others',
      'blood_group': 'Blood Group*',
      'blood_group_p': 'Blood Group',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'hint_confirm_password': 'Enter confirm password',
      'next': 'Next',
      'req_field': 'This field is required',
      'min_6_chars': 'Minimum 6 characters',
      'password_mismatch': 'Passwords do not match',
      'invalid_title': 'Invalid form',
      'invalid_msg': 'Please complete all required fields correctly.',
      'terms_pre_a': 'By continuing I agree with the ',
      'terms_pre_b': 'terms and condition',
      'agree_continue': 'Agree and Continue',

      // ----- Set New Password -----
      'setpw_title': 'Set New Password',
      'setpw_subtitle':
          'Your new password should be strong and easy for you to remember.',
      'pw': 'Password',
      'confirm_pw': 'Confirm Password',
      'hint_pw': 'Enter password',
      'hint_confirm_pw': 'Enter confirm password',
      'submit': 'Submit',
      'pw_mismatch': 'Passwords do not match',
      'pw_too_short': 'Password must be at least 8 characters',
      'pw_updated': 'Password updated successfully',

      // ----- Profile creating -----
      'profile_creating': 'Your profile is being created...',
      'profile_customising': 'Customising your recommendations...',

      // ========== HOME (NEW) ==========
      'app_name': 'AmbuFast',
      'home_where_to': 'Where to?',
      'home_go_later': 'Go Later',
      'home_view_all': 'View All',

      'home_emergency': 'Emergency',
      'home_emergency_ac_ambulance': 'AC Ambulance',
      'home_emergency_non_ac_ambulance': 'Non AC Ambulance',
      'home_emergency_icu_ambulance': 'ICU/CCU Ambulance',
      'home_emergency_freezing_van': 'Freezing Van',

      'home_non_emergency': 'Non Emergency',
      'home_non_emergency_motorcycle': 'Motorcycle',
      'home_non_emergency_cng': 'CNG',
      'home_non_emergency_micro': 'Micro',

      'home_upcoming_trips': 'Upcoming Trips',
      'home_upcoming': 'Upcoming',

      'home_offer_title': '30% Savings',
      'home_offer_sub': 'on pregnancy pre-booking',
      'home_offer_code': 'CODE  PREAB01',

      'home_low_cost_intracity': 'Low Cost Intracity',
      'home_campaign': 'Campaign',
      'home_campaign_heart_attack': 'Heart Attack',
      'home_campaign_dialysis': 'Dialysis',
      'home_campaign_disabled': 'Disable Patient',

      'home_last_ride_title': 'Last Ride with Respect',
      'home_last_ride_body':
          'Your donation ensures a dignified final journey for those who cannot afford funeral transport.',
      'home_support_now': 'Support Now',

      'home_funeral_support_title': 'Last Ride with Respect',
      'home_funeral_support_body':
          'If your family is struggling with funeral transport costs, apply for our donation-based service to ensure a respectful farewell.',
      'home_request_support': 'Request Support',

      //.........enable_location............
      'loc_enable_title': 'Enable your location',
      'loc_enable_subtitle':
          'Choose your location to start find the request around you',
      'loc_use_my_location': 'Use my location',
      'loc_skip': 'Skip for now',

      // --- Support screen (choose) ---
      'support': 'Support',
      'choose_cause': 'Choose a Cause',
      'choose_amount': 'Choose Amount',
      'others_amount': 'Others Amount',
      'enter_amount': 'Enter Amount',
      'cant_find': 'Can’t find what you’re looking for?',
      'contact_support': 'Contact Support',
      'review': 'Review',
      'validation_title': 'Validation',
      'validation_support_msg':
          'Please select a cause, set an amount and agree to the terms.',

      // Cause labels
      'cause_general_fund': 'General Fund',
      'cause_ambulance_trip_help': 'Ambulance Trip Help',
      'cause_emergency_medical_help': 'Emergency Medical Help',
      'cause_dead_body_transfer': 'Dead Body Transfer',

      // --- Support Review / Payment Method ---
      'support_review': 'Support Review',
      'cause': 'Cause',
      'amount': 'Amount',
      'edit_below': 'You can edit below',
      'change': 'Change',
      'choose_payment': 'Choose Payment Method',
      'pay_now': 'Pay Now',

      // Payment methods (titles)
      'bkash': 'bKash',
      'nagad': 'Nagad',
      'city_bank': 'City Bank',
      'visa_master': 'Visa/Master Card',
      'pay_station': 'Pay Station',

      // Payment method subtitles
      'pay_bkash': 'Pay with bKash',
      'discount_10': 'Get 10% discount',

      // Payment validation / messages
      'validation_payment_msg': 'Please select a payment method.',
      'selected_method': 'Selected Method: @method',

      'payment': 'Payment',
      'invoice_number': 'Invoice Number',
      'bdt': 'BDT',
      'your_bkash_number': 'Your bKash Account Number',
      'bkash_placeholder': 'e.g 01XXXXXXXXX',
      'confirm_process_prefix': 'Confirm and Process, ',
      'terms_and_conditions': 'terms & conditions',
      'cancel': 'Cancel',
      'confirm': 'Confirm',

      'payment_success_title':
          'Payment Successful!\nYour Vehicle booking is confirmed.',
      'payment_success_body':
          'We’ve received your booking payment of ৳@amount. Your Vehicle is on its way to your pickup location on time.',
      'go_to_my_activity': 'Go to My Activity',
      'back_to_home': 'Back to home',

      // === EN ===
      'request_support_title': 'Support Request',
      'request_support_step': 'Step 1 of 2',
      'start_a_request': 'Start A Request',
      'start_a_request_hint':
          'Tell us what you need help with. You can upload bills or prescriptions for faster approval.',

      'request_cause': 'Request Cause*',
      'amount_needed': 'Amount Needed*',
      'urgency': 'Urgency*',
      'describe_situation': 'Describe Your Situation*',
      'hint_enter_amount': 'Enter amount',
      'hint_select_cause': 'Select cause',
      'hint_select_urgency': 'Select urgency',
      'hint_write_situation': 'Write your situation',

      'doc_upload_title': 'Document Upload (Optional)',
      'doc_upload_sub': 'Add bill or prescriptions',
      'doc_upload_drop': 'Drag your file(s) or browse',
      'doc_upload_max': 'Max 10 MB files are allowed',
      'doc_upload_types': 'Only support .jpg, .png files',

      'nid_front_title': 'Front Side of National ID Card*',
      'nid_back_title': 'Back Side of National ID Card*',
      'click_to_upload_front': 'Click to Upload Front Side of Card',
      'click_to_upload_back': 'Click to Upload Back Side of Card',
      'max_file_size_25': '(Max. File size: 25 MB)',

      'agree_verification':
          'By submitting, you agree to our verification process and terms.',
      'continue': 'Continue',

      // validation
      'vs_select_cause': 'Please select a request cause.',
      'vs_amount': 'Please enter a valid amount.',
      'vs_urgency': 'Please select urgency.',
      'vs_desc': 'Please describe your situation.',
      'vs_nid_front': 'Please upload NID front image.',
      'vs_nid_back': 'Please upload NID back image.',
      'vs_terms': 'Please agree to the terms to continue.',
      'file_too_large': 'File is larger than allowed size.',
      'file_type_invalid': 'Only JPG/PNG allowed.',

      // ===== EN =====
      'request_review_title': 'Request Review',
      'confirm_request': 'Confirm Your Request',
      'confirm_request_hint':
          'Double-check details before submitting. You can always edit items below.',
      'step_2_of_2': 'Step 2 of 2',

      'rr_cause': 'Cause',
      'rr_amount_needed': 'Amount Needed',
      'rr_urgency': 'Urgency',
      'rr_describe': 'Describe you situation',

      'rr_you_can_edit_below': 'You Can Edit Below',
      'rr_change': 'Change',
      'rr_submit_for_review': 'Submit for Review',

      'rr_doc_clinic_bill': 'Clinic Bill',
      'rr_doc_front_id': 'Front ID',
      'rr_doc_back_id': 'Back ID',
      'rr_within_24h': 'Within 24 Hours',

      // ===== EN =====
      'rs_success_title': "You're all set",
      'rs_success_body':
          "Your request has been submitted for review.\nWe'll notify you as soon as it's approved.",
      'rs_estimated_label': 'Estimated: under 6 hours',
      'rs_go_to_activity': 'Go to My Activity',
      'rs_back_home': 'Back to home',

      // ----- Request Ride -----
      'request_ride_title': 'Request a Ride',
      'pickup_now': 'Pickup now',
      'for_me': 'For me',
      'ac_ambulance': 'AC Ambulance',
      'pickup_address_hint': 'Pickup address',
      'dropoff_address_hint': 'Drop-off address',
      'need_round_trip': 'I need round trip',
      'set_location_on_map': 'Set location on map',
      'saved_address': 'Saved address',
      'popular_places': 'Popular places',

      // ----- Request Ride (places) -----
      'place_airport_title': 'Hazrat Shahjalal International Airport',
      'place_airport_sub': 'Airport - Dakshinkhan Rd, Dhaka',

      'place_jfp_title': 'Jamuna Future Park',
      'place_jfp_sub': 'KA-244, Kuril, Progoti Shoroni, Dhaka',

      'place_bcity_title': 'Bashundhara City Shopping Complex',
      'place_bcity_sub': '3 No Tejturi Bazar West, পল্লব পথ, ঢাকা',

      // ----- Bottom sheets (When / Contact / Service) -----
      'when_sheet_title': 'When do you need a ride?',
      'when_now_title': 'Now',
      'when_now_sub': 'Request a ride, hop-in, and go',
      'when_later_title': 'Later',
      'when_later_sub': 'Reserve for extra peace of mind',

      'contact_sheet_title': 'Switch contact',
      'contact_me_title': 'Me',
      'contact_add_title': 'Add New Contact',

      'service_sheet_title': 'Switch service',
      'service_non_ac': 'Non AC Ambulance',
      'service_ac': 'AC Ambulance',
      'service_icu': 'ICU/CCU Ambulance',
      'service_freezing': 'Freezing Van',
      'service_row_sub': 'Request a ride, hop-in, and go',

      // ----- Booking Info Modal -----
      'book_info_title': 'Book Information',
      'relationship_with_patient': 'Relationship With Patient',
      'how_did_you_hear_about_us': 'How Did You Hear About Us?',
      'patient_phone_address': 'Patient phone & address',
      'enter_patient_phone_address': 'Enter patient phone & address',
      'describe_patient_condition':
          'Please describe about the patient condition',
      'skip': 'Skip',

      'signup_subtitle': 'Sign up or book emergency service in seconds.',
      // Common
      'account': 'Account',
      'good_morning': 'Good Morning,',
      'rating': '5.0',

      // Sections
      'profile_summary': 'Profile Summary',
      'settings_prefs': 'Settings & Preferences',
      'security_privacy': 'Security & Privacy',
      'support_legal': 'Support & Legal',

      // Items
      'profile': 'Profile',
      'reviews': 'Reviews',
      'my_booking': 'My Booking',
      'my_donation_request': 'My Donation & Request',
      'save_address': 'Save Address',
      'language': 'Language',
      'notification': 'Notification',
      'change_password': 'Change Password',
      'tap_emergency_sos': 'Tap Emergency SOS',
      'help_center_faqs': 'Help Center / FAQs',

      'cancellation_policy': 'Cancellation Policy',
      'terms_conditions': 'Terms & Conditions',
      'privacy_policy': 'Privacy Policy',
      'logout': 'Logout',
      'english_us': 'English (US)',

      'profile_details': 'Profile details',
      'basic_information': 'Basic Information',
      'member_since': 'Member since',
      'name': 'Name',
      'date_of_birth': 'Date Of Birth',
      'gender': 'Gender',

      'contact_information': 'Contact information',
      'phone': 'Phone',
      'email': 'Email',
      'street_addresse': 'Street address',
      'apartment_suite_unit': 'Apartment, Suite, Unit',
      'city': 'City',
      'state': 'State',
      'zip_code': 'Zip Code',
      'country': 'Country',
      'edit': 'Edit',
      'edit_profile_details': 'Edit profile details',
      // Actions
      'update': 'Update',
      'upload_profile_photo': 'Upload profile photo',
      // Common options
      'other': 'Other',
      // Logout confirm (your bottom sheet)
      'are_you_sure': 'Are you sure?',
      'logout_confirm_message':
          'Are you sure you want to log out? You might miss important trips.',
      'yes_logout': 'Yes, Logout',

      // screen & sections
      'email_address': 'Email Address',
      'apartment_suite_unit_optional': 'Apartment, Suite, Unit (optional)',

      // validation / feedback
      'required_field': 'This field is required',
      'success': 'Success',
      'profile_updated_successfully': 'Profile updated successfully',
      'select_blood_group': 'Select blood Group',
      'select_gender': 'Select Gender',
      'select_state': 'Select State',
      'select_country': 'Select Country',

      'all_review': 'All Review',

      // sample titles & body used above
      'good_ride_title': 'Good Ride, but can be great!',
      'great_ride_title': 'Great ride',
      'bad_ride_title': 'Bad ride',
      'review_body_sample':
          'I think the exterior and interior is much nicer than other ambulance in its class.',

      'language_title': 'Language',
      'language_updated': 'Language updated',

      // List labels (kept to match screenshot)
      'english_uk': 'English (UK)',
      'mandarin': 'Mandarin',
      'spanish': 'Spanish',
      'french': 'French',
      'arabic': 'Arabic',
      'bengali': 'Bengali',
      'russian': 'Russian',
      'japanese': 'Japanese',
      'korean': 'Korean',
      'indonesian': 'Indonesia',
      'indian': 'Indian',
      'germany': 'Germany',
      'chainish': 'Chainish',

      'emergency_sos_title': 'Tap Emergency SOS',
      'error': 'Error',
      'call_failed': 'Could not open dialer',

      'my_donation_request_title': 'My Donation & Request',
      'support_tab': 'Support',
      'request_tab': 'Request',
      'search_by_date': 'Search by date',
      'total_support': 'Total Donation',
      'receipt': 'Receipt',
      'pending': 'Pending',
      'approved': 'Approved',
      'rejected': 'Rejected',
      'ambulance_fare': 'Ambulance Fare',

      // ===== en_US additions =====
      'enter_full_name': 'Enter full name',
      'yyyy-mm-dd': 'YYYY-MM-DD',
      'dd-mm-yyyy': 'DD-MM-YYYY',
      'enter_phone': 'Enter phone number',
      'street_address': 'Street address', // fixes the earlier typo
      'enter_street_address': 'Enter street address',
      'apt_suite_unit': 'Apartment, Suite, Unit',
      'enter_city': 'Enter city',
      'enter_zip_code': 'Enter ZIP code',

      // ===== en_US =====
      'update_success_title': 'Update successfully',
      'update_success_body': 'Your profile has been updated successfully',

      // Request Ride Booking
      'booking_details': 'Booking details',
      'date_time': 'Date & Time:',
      'contact': 'Contact:',
      'vehicle': 'Vehicle:',
      'trip_type': 'Trip type:',
      'single_trip': 'Single trip',
      'category': 'Category:',
      'emergency': 'Emergency',
      'from': 'From',
      'to': 'To',
      'jhiga_address': 'Jhigatola Road, Dhaka, Bangladesh',
      'square_address': 'Square Hospital, Panthapath, Dhaka 1205, Bangladesh',
      'distance_est_time': 'Distance & Est. Time:',
      'minutes': 'Mins',
      'lowest_fare': 'Lowest fare',
      'total': 'Total',
      'without_toll': 'without toll fee',
      'cash': 'Cash',
      'request_send': 'Request Send',
      'distance_value': '35.56KM | 60 Mins',
      'without_toll_fee': 'Without toll fee',
      'bdt_fare': 'BDT 580.85',
      'confirm_pickup_location': 'Confirm Pickup Location',
      'finding_drivers_header': 'Finding drivers',
      'cancel_request_button': 'Cancel Request',
      'confirm_driver_header': 'Confirm driver',
      'arrival_time': 'Arrival time:',
      'min': 'min',
      'distance': 'Distance:',
      'arrival_cost': 'Arrival cost',
      'info_ambulance_distance':
          'This Ambulance is currently @distance km away. An Arrival Cost of @cost is included in your fare to cover that travel.',
      'taka_symbol': '৳',
      'confirmation_payment_required':
          'Confirmation payment is required to secure your booking.',
      'driver_on_standby':
          'Driver is on standby for your booking confirmation.',
      'cancellation_policy_terms': 'Cancellation Policy & Terms',
      'coupon_promo_code': 'Coupon/Promo Code',
      'enter_code': 'Enter code',
      'apply': 'Apply',
      'payable_now': 'Payable now',
      'coupon_applied_message': 'You saved ৳ @amount on your trip',
      'price_breakdown': 'Price breakdown',
      'price_breakdown_description':
          'Your fare will be the price presented before the trip or based on the rates below and other applicable surcharges and adjustments.',
      'base_fare': 'Base fare',
      'per_km_rate': '+ Per KM rate',
      'waiting_charges': '+ Waiting Charges',
      'booking_fee': 'Booking fee',
      'vat_tax': 'VAT & TAX',
      'close': 'Close',
      'bdt_currency': 'BDT',

      'select_payment_method': 'Select Payment Method',
      'pay_with_bkash': 'Pay with bKash',
      'pay_with_nagad': 'Get 10% discount',
      'pay_with_city_bank': 'Get 10% discount',
      'visa_master_card': 'Visa/Master Card',
      'add_another_vehicle': 'Add another vehicle to this trip',
      'trip_details': 'Trip details',
      'details': 'Details',
      'rate_of_driver': 'Rate of driver',
      'rebook_this_trip': 'Rebook this trip',
      'booking_payment': 'Booking Payment',
      'completion_payment': 'Completion Payment',
      'online_payment': 'Online Payment',
      'payment_methods_subtitle': 'bKash, Visa, Master Card, others',
      'cash_payment': 'Cash Payment',
      'cash_payment_subtitle': 'Pay with hand to hand',

      //lowest fare
      'freezing_van': 'Freezing van',
      'non_ac_ambulance': 'Non Ac Ambulance',
      'cng': 'CNG',
      'motorcycle': 'Motorcycle',
      'moto_saver': 'Moto Saver',

      //cancel request
      'confirm_cancel_title': 'Are you sure you want to cancel this trip?',
      'cancel_reason': 'Cancel Reason',
      'reason_ambulance_long': 'Ambulance taking too long',
      'reason_alternate_transport': 'Found alternate transport',
      'reason_wrong_location': 'Wrong location selected',
      'reason_booked_mistake': 'Booked by mistake',
      'reason_emergency_resolved': 'Emergency resolved',
      'reason_other': 'Other',
      'keep_searching': 'Keep Searching',
      'yes_cancel': 'Yes, Cancel',

      //chossing date time
      'choose_a_time': 'Choose a time',
      'choose_a_date': 'Choose a date',
      'choose_date_time': 'Choose date and time',
      'estimated_pickup': 'Estimated pickup date & time',
      'time_disclaimer':
          'Times are estimated based on predicted traffic. Actual traffic may impact your dropoff time. No cancel fee up to an hour before pickup or anytime before your driver is assigned. See Terms',

      'confirm_trip': 'Confirm trip',

      'round_info_title': 'Round Trip',
      'round_info_message':
          'Pickup Address → Drop-off Address → Pickup Address',

      'set_your_destionation': 'Set your destination',
      'drag_map_move': 'Drag map to move pin',
      'confirm_destionation': 'Confirm destination ',

      // Low Cost Intercity
      'low_cost_intercity': 'Low Cost Intercity',
      'search_hint': 'Low Cost Intercity',
      'discount': 'discount',
      'after': 'after',
      'hour': 'hour',
      'hours': 'hours',
      'loading': 'Loading...',

      // Intercity Details
      'change_add_address': 'Change/add address',
      'request_ride_tagline': 'Request a ride, hop-in, and go',
      'additional_service': 'Additional Service',
      'oxygen': 'Oxygen',
      'wheel_chair': 'Wheel Chair',
      'hand_stretcher': 'Hand Stretcher',
      'additional_staff_helper': 'Additional Staff-Helper',
      'booking_requirement': 'Booking requirement',
      'only_from_to_applicable': 'Only @from to @to address applicable',
      'driver_time': 'Driver time',
      'book_now': 'Book now',
      'wait_driver_confirm': 'Wait driver confirm',

      'help_center_title': 'Help Center / FAQs',
      'faq_heading': 'Current Frequently Asked Questions',
      'faq_search_hint': 'Search FAQs',
      'faq_cant_find': "Can't find what you're looking for?",
      'faq_contact_support': 'Contact Support',
      'refund_policy': 'Refund Policy',

      // Fields
      'current_password': 'Current Password',
      'enter_current_password': 'Enter current password',
      'new_password': 'New Password',
      'enter_new_password': 'Enter new password',
      'enter_password': 'Enter password',
      // Validation
      'required': 'This field is required',
      'pwd_mismatch': 'Passwords do not match',
      'pwd_min': 'Password must be at least 6 characters',
      // Success
      'update_success_desc': 'Your password has been updated successfully',
      'ok': 'OK',
      'delete_account': 'Delete Account',
      'delete_account_title': 'Delete account',
      'delete_account_desc':
          "Deleting your account is permanent. You’ll lose access to your ride history, saved data, and any active bookings.",
      'delete_account_question': 'Are you sure you want to continue?',
      'yes': 'Yes',
      'no': 'No',
      'why_leaving': 'Why are you leaving?',
      'reason_no_need': 'I no longer need ambulance services',
      'reason_issue_app': 'I faced an issue with the app',
      'reason_bad_experience': 'I had a bad experience',
      'reason_new_account': 'I want to create a new account',
      'security_confirmation': 'Security Confirmation',
      'phone_label': 'Phone',
      'email_label': 'Email',
      'enter_email': 'Enter email',
      'validation_phone': 'Enter a valid phone number',
      'validation_email': 'Enter a valid email address',
      'confirm_delete_title': 'Confirm Delete account',
      'warning_title': 'Warning: This action is irreversible.',
      'warning_intro': 'You will permanently lose:',
      'warning_b1': 'Trip records and receipts',
      'warning_b2': 'Emergency contact info',
      'warning_b3': 'Ongoing or future bookings',
      'warning_b4': 'Discounts or promo eligibility',
      'checklist_title': 'Checklist Before Deletion',
      'check_1': 'I have no ongoing trips',
      'check_2': 'I have settled all payments/refunds',
      'check_3': 'I understand this action is final',
      'delete_cta': 'Permanently Delete My Account',

      'notification_title': 'Notification',
      'notif_today': 'Today',
      'notif_earlier': 'Earlier',
      'notif_rate_title': 'Rate your trip',
      'notif_rate_sub':
          'Thanks for riding with Barry, Please give rating and feedback!',
      'notif_paypal_title':
          'Link Paypal Account and get 20% off on first 2 rides',
      'notif_coupon_title': 'G0948 coupon expired',
      'notif_update_photo_title': 'Please update your profile photo',
      'ago_min': '{x} min ago',
      'ago_day': '{x} day ago',
      'ago_week': '{x} week ago',
      'ago_month': '{x} month ago',

      'tk_search_booking': 'Search booking',
      'tk_upcoming': 'Upcoming',
      'tk_past': 'Past',
      'tk_cancelled': 'Cancelled',
      'tk_today': 'Today',
      'tk_tomorrow': 'Tomorrow',
      'tk_bdt': 'BDT',
      'tk_complete': 'Complete',
      'tk_cancel': 'Cancelled',
      'tk_scheduled': 'Scheduled',
      'tk_upcoming_badge': 'Upcoming',
      'tk_location': 'Gulshan 1, Dhaka, Bangladesh',
      'tk_destination': 'Urgent care clinic (101 Elm ST)',
      'tk_yesterday': 'Yesterday',

      "err_location_service_disabled": "Please enable Location Services",
      "err_location_permission_denied": "Permission denied",
      "err_location_permission_denied_forever": "Permission permanently denied",
      "err_location_unknown": "Unknown location error",

      //New Contact
      'phone_number': 'Phone Number',
      'enter_phone_number': 'Enter phone number',

      // saved address
      'add_new_address': 'Add new address',
      'home': 'Home',
      'office': 'Office',
      'hospital': 'Hospital',
      'address_name_title': 'Address name',
      'name_label': 'Name',
      'enter_name': 'Enter name',
      'please_enter_name': 'Please enter a name',
      'address_saved': 'Address saved',
      'hazrat_airport_title': 'Hazfrat Shahjalal International Airport',
      'hazrat_airport_sub': 'Airport – Dakshinkhan Rd, Dhaka',

      // trip track
      'driver_arriving': 'Driver is arriving',
      'meet_driver_hint': 'Meet your driver at the pickup spot',
      'ratings': 'ratings',
      'pickup_address': 'Pick-up address',
      'dropoff_address': 'Drop-off address',
      'due': 'Due',
      'change_destination': 'Change Destination',
      'cancel_trip': 'Cancel trip',
      'cancel_trip_title': 'Cancel this trip?',
      'cancel_trip_confirm': 'Are you sure you want to cancel?',
      'no_keep': 'No, keep',
      'driver_arrived': 'Driver is arrived',
      'reach_pickup_in_5min':
          'Reach the pick-up spot within 5 min to avoid waiting charges.',
      'ride_in_progress': 'Ride in Progress',
      'reach_destination_by': "You'll reach the destination by @time",
      'ride_complete': 'Ride in Complete',
      'reached_destination': "You've reached your destination",
      'amount_breakdown': 'Amount Breakdown',
      'client_will_pay': 'Client Will Pay',
      'confirm_payment': 'Confirm payment',
      'emergency_assistance': 'Emergency assistance',
      'emergency_assistance_desc':
          'Once you call for assistance, your location and vehicle details will be automatically shared.',
      'your_current_location': 'Your current location',
      'vehicle_details': 'Vehicle details',
      'share_my_trip': 'Share my trip',
      'call_999': 'Call 999',
      'change_destination_title': 'Change Destination',
      'change_destination_intro':
          'AmbuFast allows customers to change their drop-off location once during a live trip, '
          'or add additional stops (e.g., for hospital hopping), ensuring flexibility during critical medical situations.',
      'when_you_can_change': 'When You Can Change or Add Locations',
      'rule_after_trip_started_before_dest':
          'After the trip has started, but before reaching the original destination.',
      'rule_cannot_change_pickup':
          'You cannot change the pickup location once the trip has started.',
      'rule_change_drop_once':
          'You can change the drop-off only once per trip.',
      'rule_add_multiple_stops':
          'You can add multiple stops (up to 2 additional hospitals/locations), subject to driver and system approval.',
      'change_add_destination_once': 'Change/Add Destination (One-Time Only)',
      'step_open_live': 'Open Live Trip screen.',
      'step_tap_change': 'Tap “Change Destination”.',
      'step_enter_new_drop': 'Enter or select the new drop-off location.',
      'step_view_fare': 'View updated fare estimate.',
      'step_tap_confirm': 'Tap Confirm Change.',
      'cta_change_add_destination': 'Change/add Destination',
      'request_driver': 'Request to driver',
      'edit_trip': 'Edit Trip',
      'track_trip': 'Track trip',
      'report_issue': 'Report an issue',
      'rebook_trip': 'Rebook this trip',

      // --- Rating ---
      'rating.title': 'Rating',
      'rating.header.question': 'How was your trip with driver?',
      'rating.sub.rate': 'Rate your experience with the driver',
      'rating.sub.good_but_better': 'Good ride, but can be better',
      'rating.tags.cleanliness': 'Cleanliness',
      'rating.tags.navigation': 'Navigation',
      'rating.tags.price': 'Price',
      'rating.tags.service': 'Service',
      'rating.tags.route': 'Route',
      'rating.tags.driving': 'Driving',
      'rating.tags.others': 'Others',
      'rating.form.tell_more': 'Tell us more about the issue',
      'rating.form.hint': 'write your feedback',
      'common.done': 'Done',

      'rating.sub.1': 'Very bad experience',
      'rating.sub.2': 'Not great',
      'rating.sub.3': 'It was okay',
      'rating.sub.4': 'Good ride, but can be better',
      'rating.sub.5': 'Excellent ride!',

      'rating.tags.safeDriving': 'Safe driving',
      'rating.tags.politeHelpful': 'Polite & helpful',
      'rating.tags.cleanCar': 'Clean car',
      'rating.tags.onTimePickup': 'On-time pickup',
      'rating.tags.efficientRoute': 'Efficient route',
      'rating.tags.comfortableRide': 'Comfortable ride',

      'rating.tags.minorDelay': 'Minor delay',
      'rating.tags.slightDetour': 'Slight detour',
      'rating.tags.acCouldImprove': 'AC/comfort could improve',
      'rating.tags.priceBitHigh': 'Price a bit high',

      'rating.tags.latePickup': 'Late pickup',
      'rating.tags.longRoute': 'Long route',
      'rating.tags.unclearCommunication': 'Unclear communication',
      'rating.tags.uncomfortableRide': 'Uncomfortable ride',
      'rating.tags.priceHigh': 'Price high',

      'rating.tags.unsafeDriving': 'Unsafe driving',
      'rating.tags.rudeBehavior': 'Rude behavior',
      'rating.tags.dirtyCar': 'Dirty car',
      'rating.tags.wrongRoute': 'Wrong route',
      'rating.tags.overcharged': 'Overcharged/fare issue',
      'rating.tags.acNotWorking': 'AC not working',
      'rating.tags.refusedOrCancelled': 'Refused/cancelled trip',

      'trip.title': 'Trip details',
      'trip.section.distanceTime': 'Distance & Est. Time:',
      'trip.section.tripStatus': 'Trip status',
      'trip.section.advancePay': 'Advance Payment status',
      'trip.section.finalPay': 'Final Payment status',
      'trip.field.tripId': 'Trip id',
      'trip.field.contact': 'Contact',
      'trip.field.ambulance': 'Ambulance',
      'trip.field.type': 'Trip type',
      'trip.field.txnId': 'Transaction id',
      'trip.field.amount': 'Amount',
      'trip.field.method': 'Payment method',
      'trip.field.paidOn': 'Advance Paid On',
      'trip.actions.download': 'Download receipt',
      'trip.actions.go': 'Go this Trip',
      'trip.actions.start': 'Start Trip',
      'trip.actions.cancel': 'Cancel trip',
      'trip.badge.upcoming': 'Upcoming',
      'trip.badge.scheduled': 'Scheduled',
      'trip.badge.completed': 'Completed',
      'trip.badge.cancelled': 'Cancelled',
      'trip.badge.paid': 'Paid',
      'trip.badge.unpaid': 'Unpaid',
      'trip.rating.none': 'No Rating',
      'trip.rating.count.singular': 'rating',
      'trip.rating.count.plural': 'ratings',
      'trip.misc.forMe': 'For me',
      'trip.misc.single': 'Single trip',
      "trip.actions.reportIssue": "Report an Issue",
      "trip.field.rating": "Rating",

      // service
      'service_details_title': 'Service details',
      'ac_ambulance_title': 'AC Ambulance (BLS)',
      'ac_ambulance_desc':
          'Our Air-Conditioned Basic Life Support (BLS) Ambulance is equipped to provide safe and comfortable transport for patients requiring non-emergency medical care. It features essential medical equipment including oxygen support and basic first aid, ensuring reliable service for routine hospital visits, discharges, or transfers. Perfect for patients who need professional care in transit.',
      'additional_service_title': 'Additional Service',
      'doctor_service': 'Doctor',
      'oxygen_service': 'Oxygen',
      'hand_stretcher_service': 'Hand Stretcher',
      'helper_service': 'Additional Staff-Helper',
      'price_1200': '৳ 1200',
      'price_0': '৳ 0',
      'book_now_button': 'Book now',

      'dob_label': 'Date of birth:',

      'gender_label': 'Gender:',
      'blood_group_label': 'Blood Group:',

      'professional_info_title': 'Professional Information',
      'affiliation_type': 'Affiliation Type',
      'org_business_name': 'Organisation/Business Name',
      'your_role': 'Your Role',
      'zone_area': 'Zone / Area of Operation',
      'work_id': 'Work ID',
      'nid_front': 'Front Side of National Id Card',
      'nid_back': 'Back Side of National Id Card',
      'save': 'Save',
      'saving': 'Saving...',

      'enter_affiliation_title': 'Enter affiliation',
      'enter_affiliation_hint': 'Type your affiliation',
      'aff_hospital': 'Hospital',
      'aff_pharmacy': 'Pharmacy',
      'aff_ngo_clinic': 'NGO/Clinic',
      'aff_chv': 'Community Health Volunteer',
      'aff_other': 'Other (specify manually)',

      //Professional
      'edit_professional_info': 'Edit Professional Information',
      'professional_information': 'Professional Information',
      'affiliation_type_star': 'Affiliation Type*',
      'affiliation_details': 'Affiliation Details',
      'org_business_name_star': 'Organisation/Business Name*',
      'your_role_star': 'Your Role*',
      'zone_area_star': 'Zone / Area Of Operation*',
      'org_name_hint': 'Enter organisation name',
      'role_hint': 'Enter your role',
      'zone_hint': 'Enter zone/Area',
      'document_uploads': 'Document Uploads',
      'work_id_upload_title': 'Work ID Photo Upload',
      'work_id_upload_desc': 'Add your Work ID photo here, and you can upload…',
      'drag_or_browse':
          'Drag your file(s) or browse\nMax 10 MB files are allowed',
      'only_img_10mb': 'Only support .jpg, .png files',
      'nid_front_star': 'Front Side of National Id Card*',
      'nid_back_star': 'Back Side of National Id Card*',
      'nid_front_hint': 'Click to Upload Front Side of Card',
      'nid_front_maxnote': '(Max. File size: 25 MB)',
      'nid_back_hint': 'Click to Upload Back Side of Card',
      'nid_back_maxnote': '(Max. File size: 25 MB)',
      'uploaded_success': 'Uploaded successfully',

      'confirm_change_title':
          'Are you sure you want to Changing Your Professional Information?',
      'important_notes': 'Important Notes:',
      'note_1':
          'Your profile will be temporarily under review after this change.',
      'note_3':
          'Submitting false or misleading information may lead to account suspension.',
      'submit_for_review': 'Submit for Review',
      'go_back': 'Go Back',
      'confirm_change_intro':
          'You are about to update your Work ID and National ID. Please ensure that:',
      'confirm_point_1': 'The documents belong to you and are valid.',
      'confirm_point_2':
          'All details (ID number, name, etc.) are correct and clearly readable.',
      'confirm_point_3':
          'Upload a clear photo/scan — National ID (front & back) and Work ID.',
      'note_2':
          'You may not receive trip requests until your new documents are approved.',

      'under_review_title': 'Your documents are under review',
      'under_review_desc':
          'We’re reviewing your submitted Work ID and National ID. This usually takes a short while. You can’t edit details until the review is complete.',
      'docs_not_approved_title': 'Your documents are not approved',
      'docs_not_approved_desc':
          "Your submitted details are invalid or couldn't be approved. Please resubmit valid Work ID and National ID.",
    },

    // ======================= BANGLA =======================
    'bn_BD': {
      // ----- Common -----
      'back': 'পিছনে',
      'powered':
          'Powered By SafeCare24/7 Medical Services Limited\nBeta Version 1.0',
      'choose': 'নির্বাচন করুন',
      'done': 'সম্পন্ন',
      'select': 'নির্বাচন করুন',

      // ----- Welcome -----
      'welcome_title': 'AmbuFast-এ স্বাগতম',
      'welcome_subtitle':
          'বাংলাদেশের বৃহত্তম অ্যাম্বুলেন্স নেটওয়ার্ক এবং রাইড শেয়ারিং প্ল্যাটফর্ম',
      'login': 'লগইন',
      'create_account': 'অ্যাকাউন্ট তৈরি করুন',

      // ----- Language -----
      'language_english': 'ইংরেজি',
      'language_bangla': 'বাংলা',
      'continue_btn': 'চালিয়ে যান',

      // ----- Login -----
      'login_title': 'AmbuFast এ স্বাগতম',
      'login_subtitle': 'আপনার জরুরি রাইড শেয়ারিং অংশীদার',
      'tab_phone': 'ফোন নম্বর',
      'tab_email': 'ইমেইল ঠিকানা',
      'label_phone': 'ফোন',
      'label_email': 'ইমেইল',
      'label_password': 'পাসওয়ার্ড',
      'hint_phone': 'ফোন নম্বর প্রবেশ করুন',
      'hint_email': 'ইমেইল ঠিকানা প্রবেশ করুন',
      'hint_password': 'পাসওয়ার্ড প্রবেশ করুন',
      'recover_password': 'পাসওয়ার্ড পুনরুদ্ধার করুন',
      'login_btn': 'লগইন',
      'no_account': 'অ্যাকাউন্ট নেই?',
      'create': 'তৈরি করুন',
      'country_code_bd': '+৮৮০',

      // ----- Recover Password -----
      'recover_title': 'পাসওয়ার্ড পুনরুদ্ধার করুন',
      'recover_subtitle_phone':
          'পাসওয়ার্ড পুনরায় সেট করতে এগিয়ে যেতে নিবন্ধনের সময় আপনি যে ফোন নম্বরটি ব্যবহার করেছিলেন সেটি প্রবেশ করুন।',
      'recover_subtitle_email':
          'পাসওয়ার্ড পুনরায় সেট করতে এগিয়ে যেতে নিবন্ধনের সময় আপনি যে ইমেইল ঠিকানাটি ব্যবহার করেছিলেন সেটি প্রবেশ করুন।',
      'send_otp': 'OTP পাঠান',
      'have_account_q': 'আপনার একটি অ্যাকাউন্ট আছে?',

      // ----- Verify OTP -----
      'verify_title': 'আপনার অ্যাকাউন্ট যাচাই করুন',
      'verify_subtitle_phone':
          'আমরা আপনার ফোন নম্বরে একটি এককালীন পাসওয়ার্ড (OTP) পাঠিয়েছি। যাচাইকরণ সম্পূর্ণ করতে নিচের কোডটি প্রবেশ করুন।',
      'verify_subtitle_email':
          'আমরা আপনার ইমেইল ঠিকানায় একটি এককালীন পাসওয়ার্ড (OTP) পাঠিয়েছি। যাচাইকরণ সম্পূর্ণ করতে নিচের কোডটি প্রবেশ করুন।',
      'resend_otp': 'পুনরায় OTP পাঠান',
      'change_phone': 'ফোন নম্বর পরিবর্তন করুন',
      'change_email': 'ইমেইল পরিবর্তন করুন',
      'verify_btn': 'যাচাই করুন',
      'timer_mm_ss': '%s:%s',

      // ----- Create Account -----
      'create_account_title': 'আপনার AmbuFast অ্যাকাউন্ট তৈরি করুন',
      'full_name': 'পূর্ণ নাম*',
      'hint_full_name': 'পূর্ণ নাম প্রবেশ করুন',
      'dob': 'জন্ম তারিখ*',
      'gender_q': 'আপনার লিঙ্গ কী?*',
      'male': 'পুরুষ',
      'female': 'মহিলা',
      'others': 'অন্যান্য',
      'blood_group': 'রক্তের গ্রুপ*',
      'blood_group_p': 'রক্তের গ্রুপ',
      'password': 'পাসওয়ার্ড',
      'confirm_password': 'পাসওয়ার্ড নিশ্চিত করুন',
      'hint_confirm_password': 'পাসওয়ার্ড নিশ্চিত করে প্রবেশ করুন',
      'next': 'পরবর্তী',
      'req_field': 'এই ঘরটি বাধ্যতামূলক',
      'min_6_chars': 'কমপক্ষে ৬ অক্ষর',
      'password_mismatch': 'পাসওয়ার্ড মেলেনি',
      'invalid_title': 'ফর্ম সঠিক নয়',
      'invalid_msg': 'দয়া করে সব প্রয়োজনীয় ঘর সঠিকভাবে পূরণ করুন।',
      'terms_pre_a': 'চালিয়ে যাওয়ার মাধ্যমে আমি ',
      'terms_pre_b': 'শর্তাবলী এবং শর্তাবলীর সাথে একমত',
      'agree_continue': 'একমত এবং চালিয়ে যান',

      // ----- Profile creating -----
      'profile_creating': 'আপনার প্রোফাইল তৈরি হচ্ছে...',
      'profile_customising': 'আপনার সুপারিশগুলি কাস্টমাইজ করা হচ্ছে...',

      // ========== HOME (নতুন) ==========
      'app_name': 'AmbuFast',
      'home_where_to': 'কোথায় যাবেন?',
      'home_go_later': 'পরে যাব',
      'home_view_all': 'সবগুলো দেখুন',

      'home_emergency': 'জরুরি অবস্থা',
      'home_emergency_ac_ambulance': 'এসি অ্যাম্বুলেন্স',
      'home_emergency_non_ac_ambulance': 'নন এসি অ্যাম্বুলেন্স',
      'home_emergency_icu_ambulance': 'আইসিইউ/সিসিইউ অ্যাম্বুলেন্স',
      'home_emergency_freezing_van': 'ফ্রিজিং ভ্যান',

      'home_non_emergency': 'নন-জরুরি',
      'home_non_emergency_motorcycle': 'মোটরসাইকেল',
      'home_non_emergency_cng': 'সিএনজি',
      'home_non_emergency_micro': 'মাইক্রো',

      'home_upcoming_trips': 'আসন্ন ভ্রমণ',
      'home_upcoming': 'আসছে',

      'home_offer_title': '৩০% সেভিংস',
      'home_offer_sub': 'প্রেগন্যান্সি প্রি-বুকিং এ',
      'home_offer_code': 'কোড  PREAB01',

      'home_low_cost_intracity': 'কম খরচে ইনট্রাসিটি',
      'home_campaign': 'ক্যাম্পেইন',
      'home_campaign_heart_attack': 'হার্ট অ্যাটাক',
      'home_campaign_dialysis': 'ডায়ালাইসিস',
      'home_campaign_disabled': 'প্রতিবন্ধী রোগী',

      'home_last_ride_title': 'সম্মানের সাথে শেষ যাত্রা',
      'home_last_ride_body':
          'আপনার দান সেইসব মানুষের মর্যাদাপূর্ণ শেষ যাত্রা নিশ্চিত করে যারা ফিউনারেল ট্রান্সপোর্টে সক্ষম নন।',
      'home_support_now': 'এখনই সহায়তা করুন',

      'home_funeral_support_title': 'সম্মানের সাথে শেষ যাত্রা',
      'home_funeral_support_body':
          'আপনার পরিবার যদি ফিউনারেল ট্রান্সপোর্ট ব্যয়ে সমস্যায় থাকে, সম্মানজনক বিদায় নিশ্চিত করতে আমাদের ডোনেশন-ভিত্তিক সার্ভিসে আবেদন করুন।',
      'home_request_support': 'সাপোর্ট রিকোয়েস্ট',

      //.........enable_location............
      'loc_enable_title': 'আপনার অবস্থান সক্ষম করুন',
      'loc_enable_subtitle':
          'আপনার আশেপাশে অনুরোধটি খুঁজে পেতে আপনার অবস্থান নির্বাচন করুন',
      'loc_use_my_location': 'আমার অবস্থান ব্যবহার করুন',
      'loc_skip': 'আপাতত এড়িয়ে যান',

      // --- Support screen (choose) ---
      'support': 'সহায়তা',
      'choose_cause': 'একটি কারণ বেছে নিন',
      'choose_amount': 'পরিমাণ বেছে নিন',
      'others_amount': 'অন্যান্য পরিমাণ',
      'enter_amount': 'পরিমাণ লিখুন',
      'cant_find': 'আপনি যা খুঁজছেন তা খুঁজে পাচ্ছেন না?',
      'contact_support': 'সাপোর্ট সাথে যোগাযোগ করুন',
      'review': 'পর্যালোচনা',
      'validation_title': 'যাচাই',
      'validation_support_msg':
          'অনুগ্রহ করে একটি কারণ নির্বাচন করুন, পরিমাণ দিন এবং শর্তাবলীতে সম্মতি দিন।',

      // Cause labels
      'cause_general_fund': 'সাধারণ তহবিল',
      'cause_ambulance_trip_help': 'অ্যাম্বুলেন্স ট্রিপ সহায়তা',
      'cause_emergency_medical_help': 'জরুরি চিকিৎসা সহায়তা',
      'cause_dead_body_transfer': 'মৃতদেহ স্থানান্তর',

      // --- Support Review / Payment Method ---
      'support_review': 'সহায়তার পর্যালোচনা',
      'cause': 'কারণ',
      'amount': 'পরিমাণ',
      'edit_below': 'আপনি নীচে সম্পাদনা করতে পারবেন',
      'change': 'পরিবর্তন',
      'choose_payment': 'পেমেন্ট পদ্ধতি বেছে নিন',
      'pay_now': 'এখনই পেমেন্ট করুন',

      // Payment methods (titles)
      'bkash': 'বিকাশ',
      'nagad': 'নগদ',
      'city_bank': 'সিটি ব্যাংক',
      'visa_master': 'ভিসা/মাস্টার কার্ড',
      'pay_station': 'পে',

      // Payment method subtitles
      'pay_bkash': 'বিকাশ দিয়ে পেমেন্ট করুন',
      'discount_10': '১০% ছাড় পান',

      // Payment validation / messages
      'validation_payment_msg': 'একটি পেমেন্ট পদ্ধতি নির্বাচন করুন।',
      'selected_method': 'নির্বাচিত পদ্ধতি: @method',

      'payment': 'পেমেন্ট',
      'invoice_number': 'ইনভয়েস নম্বর',
      'bdt': 'বিডিটি',
      'your_bkash_number': 'আপনার বিকাশ একাউন্ট নাম্বার',
      'bkash_placeholder': 'যেমন 01XXXXXXXXX',
      'confirm_process_prefix': 'কনফার্ম ও প্রসেস, ',
      'terms_and_conditions': 'টার্মস অ্যান্ড কন্ডিশনস',
      'cancel': 'বাতিল',
      'confirm': 'কনফার্ম',

      'payment_success_title':
          'পেমেন্ট সফল!\nআপনার গাড়ির বুকিং নিশ্চিত হয়েছে।',
      'payment_success_body':
          'আমরা আপনার বুকিং পেমেন্ট (৳@amount) পেয়েছি। আপনার গাড়ি সময়মতো আপনার পিকআপ লোকেশনের পথে রয়েছে।',
      'go_to_my_activity': 'আমার কার্যকলাপে যান',
      'back_to_home': 'বাড়ি ফিরে যাও',

      // === BN ===
      'request_support_title': 'সহায়তার জন্য অনুরোধ',
      'request_support_step': 'ধাপ ১ এর মধ্যে ২',
      'start_a_request': 'একটি অনুরোধ শুরু করুন',
      'start_a_request_hint':
          'আপনি কী সহায়তা চান জানিয়ে দিন। দ্রুত অনুমোদনের জন্য বিল বা প্রেসক্রিপশন আপলোড করতে পারেন।',

      'request_cause': 'অনুরোধের কারণ*',
      'amount_needed': 'প্রয়োজনীয় পরিমাণ*',
      'urgency': 'জরুরিতা*',
      'describe_situation': 'আপনার পরিস্থিতি বর্ণনা করুন*',
      'hint_enter_amount': 'পরিমাণ লিখুন',
      'hint_select_cause': 'কারণ নির্বাচন করুন',
      'hint_select_urgency': 'জরুরিতা নির্বাচন করুন',
      'hint_write_situation': 'আপনার পরিস্থিতি লিখুন',

      'doc_upload_title': 'ডকুমেন্ট আপলোড (ঐচ্ছিক)',
      'doc_upload_sub': 'বিল বা প্রেসক্রিপশন যোগ করুন',
      'doc_upload_drop': 'ফাইল টানুন (ড্র্যাগ) অথবা ব্রাউজ করুন',
      'doc_upload_max': 'সর্বোচ্চ ১০ এমবি ফাইল অনুমোদিত',
      'doc_upload_types': 'শুধু .jpg, .png ফাইল সমর্থন করে',

      'nid_front_title': 'জাতীয় পরিচয়পত্র সামনের দিক*',
      'nid_back_title': 'জাতীয় পরিচয়পত্র পিছনের দিক*',
      'click_to_upload_front': 'কার্ডের সামনের দিকটি আপলোড করতে ক্লিক করুন',
      'click_to_upload_back': 'কার্ডের পিছনের দিকটি আপলোড করতে ক্লিক করুন',
      'max_file_size_25': '(সর্বোচ্চ ফাইল সাইজ: ২৫ এমবি)',

      'agree_verification':
          'জমা দেওয়ার মাধ্যমে, আপনি আমাদের যাচাইকরণ প্রক্রিয়া এবং শর্তাবলীতে সম্মতি দিচ্ছেন।',
      'continue': 'চালিয়ে যান',

      // validation
      'vs_select_cause': 'অনুগ্রহ করে একটি কারণ নির্বাচন করুন।',
      'vs_amount': 'অনুগ্রহ করে সঠিক পরিমাণ লিখুন।',
      'vs_urgency': 'অনুগ্রহ করে জরুরিতা নির্বাচন করুন।',
      'vs_desc': 'অনুগ্রহ করে আপনার পরিস্থিতি লিখুন।',
      'vs_nid_front': 'অনুগ্রহ করে এনআইডি সামনের দিক আপলোড করুন।',
      'vs_nid_back': 'অনুগ্রহ করে এনআইডি পিছনের দিক আপলোড করুন।',
      'vs_terms': 'চালিয়ে যেতে শর্তাবলীতে সম্মতি দিন।',
      'file_too_large': 'ফাইল অনুমোদিত সাইজের বেশি।',
      'file_type_invalid': 'শুধুমাত্র JPG/PNG অনুমোদিত।',

      // ===== BN =====
      'request_review_title': 'পর্যালোচনার অনুরোধ',
      'confirm_request': 'আপনার অনুরোধ নিশ্চিত করুন',
      'confirm_request_hint':
          'জমা দেওয়ার আগে বিশদ বিবরণ দু’বার পরীক্ষা করুন। আপনি যেকোনো সময় নীচের আইটেমগুলি সম্পাদনা করতে পারবেন।',
      'step_2_of_2': 'ধাপ ২ এর মধ্যে ২',

      'rr_cause': 'কারণ',
      'rr_amount_needed': 'প্রয়োজনীয় পরিমাণ',
      'rr_urgency': 'জরুরি অবস্থা',
      'rr_describe': 'তোমার পরিস্থিতি বর্ণনা করো',

      'rr_you_can_edit_below': 'আপনি নীচে সম্পাদনা করতে পারেন',
      'rr_change': 'পরিবর্তন',
      'rr_submit_for_review': 'পর্যালোচনার জন্য জমা দিন',

      'rr_doc_clinic_bill': 'ক্লিনিক বিল',
      'rr_doc_front_id': 'ফ্রন্ট আইডি',
      'rr_doc_back_id': 'ব্যাক আইডি',
      'rr_within_24h': '২৪ ঘন্টার মধ্যে',

      // ===== BN =====
      'rs_success_title': 'তুমি সম্পূর্ণ প্রস্তুত।',
      'rs_success_body':
          'আপনার অনুরোধটি পর্যালোচনার জন্য জমা দেওয়া হয়েছে।\nএটি অনুমোদিত হওয়ার সাথে সাথে আমরা আপনাকে জানাবো।',
      'rs_estimated_label': 'আনুমানিক: ৬ ঘণ্টার কম',
      'rs_go_to_activity': 'আমার কার্যকলাপে যান',
      'rs_back_home': 'হোম পেজে যাও',

      // ----- Request Ride -----
      'request_ride_title': 'যাত্রার অনুরোধ করুন',
      'pickup_now': 'এখনই',
      'for_me': 'আমার জন্য',
      'ac_ambulance': 'এসি অ্যাম্বুলেন্স',
      'pickup_address_hint': 'পিকআপ ঠিকানা',
      'dropoff_address_hint': 'ড্রপ-অফ ঠিকানা',
      'need_round_trip': 'আমার আবার যাওয়ার দরকার।', // note the "।"
      'set_location_on_map': 'মানচিত্রে অবস্থান সেট করুন',
      'saved_address': 'সংরক্ষিত ঠিকানা',
      'popular_places': 'জনপ্রিয় স্থান',

      // ----- Request Ride (places) -----
      'place_airport_title': 'হযরত শাহজালাল আন্তর্জাতিক বিমানবন্দর',
      'place_airport_sub': 'বিমানবন্দর – দক্ষিণখান সড়ক, ঢাকা',

      'place_jfp_title': 'যমুনা ফিউচার পার্ক',
      'place_jfp_sub': 'KA-244, কুরিল, প্রগতি সরণি, ঢাকা',

      'place_bcity_title': 'বসুন্ধরা সিটি শপিং কমপ্লেক্স',
      'place_bcity_sub': '৩ নং তেজতুরী বাজার পশ্চিম, পল্লব পথ, ঢাকা',

      // ----- Bottom sheets (When / Contact / Service) -----
      'when_sheet_title': 'কখন আপনার যাত্রার প্রয়োজন?',
      'when_now_title': 'এখন',
      'when_now_sub': 'যাত্রার অনুরোধ করুন, লাফিয়ে উঠুন এবং যান',
      'when_later_title': 'পরে',
      'when_later_sub': 'অতিরিক্ত মানসিক প্রশান্তির জন্য রিজার্ভ করুন',

      'contact_sheet_title': 'পরিচিতি পরিবর্তন করুন',
      'contact_me_title': 'আমি',
      'contact_add_title': 'নতুন পরিচিতি যোগ করুন',

      'service_sheet_title': 'পরিসেবা পরিবর্তন করুন',
      'service_non_ac': 'নন এসি অ্যাম্বুলেন্স',
      'service_ac': 'এসি অ্যাম্বুলেন্স',
      'service_icu': 'আইসিইউ/সিসিইউ অ্যাম্বুলেন্স',
      'service_freezing': 'ফ্রিজিং ভ্যান',
      'service_row_sub': 'যাত্রার অনুরোধ করুন, লাফিয়ে উঠুন এবং যান',

      // ----- Booking Info Modal -----
      'book_info_title': 'বুকিং তথ্য',
      'relationship_with_patient': 'রোগীর সাথে সম্পর্ক',
      'how_did_you_hear_about_us': 'আপনি আমাদের সম্পর্কে কিভাবে জানলেন?',
      'patient_phone_address': 'রোগীর ফোন ও ঠিকানা',
      'enter_patient_phone_address': 'রোগীর ফোন নম্বর এবং ঠিকানা লিখুন',
      'describe_patient_condition': 'রোগীর অবস্থা সম্পর্কে বিস্তারিত বলুন',
      'skip': 'এড়িয়ে যান',

      'signup_subtitle': 'সেকেন্ডের মধ্যে সাইন আপ করুন বা জরুরি সেবা বুক করুন।',

      'account': 'প্রোফাইল',
      'good_morning': 'শুভ সকাল,',
      'rating': '৫.০',

      // Sections
      'profile_summary': 'প্রোফাইলের সারাংশ',
      'settings_prefs': 'সেটিংস এবং পছন্দসমূহ',
      'security_privacy': 'নিরাপত্তা ও গোপনীয়তা',
      'support_legal': 'সহায়তা এবং আইনি',

      // Items
      'profile': 'প্রোফাইল',
      'reviews': 'রিভিউ',
      'my_booking': 'আমার বুকিং',
      'my_donation_request': 'আমার দানসমূহ এবং অনুরোধ',
      'save_address': 'সরবরাহ ঠিকানা',
      'language': 'ভাষা',
      'notification': 'বিজ্ঞপ্তি',
      'change_password': 'পাসওয়ার্ড পরিবর্তন করুন',
      'tap_emergency_sos': 'জরুরি SOS-এ ট্যাপ করুন',
      'help_center_faqs': 'সহায়তা কেন্দ্র / প্রায়শ জিজ্ঞাস্য',

      'cancellation_policy': 'বাতিলকরণ নীতি',
      'terms_conditions': 'শর্তাবলী',
      'privacy_policy': 'গোপনীয়তা নীতি',
      'logout': 'লগআউট',
      'english_us': 'Bangla',

      'profile_details': 'প্রোফাইলের বিস্তারিত',
      'edit_profile_details': 'প্রোফাইলের তথ্য সম্পাদনা',
      'basic_information': 'বেসিক তথ্য',
      'contact_information': 'যোগাযোগের তথ্য',
      'member_since': 'সদস্য হয়েছেন',

      // Actions
      'edit': 'এডিট',
      'update': 'আপডেট',
      'upload_profile_photo': 'প্রোফাইল ছবি আপলোড করুন',

      // Fields
      'date_of_birth': 'জন্ম তারিখ',
      'gender': 'লিঙ্গ',
      'phone': 'ফোন',
      'email_address': 'ইমেইল ঠিকানা',
      'street_address': 'রাস্তার ঠিকানা',
      'apartment_suite_unit_optional': 'অ্যাপার্টমেন্ট, সুইট, ইউনিট (ঐচ্ছিক)',
      'city': 'শহর',
      'state': 'স্টেট',
      'zip_code': 'জিপ কোড',
      'country': 'দেশ',

      // Common options
      'other': 'অন্যান্য',

      // Logout confirm
      'are_you_sure': 'আপনি কি নিশ্চিত?',
      'logout_confirm_message':
          'আপনি কি লগ আউট করতে চান? আপনি গুরুত্বপূর্ণ ট্রিপ মিস করতে পারেন।',
      'yes_logout': 'হ্যাঁ, লগ আউট',

      // validation / feedback
      'required_field': 'ঘরটি আবশ্যক',
      'success': 'সফল',
      'profile_updated_successfully': 'প্রোফাইল সফলভাবে আপডেট হয়েছে',

      'select_blood_group': 'রক্তের গ্রুপ নির্বাচন করুন',
      'select_gender': 'লিঙ্গ নির্বাচন করুন',
      'select_state': 'রাজ্য নির্বাচন করুন', // or 'অবস্থান নির্বাচন করুন'
      'select_country': 'দেশ নির্বাচন করুন',

      'all_review': 'সবকটি রিভিউ',

      'good_ride_title': 'ভালো যাত্রা, কিন্তু আরও দারুণ হতে পারে!',
      'great_ride_title': 'দারুণ যাত্রা',
      'bad_ride_title': 'খারাপ যাত্রা',
      'review_body_sample':
          'আমার মনে হয় এর বাইরের এবং ভেতরের দিকটি এর শ্রেণির অন্য অ্যাম্বুলেন্সের তুলনায় অনেক সুন্দর।',

      'language_title': 'ভাষা',
      'language_updated': 'ভাষা পরিবর্তন করা হয়েছে',

      // Keep list labels as in your screenshot (mostly English names)
      'english_uk': 'English (UK)',
      'mandarin': 'Mandarin',
      'spanish': 'Spanish',
      'french': 'French',
      'arabic': 'Arabic',
      'bengali': 'Bangla',
      'russian': 'Russian',
      'japanese': 'Japanese',
      'korean': 'Korean',
      'indonesian': 'Indonesia',
      'indian': 'Indian',
      'germany': 'Germany',
      'chainish': 'Chainish',

      'emergency_sos_title': 'জরুরি SOS-এ ট্যাপ করুন',
      'error': 'ত্রুটি',
      'call_failed': 'ডায়লার খোলা যায়নি',

      'my_donation_request_title': 'আমার সমর্থন এবং অনুরোধ',
      'support_tab': 'সমর্থন',
      'request_tab': 'অনুরোধ',
      'search_by_date': 'তারিখ অনুযায়ী অনুসন্ধান করুন',
      'total_support': 'টোটাল সমর্থন',
      'receipt': 'রসিদ',
      'pending': 'পেন্ডিং',
      'approved': 'অনুমোদিত',
      'rejected': 'বাতিল',
      'ambulance_fare': 'অ্যাম্বুলেন্স ভাড়া',

      // ===== bn_BD additions =====
      'enter_full_name': 'পূর্ণ নাম লিখুন',
      'yyyy-mm-dd': 'YYYY-MM-DD',
      'dd-mm-yyyy': 'DD-MM-YYYY',
      'enter_phone': 'ফোন নম্বর লিখুন',

      'enter_street_address': 'রাস্তার ঠিকানা লিখুন',
      'apt_suite_unit': 'অ্যাপার্টমেন্ট, সুইট, ইউনিট',
      'enter_city': 'শহরের নাম লিখুন',
      'enter_zip_code': 'জিপ কোড লিখুন',
      // ===== bn_BD =====
      'update_success_title': 'আপডেট সফলভাবে হয়েছে',
      'update_success_body': 'আপনার প্রোফাইল সফলভাবে আপডেট করা হয়েছে',

      // Request Ride Booking
      'booking_details': 'বুকিং এর বিস্তারিত তথ্য',
      'date_time': 'তারিখ ও সময়:',
      'contact': 'যোগাযোগ:',
      'vehicle': 'যানবাহন:',
      'trip_type': 'ভ্রমণের ধরণ:',
      'single_trip': 'একক ট্রিপ',
      'category': 'বিভাগ:',
      'emergency': 'জরুরী অবস্থা',
      'from': 'থেকে',
      'to': 'স্থান',
      'jhiga_address': 'জিগাতলা রোড, ঢাকা, বাংলাদেশ',
      'square_address': 'স্কয়ার হাসপাতাল, পান্থপথ, ঢাকা ১২০৫, বাংলাদেশ',
      'distance_est_time': 'দূরত্ব এবং আনুমানিক সময়:',
      'minutes': 'মিনিট',
      'lowest_fare': 'সর্বনিম্ন ভাড়া',
      'total': 'মোট',
      'without_toll': 'টোল ফি ছাড়াই',
      'cash': 'নগদ',
      'request_send': 'অনুরোধ পাঠান',
      'distance_value': '৩৫.৫৬ কিমি | ৬০ মিনিট',
      'without_toll_fee': 'টোল ফি ছাড়া',
      'bdt_fare': '৫৮০.৮৫ টাকা',
      'confirm_pickup_location': 'পিকআপ লোকেশন নিশ্চিত করুন',
      'finding_drivers_header': 'ড্রাইভার খোঁজা',
      'cancel_request_button': 'অনুরোধ বাতিল করুন',

      'confirm_driver_header': 'ড্রাইভার নিশ্চিত করুন',
      'arrival_time': 'আগমনের সময়:',
      'min': 'মিনিট',
      'distance': 'দূরত্ব:',
      'arrival_cost': 'আগমনের খরচ',
      'info_ambulance_distance':
          'এই গাড়ীটি বর্তমানে @distance কিমি দূরে। আপনার ভ্রমণের ভাড়ার সাথে @cost টাকা আগমন খরচ অন্তর্ভুক্ত।',
      'taka_symbol': 'টাকা',

      'confirmation_payment_required':
          'আপনার বুকিং নিশ্চিত করার জন্য নির্দিষ্টকরণ পেমেন্ট প্রয়োজন।',
      'driver_on_standby':
          'সফলভাবে পেমেন্ট নিশ্চিত করার পরেই বুকিং নিশ্চিত করা হবে।',
      'cancellation_policy_terms': 'বাতিলকরণ নীতি এবং শর্তাবলী',
      'coupon_promo_code': 'কুপন/প্রোমো কোড',
      'enter_code': 'কোড লিখুন',
      'apply': 'প্রয়োগ করুন',
      'payable_now': 'এখনই পরিশোধযোগ্য',
      'coupon_applied_message': 'আপনার ভ্রমণে ৳ @amount সাশ্রয় হয়েছে',

      'price_breakdown': 'দামের বিশদ বিবরণ',
      'price_breakdown_description':
          'আপনার ভাড়া হবে ভ্রমণের আগে উপস্থাপিত মূল্য অথবা নীচের হার এবং অন্যান্য প্রযোজ্য সারচার্জ এবং সমন্বয়ের উপর ভিত্তি করে।',
      'base_fare': 'মূল ভাড়া',
      'per_km_rate': '+ প্রতি কিলোমিটার ভাড়া',
      'waiting_charges': '+ অপেক্ষার চার্জ',
      'booking_fee': 'বুকিং ফি',
      'vat_tax': 'ভ্যাট এবং ট্যাক্স',
      'close': 'বন্ধ করুন',
      'taka_currency': 'টাকা',
      'select_payment_method': 'পেমেন্ট পদ্ধতি নির্বাচন করুন',
      'pay_with_bkash': 'বিকাশ দিয়ে পেমেন্ট করুন',
      'pay_with_nagad': '১০% ছাড় পান',
      'pay_with_city_bank': '১০% ছাড় পান',
      'visa_master_card': 'ভিসা/মাস্টার কার্ড',
      'add_another_vehicle': 'Add another vehicle to this trip',
      'trip_details': 'Trip details',
      'details': 'Details',
      'rate_of_driver': 'Rate of driver',
      'rebook_this_trip': 'Rebook this trip',
      'booking_payment': 'বুকিং পেমেন্ট',
      'completion_payment': 'সমাপ্তির অর্থ প্রদান',
      'online_payment': 'অনলাইন পেমেন্ট',
      'payment_methods_subtitle': 'বিকাশ, ভিসা, মাস্টার কার্ড, অন্যান্য',
      'cash_payment': 'নগদ অর্থ প্রদান',
      'cash_payment_subtitle': 'হাতে হাতে টাকা দিন',

      //lowest fare
      'freezing_van': 'ফ্রিজিং ভ্যান',
      'non_ac_ambulance': 'নন এসি অ্যাম্বুলেন্স',
      'cng': 'সিএনজি',
      'motorcycle': 'মোটরসাইকেল',
      'moto_saver': 'মোটো সেভার',

      //cancel request
      'confirm_cancel_title':
          'আপনি কি নিশ্চিত যে আপনি এই ট্রিপ বাতিল করতে চান?',
      'cancel_reason': 'বাতিল করার কারণ',
      'reason_ambulance_long': 'অ্যাম্বুলেন্সে অনেক বেশি সময় লাগছে',
      'reason_alternate_transport': 'বিকল্প পরিবহন পাওয়া গেছে',
      'reason_wrong_location': 'ভুল অবস্থান নির্বাচন করা হয়েছে',
      'reason_booked_mistake': 'ভুল করে বুক করা হয়েছে',
      'reason_emergency_resolved': 'জরুরী অবস্থার সমাধান হয়েছে',
      'reason_other': 'অন্যান্য',
      'keep_searching': 'খুঁজতে থাকুন',
      'yes_cancel': 'হ্যাঁ, বাতিল করুন',

      // choosing date time
      'choose_a_time': 'একটি সময় বেছে নিন',
      'choose_a_date': 'একটি তারিখ বেছে নিন',
      'choose_date_time': 'তারিখ এবং সময় বেছে নিন',
      'estimated_pickup': 'আনুমানিক পিকআপের তারিখ এবং সময়',
      'time_disclaimer':
          'পূর্বাভাসিত ট্র্যাফিকের উপর ভিত্তি করে সময় অনুমান করা হয়। প্রকৃত ট্র্যাফিক আপনার ড্রপঅফের সময়কে প্রভাবিত করতে পারে। পিকআপের এক ঘন্টা আগে বা আপনার ড্রাইভারকে নির্ধারিত করার আগে যেকোনো সময় কোনও বাতিল ফি নেই। শর্তাবলী দেখুন।',
      'confirm_trip': 'ট্রিপ নিশ্চিত করুন',

      'round_info_title': 'রাউন্ড ট্রিপ',
      'round_info_message': 'পিকআপ ঠিকানা → ড্রপ-অফ ঠিকানা → পিকআপ ঠিকানা',

      'set_your_destionation': 'আপনার গন্তব্য নির্ধারণ করুন',
      'drag_map_move': 'পিন সরাতে ম্যাপ টেনে আনুন',
      'confirm_destionation': 'নিশ্চিত গন্তব্য করুন ',

      // Low Cost Intercity
      'low_cost_intercity': 'কম খরচে আন্তঃনগর',
      'search_hint': 'কম খরচে আন্তঃনগর',
      'discount': 'ছাড়',
      'after': 'পরে',
      'hour': 'ঘণ্টা',
      'hours': 'ঘণ্টা',
      'loading': 'লোড হচ্ছে...',

      // Intercity Details
      'change_add_address': 'ঠিকানা পরিবর্তন/যোগ করুন',
      'request_ride_tagline': 'রাইড অনুরোধ করুন, উঠুন এবং যান',
      'additional_service': 'অতিরিক্ত পরিষেবা',
      'oxygen': 'অক্সিজেন',
      'wheel_chair': 'হুইল চেয়ার',
      'hand_stretcher': 'হ্যান্ড স্ট্রেচার',
      'additional_staff_helper': 'অতিরিক্ত কর্মী-সহায়ক',
      'booking_requirement': 'বুকিং এর প্রয়োজনীয়তা',
      'only_from_to_applicable': 'শুধুমাত্র @from থেকে @to ঠিকানায় প্রযোজ্য',
      'driver_time': 'ড্রাইভারের সময়',
      'book_now': 'এখন বুক করুন',
      'wait_driver_confirm': 'ড্রাইভার নিশ্চিত করার জন্য অপেক্ষা করুন',

      'help_center_title': 'Help Center / FAQs',
      'faq_heading': 'Current Frequently Asked Questions',
      'faq_search_hint': 'Search FAQs',
      'faq_cant_find': "Can't find what you're looking for?",
      'faq_contact_support': 'Contact Support',
      'refund_policy': 'রিফান্ড নীতি',

      'notification_title': 'বিজ্ঞপ্তি',
      'notif_today': 'আজ',
      'notif_earlier': 'আগে',
      'notif_rate_title': 'আপনার ভ্রমণের রেটিং দিন',
      'notif_rate_sub':
          'ব্যারির সাথে রাইড নেওয়ার জন্য ধন্যবাদ, রেটিং এবং মতামত দিন!',
      'notif_paypal_title':
          'Paypal অ্যাকাউন্ট লিংক করুন এবং প্রথম ২টি রাইডে ২০% ছাড় পান',
      'notif_coupon_title': 'G0948 কুপনের মেয়াদ শেষ হয়ে গেছে',
      'notif_update_photo_title': 'আপনার প্রোফাইল ছবি আপডেট করুন',
      'ago_min': '{x} মিনিট আগে',
      'ago_day': '{x} দিন আগে',
      'ago_week': '{x} সপ্তাহ আগে',
      'ago_month': '{x} মাস আগে',
      'confirm_delete_title': 'অ্যাকাউন্ট মুছে ফেলা নিশ্চিত করুন',
      'warning_title': 'সতর্কতা: এই পদক্ষেপটি অপরিবর্তনীয়।',
      'warning_intro': 'আপনি স্থায়ীভাবে হারাবেন:',
      'warning_b1': 'যাত্রার রেকর্ড এবং রসিদ',
      'warning_b2': 'জরুরি যোগাযোগের তথ্য',
      'warning_b3': 'চলমান বা ভবিষ্যতের বুকিং',
      'warning_b4': 'ছাড় বা প্রোমো যোগ্যতা',
      'checklist_title': 'মুছে ফেলার আগে চেকলিস্ট',
      'check_1': 'আমার কোনো চলমান ট্রিপ নেই',
      'check_2': 'আমি সমস্ত পেমেন্ট/রিফান্ড নিষ্পত্তি করেছি',
      'check_3': 'আমি বুঝতে পারছি এটি চূড়ান্ত পদক্ষেপ',
      'delete_cta': 'আমার অ্যাকাউন্ট স্থায়িভাবে মুছে ফেলুন',
      'delete_account_title': 'অ্যাকাউন্ট মুছুন',
      'why_leaving': 'তুমি কেন চলে যাচ্ছো?',
      'reason_no_need': 'আমার আর অ্যাম্বুলেন্স পরিষেবার প্রয়োজন নেই',
      'reason_issue_app':
          'অ্যাপটি ব্যবহার করে আমি একটি সমস্যার সম্মুখীন হয়েছি',
      'reason_bad_experience': 'আমার একটি খারাপ অভিজ্ঞতা হয়েছে',
      'reason_new_account': 'আমি একটি নতুন অ্যাকাউন্ট তৈরি করতে চাই',
      'security_confirmation': 'নিরাপত্তা নিশ্চিতকরণ',
      'phone_label': 'ফোন',
      'email_label': 'ইমেইল',
      'enter_email': 'ইমেইল লিখুন',
      'validation_phone': 'সঠিক ফোন নম্বর লিখুন',
      'validation_email': 'সঠিক ইমেইল ঠিকানা লিখুন',
      'delete_account_desc':
          'আপনার অ্যাকাউন্টটি স্থায়ীভাবে মুছে ফেলা হবে। আপনি আপনার রাইডের ইতিহাস, সংরক্ষিত ডেটা এবং যেকোনো সক্রিয় বুকিং অ্যাক্সেস হারাবেন।',
      'delete_account_question': 'আপনি কি নিশ্চিত যে আপনি চালিয়ে যেতে চান?',
      'yes': 'হ্যাঁ',
      'no': 'না',
      'delete_account': 'অ্যাকাউন্ট মুছে ফেলুন',
      'current_password': 'বর্তমান পাসওয়ার্ড',
      'enter_current_password': 'বর্তমান পাসওয়ার্ড লিখুন',
      'new_password': 'নতুন পাসওয়ার্ড',
      'enter_new_password': 'নতুন পাসওয়ার্ড লিখুন',
      'enter_password': 'পাসওয়ার্ড লিখুন',
      'required': 'এই ঘরটি আবশ্যক',
      'pwd_mismatch': 'পাসওয়ার্ড মিলছে না',
      'pwd_min': 'পাসওয়ার্ড অন্তত ৬ অক্ষরের হতে হবে',
      'update_success_desc': 'আপনার পাসওয়ার্ড সফলভাবে আপডেট হয়েছে',
      'ok': 'ওকে',

      "err_location_service_disabled": "Please enable Location Services",
      "err_location_permission_denied": "Permission denied",
      "err_location_permission_denied_forever": "Permission permanently denied",
      "err_location_unknown": "Unknown location error",
      'tk_search_booking': 'ট্রিপ খুঁজুন',
      'tk_upcoming': 'আসন্ন',
      'tk_past': 'অতীত',
      'tk_cancelled': 'ক্যানসেল',
      'tk_today': 'আজ',
      'tk_tomorrow': 'আগামীকাল',
      'tk_bdt': 'টাকা',
      'tk_complete': 'সম্পূর্ণ',
      'tk_cancel': 'ক্যানসেল',
      'tk_scheduled': 'নির্ধারিত',
      'tk_upcoming_badge': 'আসন্ন',
      'tk_location': 'গুলশান ১, ঢাকা, বাংলাদেশ',
      'tk_destination': 'জরুরি সেবা ক্লিনিক (১০১ এলম স্ট্রিট)',
      'tk_yesterday': 'গতকাল',

      //New contact
      'phone_number': 'ফোন নম্বর',
      'enter_phone_number': 'ফোন নম্বর লিখুন',

      // saved address
      'add_new_address': 'নতুন ঠিকানা যোগ করুন',
      'home': 'ঘর',
      'office': 'অফিস',
      'hospital': 'হাসপাতাল',
      'address_name_title': 'ঠিকানার নাম',
      'name_label': 'নাম',
      'enter_name': 'নাম লিখুন',
      'please_enter_name': 'অনুগ্রহ করে নাম লিখুন',
      'address_saved': 'ঠিকানা সংরক্ষণ হয়েছে',
      'hazrat_airport_title': 'হযরত শাহজালাল আন্তর্জাতিক বিমানবন্দর',
      'hazrat_airport_sub': 'বিমানবন্দর – দক্ষিণখান সড়ক, ঢাকা',

      // trip track
      'driver_arriving': 'ড্রাইভার আসছে',
      'meet_driver_hint': 'পিকআপ স্পটে ড্রাইভারের সাথে দেখা করুন',
      'ratings': 'রেটিংস',
      'pickup_address': 'পিক-আপ ঠিকানা',
      'dropoff_address': 'ড্রপ-অফ ঠিকানা',
      'due': 'বকেয়া',
      'change_destination': 'গন্তব্য পরিবর্তন করুন',
      'cancel_trip': 'ট্রিপ বাতিল করুন',
      'cancel_trip_title': 'ট্রিপ বাতিল করবেন?',
      'cancel_trip_confirm': 'আপনি কি নিশ্চিত যে বাতিল করতে চান?',
      'no_keep': 'না, রাখুন',
      'driver_arrived': 'ড্রাইভার এসেছে',
      'reach_pickup_in_5min':
          'অপেক্ষার চার্জ এড়াতে ৫ মিনিটের মধ্যে পিক-আপ স্পটে পৌঁছান।',
      'ride_in_progress': 'যাত্রা চলছে',
      'reach_destination_by': 'আপনি {time} নাগাদ গন্তব্যে পৌঁছাবেন',
      'ride_complete': 'সম্পূর্ণ যাত্রা',
      'reached_destination': 'আপনি গন্তব্যে পৌঁছে গেছেন',
      'amount_breakdown': 'খরচের বিবরণ',
      'client_will_pay': 'ক্লায়েন্ট টাকা দেবে',
      'confirm_payment': 'বুকিং পেমেন্ট',
      'emergency_assistance': 'জরুরি সহায়তা',
      'emergency_assistance_desc':
          'আপনি সাহায্যের জন্য কল করলে, আপনার অবস্থান এবং গাড়ির বিবরণ স্বয়ংক্রিয়ভাবে শেয়ার করা হবে।',
      'your_current_location': 'আপনার বর্তমান অবস্থান',
      'vehicle_details': 'গাড়ির বিবরণ',
      'share_my_trip': 'আমার ট্রিপ শেয়ার করুন',
      'call_999': '৯৯৯ নম্বরে কল করুন',
      'change_destination_title': 'গন্তব্য পরিবর্তন',
      'change_destination_intro':
          'অ্যাম্বুফাস্ট গ্রাহকদের লাইভ ট্রিপে একবার ড্রপ-অফ লোকেশন পরিবর্তন করতে বা অতিরিক্ত স্টপ যোগ করতে দেয় '
          '(যেমন হাসপাতাল পরিবর্তনের জন্য), জরুরি পরিস্থিতিতে নমনীয়তা নিশ্চিত করে।',
      'when_you_can_change':
          'যখন আপনি গন্তব্য/স্টপ পরিবর্তন বা যোগ করতে পারবেন',
      'rule_after_trip_started_before_dest':
          'যাত্রা শুরু হওয়ার পরে, কিন্তু মূল গন্তব্যে পৌঁছানোর আগে।',
      'rule_cannot_change_pickup':
          'ট্রিপ শুরু হওয়ার পরে পিকআপ লোকেশন পরিবর্তন করা যাবে না।',
      'rule_change_drop_once':
          'প্রতি ট্রিপে ড্রপ-অফ ঠিকানা কেবল একবার পরিবর্তন করা যাবে।',
      'rule_add_multiple_stops':
          'ড্রাইভার ও সিস্টেম অনুমোদনসাপেক্ষে একাধিক স্টপ (সর্বোচ্চ ২টি) যোগ করা যাবে।',
      'change_add_destination_once': 'গন্তব্য পরিবর্তন/যোগ করুন (একবারের জন্য)',
      'step_open_live': 'লাইভ ট্রিপ স্ক্রিন খুলুন।',
      'step_tap_change': '“গন্তব্য পরিবর্তন করুন” এ ট্যাপ করুন।',
      'step_enter_new_drop': 'নতুন ড্রপ-অফ লোকেশন লিখুন/নির্বাচন করুন।',
      'step_view_fare': 'আপডেটেড ভাড়ার হিসাব দেখুন।',
      'step_tap_confirm': 'পরিবর্তন নিশ্চিত করুন।',
      'cta_change_add_destination': 'গন্তব্য পরিবর্তন/যোগ করুন',
      'request_driver': 'ড্রাইভারের কাছে অনুরোধ',
      'edit_trip': 'ট্রিপ এডিট করুন',
      'track_trip': 'ট্রিপ ট্র্যাক করুন',
      'report_issue': 'রিপোর্ট করুন',
      'rebook_trip': 'পুনরায় বুক করুন',

      //rating
      "trip.field.rating": "রেটিং",
      "trip.rating.none": "রেটিং দেওয়া হয়নি",

      "trip.actions.reportIssue": "Report an Issue",

      'trip.title': 'ট্রিপ বিস্তারিত',
      'trip.section.distanceTime': 'দূরত্ব ও আনুমানিক সময়:',
      'trip.section.tripStatus': 'ট্রিপ স্ট্যাটাস',
      'trip.section.advancePay': 'অ্যাডভান্স পেমেন্ট স্ট্যাটাস',
      'trip.section.finalPay': 'ফাইনাল পেমেন্ট স্ট্যাটাস',
      'trip.field.tripId': 'ট্রিপ আইডি',
      'trip.field.contact': 'কন্ট্যাক্ট',
      'trip.field.ambulance': 'অ্যাম্বুলেন্স',
      'trip.field.type': 'ট্রিপ টাইপ',
      'trip.field.txnId': 'ট্রানজ্যাকশন আইডি',
      'trip.field.amount': 'পরিমাণ',
      'trip.field.method': 'পেমেন্ট মেথড',
      'trip.field.paidOn': 'অ্যাডভান্স পরিশোধের সময়',
      'trip.actions.download': 'রসিদ ডাউনলোড',
      'trip.actions.go': 'এই ট্রিপে যান',
      'trip.actions.start': 'ট্রিপ শুরু করুন',
      'trip.actions.cancel': 'ট্রিপ বাতিল করুন',
      'trip.badge.upcoming': 'আসন্ন',
      'trip.badge.scheduled': 'শিডিউলড',
      'trip.badge.completed': 'সম্পন্ন',
      'trip.badge.cancelled': 'বাতিল',
      'trip.badge.paid': 'Paid',
      'trip.badge.unpaid': 'Unpaid',
      'trip.rating.count.singular': 'রেটিং',
      'trip.rating.count.plural': 'রেটিংস',
      'trip.misc.forMe': 'আমার জন্য',
      'trip.misc.single': 'সিঙ্গেল ট্রিপ',

      'rating.tags.safeDriving': 'নিরাপদ ড্রাইভিং',
      'rating.tags.politeHelpful': 'ভদ্র ও সহায়ক',
      'rating.tags.cleanCar': 'পরিষ্কার গাড়ি',
      'rating.tags.onTimePickup': 'সময়ে পিকআপ',
      'rating.tags.efficientRoute': 'কার্যকর রুট',
      'rating.tags.comfortableRide': 'আরামদায়ক যাত্রা',

      'rating.tags.minorDelay': 'সামান্য দেরি',
      'rating.tags.slightDetour': 'সামান্য ঘুরপথ',
      'rating.tags.acCouldImprove': 'এসি/স্বাচ্ছন্দ্য উন্নত করা যেতে পারে',
      'rating.tags.priceBitHigh': 'দাম একটু বেশি',

      'rating.tags.latePickup': 'পিকআপ দেরিতে',
      'rating.tags.longRoute': 'রুট লম্বা',
      'rating.tags.unclearCommunication': 'যোগাযোগ পরিষ্কার নয়',
      'rating.tags.uncomfortableRide': 'অস্বস্তিকর যাত্রা',
      'rating.tags.priceHigh': 'দাম বেশি',

      'rating.tags.unsafeDriving': 'অনিরাপদ ড্রাইভিং',
      'rating.tags.rudeBehavior': 'অভদ্র আচরণ',
      'rating.tags.dirtyCar': 'নোংরা গাড়ি',
      'rating.tags.wrongRoute': 'ভুল রুট',
      'rating.tags.overcharged': 'অতিরিক্ত ভাড়া/ভাড়ার সমস্যা',
      'rating.tags.acNotWorking': 'এসি কাজ করছে না',
      'rating.tags.refusedOrCancelled': 'যাত্রা বাতিল/অস্বীকার',

      'rating.tags.others': 'অন্যান্য',

      'rating.sub.1': 'খুবই খারাপ অভিজ্ঞতা',
      'rating.sub.2': 'ভালো লাগেনি',
      'rating.sub.3': 'মোটামুটি হয়েছে',
      'rating.sub.4': 'ভালো যাত্রা, কিন্তু আরও ভালো হতে পারে',
      'rating.sub.5': 'দারুণ যাত্রা!',

      'rating.title': 'রেটিং',
      'rating.header.question': 'ড্রাইভারের সাথে তোমার ভ্রমণ কেমন ছিল?',
      'rating.sub.rate': 'ড্রাইভারের সাথে তোমার অভিজ্ঞতাকে রেট করো',
      'rating.sub.good_but_better': 'ভালো যাত্রা, কিন্তু আরো ভালো হতে পারত',
      'rating.tags.cleanliness': 'পরিচ্ছন্নতা',
      'rating.tags.navigation': 'নেভিগেশন',
      'rating.tags.price': 'দাম',
      'rating.tags.service': 'সার্ভিস',
      'rating.tags.route': 'রুট',
      'rating.tags.driving': 'ড্রাইভিং',
      'rating.form.tell_more': 'সমস্যাটি সম্পর্কে আমাদের আরও বলুন',
      'rating.form.hint': 'তোমার মতামত লিখো',
      'common.done': 'সম্পন্ন',

      // service
      'service_details_title': 'পরিষেবার বিবরণ',
      'ac_ambulance_title': 'এসি অ্যাম্বুলেন্স (BLS)',
      'ac_ambulance_desc':
          'আমাদের শীতাতপ নিয়ন্ত্রিত বেসিক লাইফ সাপোর্ট (BLS) অ্যাম্বুলেন্সটি জরুরি চিকিৎসা সেবার প্রয়োজন এমন রোগীদের নিরাপদ এবং আরামদায়ক পরিবহন প্রদানের জন্য সজ্জিত। এতে অক্সিজেন সহায়তা এবং মৌলিক প্রাথমিক চিকিৎসা সরঞ্জাম রয়েছে, যা নিয়মিত হাসপাতাল পরিদর্শন, ছুটি বা স্থানান্তর, সময় নির্ভরযোগ্য পরিষেবা নিশ্চিত করে। পরিবহনের সময় পেশাদার যত্নের প্রয়োজন এমন রোগীদের জন্য উপযুক্ত।',
      'additional_service_title': 'অতিরিক্ত পরিষেবা',
      'doctor_service':
          'অক্সিজেন', // Note: As per your image, the first item is 'Oxygen'
      'oxygen_service':
          'হুইল চেয়ার', // Note: As per your image, the second is 'Wheel Chair'
      'hand_stretcher_service': 'হ্যান্ড স্ট্রেচার',
      'helper_service': 'অতিরিক্ত কর্মী-সহায়ক',
      'price_1200': '৳ ১২০০',
      'price_0': '৳ ০',
      'book_now_button': 'এখন বুক করুন',

      'dob_label': 'জন্ম তারিখ:',

      'gender_label': 'লিঙ্গ:',
      'blood_group_label': 'রক্তের গ্রুপ:',

      //Professional
      'professional_info_title': 'পেশাদার তথ্য',
      'affiliation_type': 'অধিভুক্তির ধরন',
      'org_business_name': 'Organisation/Business Name',
      'your_role': 'তোমার ভূমিকা',
      'zone_area': 'কার্যক্ষেত্র / অঞ্চল',
      'work_id': 'কর্মস্থলের আইডি',
      'nid_front': 'জাতীয় পরিচয়পত্রের সামনের দিক',
      'nid_back': 'জাতীয় পরিচয়পত্রের পেছনের দিক',
      'save': 'সংরক্ষণ করুন',
      'saving': 'সংরক্ষণ হচ্ছে...',

      'enter_affiliation_title': 'অধিভুক্তি লিখুন',
      'enter_affiliation_hint': 'আপনার অধিভুক্তি টাইপ করুন',

      'aff_hospital': 'হাসপাতাল',
      'aff_pharmacy': 'ফার্মেসি',
      'aff_ngo_clinic': 'এনজিও/ক্লিনিক',
      'aff_chv': 'কমিউনিটি স্বাস্থ্য স্বেচ্ছাসেবক',
      'aff_other': 'অন্যান্য (ম্যানুয়ালি উল্লেখ করুন)',

      'edit_professional_info': 'এডিট প্রফেশনাল ইনফরমেশন',
      'professional_information': 'পেশাদার তথ্য',
      'affiliation_type_star': 'অধিভুক্তির ধরন*',
      'affiliation_details': 'অধিভুক্তির বিস্তারিত',
      'org_business_name_star': 'প্রতিষ্ঠান/ব্যবসার নাম*',
      'your_role_star': 'আপনার ভূমিকা*',
      'zone_area_star': 'জোন / এরিয়া*',
      'org_name_hint': 'প্রতিষ্ঠানের নাম লিখুন',
      'role_hint': 'আপনার ভূমিকা লিখুন',
      'zone_hint': 'জোন/এরিয়া লিখুন',
      'document_uploads': 'ডকুমেন্ট আপলোডস',
      'work_id_upload_title': 'কর্মস্থলের আইডি আপলোড',
      'work_id_upload_desc': 'এখানে আপনার আইডি ছবি যোগ করুন, এবং আপলোড…',
      'drag_or_browse':
          'আপনার ফাইল(গুলি) ড্র্যাগ করুন বা ব্রাউজ করুন\nসর্বোচ্চ ১০ এমবি ফাইল অনুমোদিত',
      'only_img_10mb': 'শুধু .jpg, .png সমর্থিত',
      'nid_front_star': 'জাতীয় পরিচয়পত্রের সামনের দিক*',
      'nid_back_star': 'জাতীয় পরিচয়পত্রের পেছনের দিক*',
      'nid_front_hint': 'কার্ডের সামনের দিক আপলোড করতে ক্লিক করুন',
      'nid_front_maxnote': '(সর্বোচ্চ ফাইল সাইজ: ২৫ এমবি)',
      'nid_back_hint': 'কার্ডের পেছনের দিক আপলোড করতে ক্লিক করুন',
      'nid_back_maxnote': '(সর্বোচ্চ ফাইল সাইজ: ২৫ এমবি)',

      'uploaded_success': 'সফলভাবে আপলোড হয়েছে',
      'confirm_change_title':
          'আপনি কি নিশ্চিত যে আপনার পেশাগত তথ্য পরিবর্তন করতে চান?',

      'important_notes': 'গুরুত্বপূর্ণ নোট:',
      'note_1':
          'এই পরিবর্তনের পরে আপনার প্রোফাইল সাময়িকভাবে পর্যালোচনার অধীনে থাকবে।',
      'note_3': 'ভুল বা বিভ্রান্তিকর তথ্য জমা দিলে অ্যাকাউন্ট স্থগিত হতে পারে।',
      'submit_for_review': 'পর্যালোচনার জন্য জমা দিন',
      'go_back': 'ফিরে যান',
      'confirm_change_intro':
          'আপনি আপনার ওয়ার্ক আইডি এবং জাতীয় পরিচয়পত্র (NID) আপডেট করতে চলেছেন। অনুগ্রহ করে নিশ্চিত করুন:',
      'confirm_point_1': 'ডকুমেন্টগুলো আপনার এবং বৈধ।',
      'confirm_point_2':
          'সব তথ্য (আইডি নম্বর, নাম ইত্যাদি) সঠিক এবং স্পষ্টভাবে পড়া যায়।',
      'confirm_point_3':
          'স্পষ্ট ছবি/স্ক্যান আপলোড করা হয়েছে — জাতীয় পরিচয়পত্রের সামনে ও পেছন, এবং ওয়ার্ক আইডি।',
      'note_2':
          'আপনার নতুন ডকুমেন্ট অনুমোদিত না হওয়া পর্যন্ত আপনি ট্রিপ অনুরোধ নাও পেতে পারেন।',
      'under_review_title': 'আপনার ডকুমেন্ট যাচাই করা হচ্ছে',
      'under_review_desc':
          'আপনার জমা দেওয়া ওয়ার্ক আইডি এবং জাতীয় পরিচয়পত্র আমরা যাচাই করছি। এটি সম্পন্ন হতে কিছু সময় লাগতে পারে। যাচাই চলাকালীন আপনি তথ্য সম্পাদনা করতে পারবেন না।',
      'docs_not_approved_title': 'আপনার ডকুমেন্ট অনুমোদিত নয়',
      'docs_not_approved_desc':
          'আপনার জমা দেওয়া তথ্য ভুল/অসম্পূর্ণ হওয়ায় অনুমোদিত হয়নি। অনুগ্রহ করে বৈধ ওয়ার্ক আইডি এবং জাতীয় পরিচয়পত্র পুনরায় জমা দিন।',
    },
  };
}
