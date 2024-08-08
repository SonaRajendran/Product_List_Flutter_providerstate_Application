import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

class ProductData extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      name: 'Women Casual Alley Soft Slim Fit westernwear',
      price: 29.99,
      // image:const AssetImage('assets/alley_soft.jpg'),
      imageUrl: 'assets/alleysoft.jpeg',
      description:
          ' Flannel is made from wool and also cotton so you know it has inherited those soft qualities. Fleece is another good soft synthetic fiber that makes excellent clothing. You can also go to faux fur as they will give natural fibers a run for their money. Of course, everyone will have their own opinion on which is the softest clothing material.',
    ),
    Product(
      name: 'Women stylish party wear',
      price: 39.99,
      imageUrl: 'assets/pattu_saree.jpg',
      description:
          'Kanchipuram Pattu sarees are woven with thread dipped in gold and silver, which makes them auspicious for any special occasion. From festivals to weddings, kanjivaram sarees are the automatic first choice. Regal and royal, a Kanchipuram Pattu saree is forever and can be styled in several ways.',
    ),
    Product(
      name: 'AlleySoft Slimfit Dresses',
      price: 39.99,
      imageUrl: 'assets/samsung_gallexy.jpg',
      description:
          'Buy your Samsung favourites at unbelievable offers and benefits, exclusive for corporates! Shop at the Samsung Corporate Plus for exclusive deals and benefits like never before!',
    ),
    // Add more products as needed
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ProductData(),
        child: const ProductList(),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('product List'),
      ),
      body: ListView.builder(
        itemCount: productData.products.length,
        itemBuilder: (context, index) {
          final product = productData.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${product.price}'),
                const SizedBox(
                    height: 5), // Space between price and description
                Text(product.description,
                    style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            leading: Image.asset(
              product.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              // Handle product tap
            },
          );
        },
      ),
    );
  }
}


/*
class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: productData.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(productData.products[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(product: productData.products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

*/
/*
class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Price: \$${product.price}',
              style: const TextStyle(fontSize: 20.0),
            ),
            Image.asset(
              product.imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/