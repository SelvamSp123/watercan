import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrdersScreen extends StatelessWidget {
  final bool embedded;
  const OrdersScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final orders = [
      ('#WC123456', 'Aqua Fresh Water', '2 x 20L Can', 'Delivered', AppColors.secondary),
      ('#WC123455', 'Crystal Clear', '1 x 25L Can', 'Out for Delivery', AppColors.primary),
      ('#WC123454', 'Pure Life Water', '3 x 20L Can', 'Delivered', AppColors.secondary),
    ];

    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('My Orders', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          ...orders.map((o) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border)),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(color: const Color(0xFFDCEBFF), borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.local_drink_rounded, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(o.$2, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                          Text('${o.$1}  •  ${o.$3}', style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: o.$5.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                      child: Text(o.$4, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: o.$5)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );

    if (embedded) return SingleChildScrollView(child: content);
    return Scaffold(body: SafeArea(child: SingleChildScrollView(child: content)));
  }
}
