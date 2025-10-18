import 'package:flutter/material.dart';
import 'package:flutter_application/app_drawer.dart';

class Newsstand extends StatefulWidget {
  const Newsstand({super.key});

  @override
  State<Newsstand> createState() => _NewsstandState();
}

class _NewsstandState extends State<Newsstand> {
 @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final List<String> categories =
        args?['categories'] ?? ['No grocery categories available'];

    final Map<String, String> descriptions = {
      'Fresh Produce': 'Shop the freshest fruits and vegetables, picked daily.',
      'Dairy & Eggs': 'Milk, cheese, yogurt, and eggs from trusted brands.',
      'Bakery': 'Enjoy freshly baked bread, pastries, and cakes.',
      'Beverages': 'Juices, coffee, tea, and soft drinks to keep you refreshed.',
      'Snacks & Chips': 'Tasty treats for your movie nights or quick cravings.',
      'Frozen Goods': 'Frozen meats, seafood, and ready-to-eat meals.',
      'Household Essentials': 'Cleaning products and daily household supplies.',
      'Health & Beauty': 'Personal care items, vitamins, and wellness essentials.',
    };

    final Map<String, IconData> icons = {
      'Fresh Produce': Icons.eco,
      'Dairy & Eggs': Icons.local_drink,
      'Bakery': Icons.bakery_dining,
      'Beverages': Icons.local_cafe,
      'Snacks & Chips': Icons.fastfood,
      'Frozen Goods': Icons.ac_unit,
      'Household Essentials': Icons.cleaning_services,
      'Health & Beauty': Icons.health_and_safety,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery Stand',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Grocery Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('< Back'),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final title = categories[index];
                final description =
                    descriptions[title] ?? 'No description available';
                final icon = icons[title] ?? Icons.shopping_bag;

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xFFFFE5E5),
                        child: Icon(icon, size: 30, color: Colors.redAccent),
                      ),
                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Explore',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}