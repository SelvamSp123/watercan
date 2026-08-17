ximport 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  final bool embedded;
  const ProfileScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final menu = [
      (Icons.description_outlined, 'My Orders'),
      (Icons.location_on_outlined, 'My Addresses'),
      (Icons.credit_card_outlined, 'Payment Methods'),
      (Icons.inventory_2_outlined, 'My Empty Can History'),
      (Icons.people_outline_rounded, 'Refer & Earn'),
      (Icons.settings_outlined, 'Settings'),
      (Icons.help_outline_rounded, 'Help & Support'),
      (Icons.logout_rounded, 'Logout'),
    ];

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            children: [
              const CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(Icons.person, color: AppColors.primary, size: 32)),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selvam P', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
                    Text('+91 98765 43210', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
              const CircleAvatar(radius: 16, backgroundColor: Colors.white24, child: Icon(Icons.edit_rounded, color: Colors.white, size: 16)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...menu.map((m) => ListTile(
              leading: Icon(m.$1, color: AppColors.textDark),
              title: Text(m.$2, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              onTap: () {},
            )),
      ],
    );

    if (embedded) return SingleChildScrollView(child: content);
    return Scaffold(body: SafeArea(child: SingleChildScrollView(child: content)));
  }
}
