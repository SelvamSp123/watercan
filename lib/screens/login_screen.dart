xximport 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool customerTab = true;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 8),
              const Text('Welcome Back!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('Login to continue', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 24),
              Row(
                children: [
                  _tab('Customer Login', customerTab, () => setState(() => customerTab = true)),
                  const SizedBox(width: 24),
                  _tab('Seller Login', !customerTab, () => setState(() => customerTab = false)),
                ],
              ),
              const SizedBox(height: 24),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'Mobile Number', prefixIcon: Icon(Icons.phone_outlined)),
              ),
              const SizedBox(height: 14),
              TextField(
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Row(children: const [
                Expanded(child: Divider()),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('or continue with', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _socialButton(Icons.g_mobiledata_rounded, 'Google')),
                  const SizedBox(width: 12),
                  Expanded(child: _socialButton(Icons.facebook_rounded, 'Facebook')),
                ],
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.textMuted),
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(text: 'Sign Up', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(label, style: TextStyle(
            fontWeight: FontWeight.w700,
            color: active ? AppColors.primary : AppColors.textMuted,
          )),
          const SizedBox(height: 6),
          if (active) Container(height: 3, width: 90, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: AppColors.textDark),
      label: Text(label, style: const TextStyle(color: AppColors.textDark)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
