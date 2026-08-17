import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final bool embedded;
  const CartScreen({super.key, this.embedded = false});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 1;
  bool returnCan = false;

  static const price = 40;
  static const deliveryCharge = 10;
  static const platformFee = 5;

  int get subtotal => price * qty;
  int get total => subtotal + deliveryCharge + platformFee;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.embedded)
            Row(children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back), padding: EdgeInsets.zero),
              const SizedBox(width: 4),
              const Text('Your Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            ])
          else
            const Text('Your Cart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(flex: 3, child: Text('Item', style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600))),
              Expanded(flex: 2, child: Text('Qty', style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600))),
              Expanded(flex: 1, child: Text('Price', textAlign: TextAlign.right, style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600))),
            ],
          ),
          const Divider(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Row(children: const [
                  Icon(Icons.local_drink_rounded, color: AppColors.primary),
                  SizedBox(width: 8),
                  Expanded(child: Text('20L Water Can\n(One Time)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
                ]),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    InkWell(onTap: () => setState(() => qty = qty > 1 ? qty - 1 : 1), child: const Icon(Icons.remove_circle_outline, size: 20)),
                    SizedBox(width: 24, child: Text('$qty', textAlign: TextAlign.center)),
                    InkWell(onTap: () => setState(() => qty++), child: const Icon(Icons.add_circle_outline, size: 20, color: AppColors.primary)),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Text('₹$subtotal', textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w700))),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Have an empty can to return?', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              Switch(value: returnCan, activeColor: AppColors.primary, onChanged: (v) => setState(() => returnCan = v)),
            ],
          ),
          const Text('You can return empty can during delivery', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
          const SizedBox(height: 16),
          _row('Delivery Charges', '₹$deliveryCharge'),
          _row('Platform Fee', '₹$platformFee'),
          const Divider(height: 24),
          _row('Total Amount', '₹$total', bold: true),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(total: total))),
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );

    if (widget.embedded) return SingleChildScrollView(child: content);
    return Scaffold(body: SafeArea(child: SingleChildScrollView(child: content)));
  }

  Widget _row(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
      fontSize: bold ? 16 : 13,
      color: bold ? AppColors.textDark : AppColors.textMuted,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: style), Text(value, style: style)]),
    );
  }
}
