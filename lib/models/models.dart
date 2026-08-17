xclass Seller {
  final String name;
  final double rating;
  final int reviews;
  final String eta;
  final String distance;
  const Seller({
    required this.name,
    required this.rating,
    required this.reviews,
    required this.eta,
    required this.distance,
  });
}

const List<Seller> popularSellers = [
  Seller(name: 'Aqua Fresh Water', rating: 4.6, reviews: 120, eta: '20-30 mins', distance: '1.2 km'),
  Seller(name: 'Crystal Clear', rating: 4.5, reviews: 98, eta: '25-35 mins', distance: '1.8 km'),
  Seller(name: 'Pure Life Water', rating: 4.3, reviews: 76, eta: '20-25 mins', distance: '2.0 km'),
];

class CanOption {
  final String label;
  final String subLabel;
  final int price;
  int qty;
  CanOption({required this.label, required this.subLabel, required this.price, this.qty = 0});
}

List<CanOption> defaultCanOptions() => [
      CanOption(label: '20L Water Can', subLabel: '(One Time)', price: 40, qty: 1),
      CanOption(label: '20L Water Can', subLabel: '(With Can Exchange)', price: 30),
      CanOption(label: '25L Water Can', subLabel: '(One Time)', price: 50),
      CanOption(label: '10L Water Can', subLabel: '(One Time)', price: 20),
    ];

class TrackingStep {
  final String title;
  final String time;
  final bool done;
  const TrackingStep({required this.title, required this.time, required this.done});
}
