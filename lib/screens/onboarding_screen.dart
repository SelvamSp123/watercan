ximport 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      (Icons.verified_user_rounded, 'Trusted\nSellers'),
      (Icons.local_shipping_rounded, 'Fast\nDelivery'),
      (Icons.payments_rounded, 'Easy\nPayment'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fresh Water\nDelivered to You',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.25)),
              const SizedBox(height: 10),
              const Text('Order water cans easily from trusted sellers near you.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 15)),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: Icon(Icons.local_drink_rounded, size: 160, color: AppColors.primary.withOpacity(0.85)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: features
                    .map((f) => Column(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.primary.withOpacity(0.1),
                              child: Icon(f.$1, color: AppColors.primary),
                            ),
                            const SizedBox(height: 6),
                            Text(f.$2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                          ],
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/select-role'),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
