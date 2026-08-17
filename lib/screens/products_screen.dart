ximport 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  final Seller seller;
  const ProductsScreen({super.key, required this.seller});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late List<CanOption> options = defaultCanOptions();

  int get itemCount => options.fold(0, (a, b) => a + b.qty);
  int get totalPrice => options.fold(0, (a, b) => a + b.qty * b.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.seller.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star_rounded, color: AppColors.star, size: 16),
                Text(' ${widget.seller.rating} (${widget.seller.reviews})  •  ${widget.seller.distance}  •  ${widget.seller.eta}',
                    style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Select Water Can Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) => _CanTile(
                  option: options[i],
                  onChanged: (v) => setState(() => options[i].qty = v),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: itemCount == 0
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const Icon(Icons.shopping_cart_rounded, size: 18, color: Colors.white),
                        const SizedBox(width: 8),
                        Text('$itemCount Item${itemCount > 1 ? 's' : ''} | ₹$totalPrice',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      ]),
                      const Text('View Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class _CanTile extends StatelessWidget {
  final CanOption option;
  final ValueChanged<int> onChanged;
  const _CanTile({required this.option, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: const Color(0xFFDCEBFF), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.local_drink_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${option.label} ${option.subLabel}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                Text('₹${option.price}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Row(
            children: [
              _stepBtn(Icons.remove, () => onChanged(option.qty > 0 ? option.qty - 1 : 0)),
              SizedBox(width: 28, child: Text('${option.qty}', textAlign: TextAlign.center)),
              _stepBtn(Icons.add, () => onChanged(option.qty + 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stepBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}
