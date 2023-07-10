import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

const String manLookRightImageUrl =
    'https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/22176000/2023/5/3/6e4142e9-081c-4e3e-b6ef-8629593177771683117150699-United-Colors-of-Benetton-Men-Tshirts-1461683117150342-1.jpg';
const String dogImageUrl =
    'https://img.freepik.com/premium-photo/dog-with-blue-background-that-says-golden-retriever-its-paws_899870-16167.jpg';
const String womanLookLeftImageUrl =
    'https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/16712782/2022/4/14/2afbbc41-329f-4850-8aee-00dccdf641851649922896889-Indo-Era-Solid-Wine-Straight-Kurta-Palazzo-With-Dupatta-Set--1.jpg';

Cart cart = Cart();

class SimpleEcommerce extends StatelessWidget {
  const SimpleEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) => const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String searchString;
  @override
  void initState() {
    searchString = '';
    super.initState();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty) {
      searchResultTiles = products
          .where(
              (p) => p.name.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (p) => ProductTile(product: p),
          )
          .toList();
    }
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: SearchBar(onChanged: setSearchString),
        actions: const [CartAppBarAction()],
      ),
      body: searchString.isNotEmpty
          ? GridView.count(
              padding: listViewPadding,
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: .7,
              children: searchResultTiles,
            )
          : ListView(
              padding: listViewPadding,
              children: [
                Text(
                  'Shop by Category',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: manLookRightImageUrl,
                  category: mensCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: womanLookLeftImageUrl,
                  category: womensCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: dogImageUrl,
                  category: petsCategory,
                ),
              ],
            ),
    );
  }
}

class CartAppBarAction extends StatefulWidget {
  const CartAppBarAction({Key? key}) : super(key: key);

  @override
  State<CartAppBarAction> createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {
  @override
  void initState() {
    cart.addListener(blankSetState);
    super.initState();
  }

  @override
  void dispose() {
    cart.removeListener(blankSetState);
    super.dispose();
  }

  void blankSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.shopping_cart, size: 30),
          if (cart.itemsInCart.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Text(
                        cart.itemsInCart.length.toString(),
                        style: const TextStyle(fontSize: 10, color: kWhite),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      onPressed: () => _pushScreen(
        context: context,
        screen: const CartScreen(),
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagePreviews = product.imageUrls
        .map(
          (url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(url),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == url
                      ? Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.75)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  url,
                ),
              ),
            ),
          ),
        )
        .toList();

    List<Widget> sizeSelectionWidgets = product.sizes
            ?.map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setSelectedSize(s);
                  },
                  child: Container(
                    height: 42,
                    width: 38,
                    decoration: BoxDecoration(
                      color: selectedSize == s
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      border: Border.all(
                        color: Colors.grey[350]!,
                        width: 1.25,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        s,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: selectedSize == s ? Colors.white : null),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: kGreyBackground,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    selectedImageUrl!,
                    fit: BoxFit.cover,
                    color: kGreyBackground,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePreviews,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${product.cost}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (sizeSelectionWidgets.isNotEmpty) ...[
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: sizeSelectionWidgets,
                    ),
                  ],
                  const Spacer(),
                  Center(
                    child: CallToActionButton(
                      onPressed: () => cart.add(
                        OrderItem(
                          product: product,
                          selectedSize: selectedSize,
                        ),
                      ),
                      labelText: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {required this.onPressed,
      required this.labelText,
      this.minSize = const Size(double.infinity, 45),
      Key? key})
      : super(key: key);
  final Function onPressed;
  final String labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(
        labelText,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key}) : super(key: key);
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category.selections
        .map((s) => ProductRow(
              productType: s,
              products: _products
                  .where((p) => p.productType.toLowerCase() == s.toLowerCase())
                  .toList(),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        itemCount: productRows.length,
        itemBuilder: (_, index) => productRows[index],
        separatorBuilder: (_, index) => const SizedBox(height: 18),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, required this.productType, Key? key})
      : super(key: key);
  final String productType;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles =
        products.map((p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  productType,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => productTiles[index],
                  separatorBuilder: (_, index) => const SizedBox(width: 24),
                ),
              ),
            ],
          );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        _pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              '\$${product.cost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: kGreyBackground),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = cart.itemsInCart
        .map(
          (item) => Row(
            children: [
              SizedBox(
                width: 125,
                child: ProductImage(
                  product: item.product,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${item.product.cost}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed: () => cart.remove(item),
                // color: Colors.red,
              )
            ],
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cart'),
            Text(
              '${cart.itemsInCart.length} items',
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => const SizedBox(height: 16),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Text('Your cart is empty'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$${cart.totalCost.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .merge(textStyleHeading),
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: 'Check Out',
                  minSize: const Size(240, 45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.imageUrl,
      this.imageAlignment = Alignment.center,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final Category category;

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pushScreen(
        context: context,
        screen: CategoryScreen(
          category: category,
        ),
      ),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onChanged, Key? key}) : super(key: key);

  final Function(String) onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: _textEditingController,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        isDense: true,
        contentPadding:
            kIsWeb ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
        prefixIconConstraints:
            const BoxConstraints(minHeight: 36, minWidth: 36),
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search for a product',
        suffixIconConstraints:
            const BoxConstraints(minHeight: 36, minWidth: 36),
        suffixIcon: IconButton(
          constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
          splashRadius: 24,
          icon: const Icon(Icons.clear),
          onPressed: () {
            _textEditingController.clear();
            widget.onChanged(_textEditingController.text);
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}

void _pushScreen({required BuildContext context, required Widget screen}) {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final List<String>? sizes;

  /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
  final Category category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      this.sizes,
      required this.category,
      required this.productType});
}

class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    // print(orderItem.product.name);
    itemsInCart.remove(orderItem);
    // print(t);
    notifyListeners();
  }
}

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}

Category mensCategory = Category(title: 'Men', selections: [
  'Shirts',
  'Jeans',
  'Shorts',
]);
Category womensCategory = Category(title: 'Women', selections: [
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'Pets', selections: [
  'Toys',
  'Treats',
]);

final kGreyBackground = Colors.grey[200];

List<Product> products = [
  Product(
      name: '2-Pack Crewneck T-Shirts - Black',
      imageUrls: [
        'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/71UqhKT2MDL._AC_UX466_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/81K7OAepB9L._AC_UX466_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/812T%2Bu00R4L._AC_UX466_.jpg'
      ],
      cost: 12.99,
      category: mensCategory,
      productType: 'shirts',
      sizes: ['S', 'M', 'L', 'XL']),
  Product(
    name: 'Short Sleeve Henley - Blue',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg'
    ],
    cost: 17.99,
    category: mensCategory,
    productType: 'shirts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Polo RL V-Neck',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL._AC_UX522_.jpg',
    ],
    cost: 24.99,
    category: mensCategory,
    productType: 'shirts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Athletic-Fit Stretch Jeans',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL._AC_UX522_.jpg',
    ],
    cost: 29.99,
    category: mensCategory,
    productType: 'jeans',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Original Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL._AC_UX522_.jpg',
    ],
    cost: 39.99,
    category: mensCategory,
    productType: 'jeans',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '2-Pack Performance Shorts',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg',
    ],
    cost: 19.99,
    category: mensCategory,
    productType: 'shorts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Cargo Shorts",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg',
    ],
    cost: 29.99,
    category: mensCategory,
    productType: 'shorts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '2-Pack Short-Sleeve Crewneck',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81LDpImWPAL._AC_UX522_.jpg',
    ],
    cost: 16.99,
    category: womensCategory,
    productType: 'shirts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Waffle Knit Tunic Blouse',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg',
    ],
    cost: 22.99,
    category: womensCategory,
    productType: 'shirts',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Mid-Rise Skinny Jeans',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/71canaWSlAL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71zLzCwbXUL._AC_UX522_.jpg',
    ],
    cost: 28.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Straight 505 Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's 715 Bootcut Jeans",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '3-Pack - Squeaky Plush Dog Toy',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg',
    ],
    cost: 9.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Wobble Wag Giggle Ball',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg',
    ],
    cost: 11.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Duck Hide Twists',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg',
    ],
    cost: 8.99,
    category: petsCategory,
    productType: 'treats',
  ),
  Product(
    name: "Zuke's Mini Training Treats",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg',
    ],
    cost: 10.99,
    category: petsCategory,
    productType: 'treats',
  ),
];
