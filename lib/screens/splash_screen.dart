import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [AppColors.primary.withOpacity(0.12), Colors.transparent],
                  ),
                ),
                child: const Icon(Icons.water_drop_rounded, size: 120, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: AppColors.textDark),
                  children: [
                    TextSpan(text: 'Water'),
                    TextSpan(text: 'Can', style: TextStyle(color: AppColors.primary)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text('Pure Water, Near You', style: TextStyle(color: AppColors.textMuted, fontSize: 15)),
              const Spacer(flex: 3),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/onboarding'),
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/select-role'),
                child: const Text('Skip', style: TextStyle(color: AppColors.textMuted)),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
