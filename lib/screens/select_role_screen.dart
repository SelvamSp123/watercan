import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Choose Your Role', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              const Text('Select how you want to continue', style: TextStyle(color: AppColors.textMuted, fontSize: 15)),
              const SizedBox(height: 32),
              _RoleCard(
                icon: Icons.person_rounded,
                iconBg: AppColors.primary,
                title: 'I am a Customer',
                subtitle: 'Buy water cans from nearby sellers',
                onTap: () => Navigator.pushNamed(context, '/login'),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                icon: Icons.storefront_rounded,
                iconBg: AppColors.secondary,
                title: 'I am a Seller',
                subtitle: 'Sell water cans and grow your business',
                onTap: () => Navigator.pushNamed(context, '/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: iconBg.withOpacity(0.06),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: iconBg.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 24, backgroundColor: iconBg, child: Icon(icon, color: Colors.white)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_rounded, color: iconBg),
          ],
        ),
      ),
    );
  }
}
