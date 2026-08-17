import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../widgets/bottom_nav.dart';
import 'products_screen.dart';
import 'orders_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _HomeTab(),
      const OrdersScreen(embedded: true),
      const CartScreen(embedded: true),
      const ProfileScreen(embedded: true),
    ];

    return Scaffold(
      body: SafeArea(child: pages[navIndex]),
      bottomNavigationBar: AppBottomNav(
        currentIndex: navIndex,
        cartCount: 2,
        onTap: (i) => setState(() => navIndex = i),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.white, size: 18),
                        SizedBox(width: 4),
                        Text('Coimbatore, Tamil Nadu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                      ],
                    ),
                    const Icon(Icons.notifications_none_rounded, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: const [
                      Icon(Icons.search_rounded, color: AppColors.textMuted),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for water, sellers...',
                            border: InputBorder.none,
                            filled: false,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      Icon(Icons.tune_rounded, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCEBFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Stay Hydrated\nStay Healthy',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, height: 1.3)),
                          const SizedBox(height: 6),
                          const Text('Pure & safe drinking water for your family',
                              style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    const Icon(Icons.water_drop_rounded, size: 56, color: AppColors.primary),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Sellers', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  TextButton(onPressed: () {}, child: const Text('See All')),
                ],
              ),
              ...popularSellers.map((s) => _SellerTile(seller: s)),
            ]),
          ),
        ),
      ],
    );
  }
}

class _SellerTile extends StatelessWidget {
  final Seller seller;
  const _SellerTile({required this.seller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsScreen(seller: seller))),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(color: const Color(0xFFDCEBFF), borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.local_drink_rounded, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(seller.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.star, size: 16),
                      Text(' ${seller.rating} (${seller.reviews})  ', style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                      const Icon(Icons.access_time_rounded, size: 14, color: AppColors.textMuted),
                      Text(' ${seller.eta}', style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textMuted),
                Text(seller.distance, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
