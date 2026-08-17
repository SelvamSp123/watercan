ximport 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'order_tracking_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final int total;
  const CheckoutScreen({super.key, required this.total});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String payment = 'cod';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.w700))),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Delivery Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border)),
                child: Row(
                  children: const [
                    Icon(Icons.home_rounded, color: AppColors.primary),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Home', style: TextStyle(fontWeight: FontWeight.w700)),
                          SizedBox(height: 2),
                          Text('123, Gandhi Street, RS Puram, Coimbatore - 641002',
                              style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Add Delivery Instructions (Optional)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'E.g. Call before delivery')),
              const SizedBox(height: 20),
              const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              _paymentTile('cod', Icons.payments_outlined, 'Cash on Delivery', const Color(0xFF1FAE6E)),
              const SizedBox(height: 10),
              _paymentTile('upi', Icons.qr_code_rounded, 'UPI', AppColors.primary),
              const SizedBox(height: 10),
              _paymentTile('card', Icons.credit_card_rounded, 'Online Payment', AppColors.primary, sub: '(Card, Netbanking, Wallet)'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Amount', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text('₹${widget.total}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OrderTrackingScreen())),
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentTile(String value, IconData icon, String label, Color color, {String? sub}) {
    final selected = payment == value;
    return InkWell(
      onTap: () => setState(() => payment = value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  if (sub != null) Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: selected ? AppColors.primary : AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
