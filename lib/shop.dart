import 'package:flutter/material.dart';
import 'package:flutter_application/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/cart_provider.dart';
import 'package:flutter_application/product.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Fresh Bananas (1kg)',
      price: 80.0,
      vendor: 'Local Farm Produce',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    ),
    Product(
      id: '2',
      name: 'Premium Rice (5kg)',
      price: 350.0,
      vendor: 'Golden Harvest',
      imageUrl:
          'https://media.istockphoto.com/id/519309790/photo/pile-of-raw-basmati-rice-with-a-spoon.jpg?s=612x612&w=0&k=20&c=A9A87HykypkOo5qLMQm6bZjBQn83NE1NHMppw8-6Tnc=',
    ),
    Product(
      id: '3',
      name: 'Fresh Tomatoes (1kg)',
      price: 120.0,
      vendor: 'Farm Fresh Market',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
    ),
    Product(
      id: '4',
      name: 'Whole Chicken (1kg)',
      price: 180.0,
      vendor: 'San Miguel Foods',
      imageUrl:
          'https://smmarkets.ph/media/catalog/product/2/0/2006584_magnolia_fresh_chilled_whole_chicken_800g-1200g.jpg',
    ),
    Product(
      id: '5',
      name: 'Fresh Milk (1L)',
      price: 90.0,
      vendor: 'Alpine Dairy',
      imageUrl:
          'https://ever.ph/cdn/shop/files/100000092176-Selecta-Farm-Fresh-Milk-Family-Pack-1L-230221_c9905ea0-8dcb-4d8b-aebf-0bcdaa99e712.jpg?v=1745917514',
    ),
    Product(
      id: '6',
      name: 'Eggs (1 Dozen)',
      price: 95.0,
      vendor: 'Happy Hen Farms',
      imageUrl:
          'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTA5L3Jhd3BpeGVsX29mZmljZV80OF9waG90b19vZl9hX2Jhc2tldF9vZl9jaGlja2VuX2VnZ3NfaXNvbGF0ZWRfd18wY2ZjN2Y5MS1jOWZkLTQwNGMtYWEzYy1iYWMyNTZmNmIxMmMucG5n.png',
    ),
    Product(
      id: '7',
      name: 'Loaf Bread (450g)',
      price: 60.0,
      vendor: 'Gardenia',
      imageUrl:
          'https://www.magicstarsupermarket.com/cdn/shop/products/Gardenia_Bread_Classic_600g_800x_94f13366-2c91-4159-898d-f189af1fa27d_300x300.png?v=1590462305',
    ),
    Product(
      id: '8',
      name: 'Instant Noodles (Pack of 5)',
      price: 65.0,
      vendor: 'Lucky Me!',
      imageUrl:
          'https://zbga.shopsuki.ph/cdn/shop/files/102057508_1024x.jpg?v=1730279847',
    ),
    Product(
      id: '9',
      name: 'Cooking Oil (1L)',
      price: 140.0,
      vendor: 'Minola Cooking Oil',
      imageUrl:
          'https://png.pngtree.com/png-vector/20231023/ourmid/pngtree-cooking-oils-isolated-on-white-with-png-image_10297524.png',
    ),
    Product(
      id: '10',
      name: 'Canned Tuna (175g)',
      price: 55.0,
      vendor: 'Century Tuna',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnR0iNeklHWPocf5qsLFHw6L9wdflszxq5sQ&s',
    ),
  ];

  final Set<String> favoriteProducts = {};

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grocery'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 0, 0), Color.fromARGB(255, 255, 0, 0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 206, 76, 76),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Groceries',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text('Default'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text('A-Z'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final quantityInCart =
                      cart.items[product.id]?.quantity ?? 0;
                  final isFavorite = favoriteProducts.contains(product.id);

                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 255, 32, 32),
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text('₱ ${product.price.toStringAsFixed(2)}'),
                                Text(product.vendor),
                                if (quantityInCart > 0)
                                  Text(
                                    'In cart: $quantityInCart',
                                    style:
                                        const TextStyle(color: Colors.green),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoriteProducts.remove(product.id);
                                    } else {
                                      favoriteProducts.add(product.id);
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cart.addItem(product);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
