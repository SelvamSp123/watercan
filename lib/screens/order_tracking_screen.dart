import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = const [
      TrackingStep(title: 'Order Confirmed', time: '10:32 AM', done: true),
      TrackingStep(title: 'Out for Delivery', time: '10:45 AM', done: true),
      TrackingStep(title: 'Delivered', time: '--:--', done: false),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking', style: TextStyle(fontWeight: FontWeight.w700))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order ID: #WC123456', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
              const SizedBox(height: 2),
              const Text('Placed on 20 May 2025, 10:30 AM', style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 20),
              Row(children: const [
                Icon(Icons.check_circle_rounded, color: AppColors.secondary, size: 20),
                SizedBox(width: 8),
                Text('Order Confirmed', style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w700)),
              ]),
              const Text('Seller has confirmed your order', style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 24),
              ...List.generate(steps.length, (i) => _StepRow(step: steps[i], isLast: i == steps.length - 1)),
              const SizedBox(height: 24),
              const Text('Delivery Partner', style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border)),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 22, backgroundColor: Color(0xFFDCEBFF), child: Icon(Icons.person, color: AppColors.primary)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Karthik', style: TextStyle(fontWeight: FontWeight.w700)),
                          Row(children: [
                            Icon(Icons.star_rounded, size: 14, color: AppColors.star),
                            Text(' 4.7', style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                          ]),
                        ],
                      ),
                    ),
                    CircleAvatar(backgroundColor: AppColors.primary.withOpacity(0.1), child: const Icon(Icons.phone_rounded, color: AppColors.primary, size: 18)),
                  ],
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text('Need Help?', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final TrackingStep step;
  final bool isLast;
  const _StepRow({required this.step, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final color = step.done ? AppColors.secondary : AppColors.border;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(width: 14, height: 14, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
              if (!isLast) Expanded(child: Container(width: 2, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(step.title, style: TextStyle(fontWeight: FontWeight.w600, color: step.done ? AppColors.textDark : AppColors.textMuted)),
                  Text(step.time, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
