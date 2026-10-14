import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const OnTheHorseApp());
}

const _ink = Color(0xFF101411);
const _panel = Color(0xFF1B211D);
const _gold = Color(0xFFD6B36A);
const _mutedGold = Color(0xFF9D8350);
const _whatsAppNumber = '201036994744';

Uri buildWhatsAppOrderUri(String message) =>
    Uri.https('wa.me', '/$_whatsAppNumber', {'text': message});

class OnTheHorseApp extends StatelessWidget {
  const OnTheHorseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On The Horse Cafeteria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _ink,
        colorScheme: const ColorScheme.dark(
          primary: _gold,
          secondary: _gold,
          surface: _panel,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: _ink,
          foregroundColor: _gold,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _panel,
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.45)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: _gold),
          ),
        ),
      ),
      home: const CafeHomePage(),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
  });

  final String name;
  final String category;
  final int price;
  final IconData icon;

  String get arabicName {
    final translatedName = _arabicMenuNames[name];
    if (translatedName == null) {
      throw StateError('Missing Arabic menu name for "$name".');
    }
    return translatedName;
  }
}

const _arabicMenuNames = <String, String>{
  'Fries': 'بطاطس',
  'Burger': 'برجر',
  'Strips': 'ستربس',
  'Double Burger': 'برجر دبل',
  'Burger + Fries + Soft Drink': 'برجر + بطاطس + مشروب غازي',
  'Strips + Fries + Soft Drink': 'ستربس + بطاطس + مشروب غازي',
  '2 Burgers + 2 Strips + 2 Fries + Soft Drinks':
      '٢ برجر + ٢ ستربس + ٢ بطاطس + مشروبات غازية',
  'Orange Juice': 'عصير برتقال',
  'Banana with Milk': 'موز باللبن',
  'Lemon': 'ليمون',
  'Lemon Mint': 'ليمون بالنعناع',
  'Watermelon': 'بطيخ',
  'Mango': 'مانجو',
  'Strawberry': 'فراولة',
  'Karkadeh': 'كركديه',
  'Sunshine': 'صن شاين',
  'Mojito': 'موهيتو',
  'Passion Fruit': 'باشون فروت',
  'Mixed Soda': 'ميكس صودا',
  'Sun Rina': 'صن رينا',
  'Iced Latte': 'آيس لاتيه',
  'Latte': 'لاتيه',
  'Iced Chocolate': 'آيس شوكولاتة',
  'Iced Caramel Latte': 'آيس كراميل لاتيه',
  'Red Tea': 'شاي أحمر',
  'Green Tea': 'شاي أخضر',
  'Nescafe Black': 'نسكافيه بلاك',
  'Mint': 'نعناع',
  'Anise': 'ينسون',
  'Coffee Mix': 'كوفي ميكس',
  'Cappuccino': 'كابتشينو',
  'Cappuccino (Double)': 'كابتشينو دبل',
  'Latte (Double)': 'لاتيه دبل',
  'Turkish Coffee': 'قهوة تركي',
  'Turkish Coffee (Double)': 'قهوة تركي دبل',
  'French Coffee': 'قهوة فرنساوي',
  'French Coffee (Double)': 'قهوة فرنساوي دبل',
  'Espresso': 'إسبريسو',
  'Espresso (Double)': 'إسبريسو دبل',
  'Hot Chocolate': 'هوت شوكولاتة',
  'Nescafe 3in1': 'نسكافيه ٣ في ١',
  'Nutella Waffle': 'وافل نوتيلا',
  'White Waffle': 'وافل وايت',
  'Oreo Waffle': 'وافل أوريو',
  'Hohos Waffle': 'وافل هوهوز',
  'Mix Waffle': 'وافل ميكس',
  'Watermelon Smoothie': 'سموذي بطيخ',
  'Strawberry Smoothie': 'سموذي فراولة',
  'Banana Smoothie': 'سموذي موز',
  'Lemon Smoothie': 'سموذي ليمون',
  'Blueberry Smoothie': 'سموذي بلوبيري',
  'Mango Smoothie': 'سموذي مانجو',
  'Strawberry Passion Fruit Smoothie': 'سموذي باشون فراولة',
  '7UP': 'سفن أب',
  'Pepsi': 'بيبسي',
  'Pepsi Diet': 'بيبسي دايت',
  'Mirinda': 'ميرندا',
};

const _menuItems = <MenuItem>[
  MenuItem(name: 'Fries', category: 'Sandwiches', price: 50, icon: Icons.tapas),
  MenuItem(
    name: 'Burger',
    category: 'Sandwiches',
    price: 95,
    icon: Icons.lunch_dining,
  ),
  MenuItem(
    name: 'Strips',
    category: 'Sandwiches',
    price: 95,
    icon: Icons.set_meal,
  ),
  MenuItem(
    name: 'Double Burger',
    category: 'Sandwiches',
    price: 185,
    icon: Icons.lunch_dining,
  ),
  MenuItem(
    name: 'Burger + Fries + Soft Drink',
    category: 'Meals',
    price: 145,
    icon: Icons.restaurant,
  ),
  MenuItem(
    name: 'Strips + Fries + Soft Drink',
    category: 'Meals',
    price: 150,
    icon: Icons.restaurant,
  ),
  MenuItem(
    name: '2 Burgers + 2 Strips + 2 Fries + Soft Drinks',
    category: 'Meals',
    price: 439,
    icon: Icons.dinner_dining,
  ),
  MenuItem(
    name: 'Orange Juice',
    category: 'Fresh Juices',
    price: 55,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Banana with Milk',
    category: 'Fresh Juices',
    price: 60,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Lemon',
    category: 'Fresh Juices',
    price: 55,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Lemon Mint',
    category: 'Fresh Juices',
    price: 55,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Watermelon',
    category: 'Fresh Juices',
    price: 60,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Mango',
    category: 'Fresh Juices',
    price: 65,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Strawberry',
    category: 'Fresh Juices',
    price: 65,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Karkadeh',
    category: 'Fresh Juices',
    price: 25,
    icon: Icons.local_drink,
  ),
  MenuItem(
    name: 'Sunshine',
    category: 'Soda',
    price: 60,
    icon: Icons.bubble_chart,
  ),
  MenuItem(
    name: 'Mojito',
    category: 'Soda',
    price: 50,
    icon: Icons.bubble_chart,
  ),
  MenuItem(
    name: 'Passion Fruit',
    category: 'Soda',
    price: 55,
    icon: Icons.bubble_chart,
  ),
  MenuItem(
    name: 'Mixed Soda',
    category: 'Soda',
    price: 70,
    icon: Icons.bubble_chart,
  ),
  MenuItem(
    name: 'Sun Rina',
    category: 'Soda',
    price: 60,
    icon: Icons.bubble_chart,
  ),
  MenuItem(
    name: 'Iced Latte',
    category: 'Coffee & More',
    price: 60,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Latte',
    category: 'Coffee & More',
    price: 70,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Iced Chocolate',
    category: 'Coffee & More',
    price: 65,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Iced Caramel Latte',
    category: 'Coffee & More',
    price: 65,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Red Tea',
    category: 'Hot Drinks',
    price: 10,
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Green Tea',
    category: 'Hot Drinks',
    price: 10,
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Nescafe Black',
    category: 'Hot Drinks',
    price: 30,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Mint',
    category: 'Hot Drinks',
    price: 10,
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Anise',
    category: 'Hot Drinks',
    price: 10,
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Karkadeh',
    category: 'Hot Drinks',
    price: 10,
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Coffee Mix',
    category: 'Hot Drinks',
    price: 35,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Cappuccino',
    category: 'Hot Drinks',
    price: 55,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Cappuccino (Double)',
    category: 'Hot Drinks',
    price: 70,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Latte',
    category: 'Hot Drinks',
    price: 55,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Latte (Double)',
    category: 'Hot Drinks',
    price: 65,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Turkish Coffee',
    category: 'Hot Drinks',
    price: 25,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Turkish Coffee (Double)',
    category: 'Hot Drinks',
    price: 50,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'French Coffee',
    category: 'Hot Drinks',
    price: 40,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'French Coffee (Double)',
    category: 'Hot Drinks',
    price: 60,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Espresso',
    category: 'Hot Drinks',
    price: 40,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Espresso (Double)',
    category: 'Hot Drinks',
    price: 60,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Hot Chocolate',
    category: 'Hot Drinks',
    price: 55,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Nescafe 3in1',
    category: 'Hot Drinks',
    price: 40,
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Nutella Waffle',
    category: 'Waffles',
    price: 65,
    icon: Icons.breakfast_dining,
  ),
  MenuItem(
    name: 'White Waffle',
    category: 'Waffles',
    price: 65,
    icon: Icons.breakfast_dining,
  ),
  MenuItem(
    name: 'Oreo Waffle',
    category: 'Waffles',
    price: 70,
    icon: Icons.breakfast_dining,
  ),
  MenuItem(
    name: 'Hohos Waffle',
    category: 'Waffles',
    price: 70,
    icon: Icons.breakfast_dining,
  ),
  MenuItem(
    name: 'Mix Waffle',
    category: 'Waffles',
    price: 80,
    icon: Icons.breakfast_dining,
  ),
  MenuItem(
    name: 'Watermelon Smoothie',
    category: 'Smoothies',
    price: 65,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Strawberry Smoothie',
    category: 'Smoothies',
    price: 65,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Banana Smoothie',
    category: 'Smoothies',
    price: 60,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Lemon Smoothie',
    category: 'Smoothies',
    price: 55,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Blueberry Smoothie',
    category: 'Smoothies',
    price: 65,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Mango Smoothie',
    category: 'Smoothies',
    price: 70,
    icon: Icons.blender,
  ),
  MenuItem(
    name: 'Strawberry Passion Fruit Smoothie',
    category: 'Smoothies',
    price: 60,
    icon: Icons.blender,
  ),
  MenuItem(name: '7UP', category: 'Soft Drinks', price: 25, icon: Icons.liquor),
  MenuItem(
    name: 'Pepsi',
    category: 'Soft Drinks',
    price: 25,
    icon: Icons.liquor,
  ),
  MenuItem(
    name: 'Pepsi Diet',
    category: 'Soft Drinks',
    price: 25,
    icon: Icons.liquor,
  ),
  MenuItem(
    name: 'Mirinda',
    category: 'Soft Drinks',
    price: 25,
    icon: Icons.liquor,
  ),
];

MenuItem? findMenuItem(String name) {
  for (final item in _menuItems) {
    if (item.name == name) return item;
  }
  return null;
}

List<MenuItem> get cafeMenuItems => _menuItems;

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({super.key});

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  final Map<String, int> _cart = {};
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        showDialog<void>(
          context: context,
          builder: (_) => const CafeWelcomeDialog(),
        );
      }
    });
  }

  List<String> get _categories => [
    'All',
    ..._menuItems.map((item) => item.category).toSet(),
  ];

  List<MenuItem> get _visibleItems => _menuItems
      .where(
        (item) =>
            _selectedCategory == 'All' || item.category == _selectedCategory,
      )
      .toList();

  int get _cartCount => _cart.values.fold(0, (sum, count) => sum + count);

  int get _cartTotal => _menuItems.fold(
    0,
    (sum, item) => sum + item.price * (_cart[item.name] ?? 0),
  );

  void _changeQuantity(MenuItem item, int change) {
    setState(() {
      final quantity = (_cart[item.name] ?? 0) + change;
      if (quantity <= 0) {
        _cart.remove(item.name);
      } else {
        _cart[item.name] = quantity;
      }
    });
  }

  void _openCheckout() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: _ink,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final lines = _menuItems
            .where((item) => (_cart[item.name] ?? 0) > 0)
            .map((item) => (item: item, quantity: _cart[item.name]!))
            .toList();
        return CheckoutSheet(lines: lines, total: _cartTotal);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ON THE HORSE',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 2.3,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Your order',
            onPressed: _cartCount == 0 ? null : _openCheckout,
            icon: Badge(
              isLabelVisible: _cartCount > 0,
              label: Text('$_cartCount'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          const _WelcomeBanner(),
          SizedBox(
            height: 58,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final selected = _selectedCategory == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  showCheckmark: false,
                  selectedColor: _gold,
                  backgroundColor: _panel,
                  labelStyle: TextStyle(
                    color: selected ? _ink : Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) {
                    setState(() => _selectedCategory = category);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 7, 20, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedCategory == 'All'
                        ? 'OUR MENU'
                        : _selectedCategory.toUpperCase(),
                    style: const TextStyle(
                      color: _gold,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
                Text(
                  '${_visibleItems.length} items',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: _visibleItems.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = _visibleItems[index];
                return _MenuItemCard(
                  item: item,
                  quantity: _cart[item.name] ?? 0,
                  onAdd: () => _changeQuantity(item, 1),
                  onRemove: () => _changeQuantity(item, -1),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _cartCount == 0
          ? null
          : SafeArea(
              minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: FilledButton(
                onPressed: _openCheckout,
                style: FilledButton.styleFrom(
                  backgroundColor: _gold,
                  foregroundColor: _ink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_bag_outlined),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '$_cartCount ${_cartCount == 1 ? 'item' : 'items'}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      'EGP $_cartTotal  ·  Checkout',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CafeWelcomeDialog extends StatelessWidget {
  const CafeWelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/cafeteria-brand.jpg',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
              alignment: const Alignment(0, -0.1),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            'CAFETERIA · COFFEE · EQUESTRIAN LOUNGE',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.65),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'On The Horse Cafeteria',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(
          key: const Key('welcome-enter-menu'),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Explore the menu'),
        ),
      ],
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  const _WelcomeBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166,
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 2),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _mutedGold.withValues(alpha: 0.7)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/cafeteria-brand.jpg',
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.15),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _ink.withValues(alpha: 0.18),
                  _ink.withValues(alpha: 0.86),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Welcome to On The Horse',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.schedule, color: _gold, size: 15),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Cafeteria · Coffee · Equestrian Lounge  |  7 AM – 9 PM',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  const _MenuItemCard({
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final MenuItem item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
      decoration: BoxDecoration(
        color: _panel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.045)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(item.icon, color: _gold, size: 23),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 7,
                  runSpacing: 2,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        item.arabicName,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'EGP ${item.price}',
                  style: const TextStyle(
                    color: _gold,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (quantity == 0)
            IconButton.filledTonal(
              tooltip: 'Add ${item.name}',
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 20),
              style: IconButton.styleFrom(
                foregroundColor: _ink,
                backgroundColor: _gold,
              ),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _QuantityButton(
                  label: 'Remove one ${item.name}',
                  icon: Icons.remove,
                  onPressed: onRemove,
                ),
                SizedBox(
                  width: 27,
                  child: Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                _QuantityButton(
                  label: 'Add one ${item.name}',
                  icon: Icons.add,
                  onPressed: onAdd,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: label,
      visualDensity: VisualDensity.compact,
      onPressed: onPressed,
      icon: Icon(icon, color: _gold, size: 19),
    );
  }
}

class CheckoutSheet extends StatefulWidget {
  const CheckoutSheet({super.key, required this.lines, required this.total});

  final List<({MenuItem item, int quantity})> lines;
  final int total;

  @override
  State<CheckoutSheet> createState() => _CheckoutSheetState();
}

class _CheckoutSheetState extends State<CheckoutSheet> {
  final _customerController = TextEditingController();
  final _notesController = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _customerController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _orderSummary() {
    final buffer = StringBuffer()
      ..writeln('*On The Horse Cafeteria — Order*')
      ..writeln('Order time: ${DateTime.now().toLocal()}')
      ..writeln(
        'Customer: ${_customerController.text.trim().isEmpty ? 'Guest' : _customerController.text.trim()}',
      )
      ..writeln()
      ..writeln('*Items*');
    for (final line in widget.lines) {
      buffer.writeln(
        '• ${line.quantity} × ${line.item.name} (${line.item.arabicName}) — EGP ${line.quantity * line.item.price}',
      );
    }
    buffer
      ..writeln()
      ..writeln('*Total: EGP ${widget.total}*');
    final notes = _notesController.text.trim();
    if (notes.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('Notes: $notes');
    }
    buffer.writeln('\nPlease confirm this order. Thank you!');
    return buffer.toString();
  }

  Future<void> _sendOrder() async {
    setState(() => _sending = true);
    final uri = buildWhatsAppOrderUri(_orderSummary());
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!mounted) return;
    setState(() => _sending = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          opened
              ? 'WhatsApp opened. Tap Send to place your order.'
              : 'Could not open WhatsApp. Check that WhatsApp is installed and try again.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Review your order',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ...widget.lines.map(
              (line) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${line.quantity} × ${line.item.name} (${line.item.arabicName})',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                    Text(
                      'EGP ${line.quantity * line.item.price}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 24, color: Colors.white24),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Total',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  'EGP ${widget.total}',
                  style: const TextStyle(
                    fontSize: 17,
                    color: _gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _customerController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Your name (optional)',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _notesController,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Order notes (optional)',
                prefixIcon: Icon(Icons.notes),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _sending ? null : _sendOrder,
                icon: _sending
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chat),
                label: Text(
                  _sending ? 'Opening WhatsApp…' : 'Send order on WhatsApp',
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                'WhatsApp will open with your order ready to send.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.55),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
