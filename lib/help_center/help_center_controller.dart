import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  /// all FAQs (id is used to track expanded state safely)
  final faqs = <Map<String, String>>[
    {
      'id': 'what_ambufast',
      'question': 'What is AmbuFast?',
      'answer':
          'AmbuFast is Bangladesh’s leading technology-driven ambulance booking and emergency medical transport solution. Our app connects you to safe, reliable, and certified ambulance services—anytime, anywhere in Bangladesh.',
    },
    {
      'id': 'service_type',
      'question': 'What types of ambulance services are available?',
      'answer':
          '• AC Basic Life Support (BLS) \n• ICU/CCU Advanced Life Support (ALS) \n• Freezing Vans (for deceased transport) \n• Air Ambulance (currently via hotline only)',
    },
    {
      'id': 'book',
      'question': 'How do I book an ambulance?',
      'answer':
          '• Open the AmbuFast app \n• Select your pick-up and drop-off locations \n• Choose ambulance type \n• See fare estimate and confirm details \n• Pay 15-20% advance to confirm booking \n• Receive live driver/vehicle details after payment',
    },
    {
      'id': 'payment',
      'question': 'What payment methods are accepted?',
      'answer':
          '• bKash \n• Nagad \n• Visa/MasterCard \n• More options coming soon.',
    },
    {
      'id': 'advance_payment',
      'question': 'Is advance payment required?',
      'answer':
          'Yes, a 15-20% advance is needed to confirm your booking. Unpaid bookings are auto-cancelled after 10 minutes.',
    },
    {
      'id': 'calculation',
      'question': 'How is the fare calculated?',
      'answer':
          'Fares are based on: \n    • Distance (base fare + per km) \n    • Ambulance type \n    • Zone (metro/rural) \n    • Waiting time, multi-stop, and return trip options You’ll see a fare estimate before confirming.',
    },
    {
      'id': 'change_dest',
      'question': 'Can I change my destination after booking?',
      'answer':
          'Yes, you may change your destination once during the trip. The fare will update automatically.',
    },
    {
      'id': 'prebook',
      'question':
          'Can I pre-book an ambulance for a future date (e.g., for pregnancy)?',
      'answer':
          'Yes! Use the pre-booking feature for planned needs, including pregnancy transport. The app will send reminders and arrange early dispatch as needed.',
    },
    {
      'id': 'contact',
      'question': 'How do I contact customer support?',
      'answer':
          '• 24/7 hotline: 09678 911 911 \n• WhatsApp: +8809678911911 \n• In-app chat (coming soon)',
    },
    {
      'id': 'payment_info_safe',
      'question': 'Is my personal and payment information safe?',
      'answer':
          'Absolutely. AmbuFast uses advanced encryption, secure payment gateways, and follows strict data privacy and ISO 27001 standards',
    },
    {
      'id': 'cancel_policy',
      'question': 'What’s the cancellation policy?',
      'answer':
          '• Emergency bookings: May incur a fee after confirmation \n• Non-emergency: Cancel free before pickup \n• Frequent cancellations may restrict your account',
    },
    {
      'id': 'discount',
      'question': 'Are there discounts or special offers?',
      'answer':
          '• Robi users: 5% discount and priority support \n• Discounts for underprivileged patients and special rates for deceased transport \n• AmbuPoints rewards for regular users',
    },
    {
      'id': 'earn_points',
      'question': 'How do I earn and use AmbuPoints?',
      'answer':
          'Earn AmbuPoints with every booking. Redeem them for discounts on future ambulance services through the app’s Rewards section.',
    },
    {
      'id': 'available',
      'question': 'Is AmbuFast available everywhere in Bangladesh?',
      'answer':
          'Absolutely. AmbuFast uses advanced encryption, secure payment gateways, and follows strict data privacy and ISO 27001 standards',
    },
    {
      'id': 'safety_measures',
      'question': 'What safety measures are in place for users?',
      'answer':
          '• All drivers are background-checked, licensed, and trained \n• Ambulances are regularly audited and equipped with medical-grade supplies \n• Your address and contact details are protected and only shared after booking confirmation',
    },
    {
      'id': 'book_for',
      'question': 'Can I book on behalf of someone else?',
      'answer':
          'Yes, you can book for family, friends, or anyone needing medical transport.',
    },
  ].obs;

  /// search query & results
  final query = ''.obs;
  final filteredFaqs = <Map<String, String>>[].obs;

  /// expanded card ids
  final expanded = <String>{}.obs;

  void toggle(String id) {
    if (expanded.contains(id)) {
      expanded.remove(id);
    } else {
      expanded.add(id);
    }
  }

  void _applyFilter() {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) {
      filteredFaqs.assignAll(faqs);
    } else {
      filteredFaqs.assignAll(
        faqs.where(
          (e) =>
              (e['question'] ?? '').toLowerCase().contains(q) ||
              (e['answer'] ?? '').toLowerCase().contains(q),
        ),
      );
    }
  }

  @override
  void onInit() {
    filteredFaqs.assignAll(faqs);
    // debounce search for performance
    debounce<String>(
      query,
      (_) => _applyFilter(),
      time: const Duration(milliseconds: 300),
    );
    super.onInit();
  }
}
