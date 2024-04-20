import 'package:flutter/material.dart';
import 'package:shoe_store_app_ui/pages/product_page.dart';
import 'package:shoe_store_app_ui/widgets/brand_button.dart';
import 'package:shoe_store_app_ui/widgets/product_card.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../data.dart';

import '../models/brand.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(
        context,
      ),
      bottomNavigationBar: _bottomNavigationBar(
        context,
      ),
    );
  }

  Widget _bottomNavigationBar(
    BuildContext context,
  ) {
    return WaterDropNavBar(
      backgroundColor: Colors.white,
      bottomPadding: MediaQuery.sizeOf(context).height * 0.02,
      waterDropColor: Theme.of(context).colorScheme.primary,
      selectedIndex: 0,
      onItemSelected: (index) {},
      barItems: [
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
          filledIcon: Icons.shopping_bag,
          outlinedIcon: Icons.shopping_bag_outlined,
        ),
        BarItem(
          filledIcon: Icons.notifications,
          outlinedIcon: Icons.notifications_outlined,
        ),
        BarItem(
          filledIcon: Icons.person,
          outlinedIcon: Icons.person_outline,
        ),
      ],
    );
  }

  Widget _buildUI(
    BuildContext context,
  ) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(
              context,
            ),
            _title(),
            _searchField(
              context,
            ),
            _categoriesList(
              context,
            ),
            _productsGrid(
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar(
    BuildContext context,
  ) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/150?img=62",
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Discover\n",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: "Get the best sneakers here",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField(
    BuildContext context,
  ) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.80,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your favorites",
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          Brand brand = brands[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: BrandButton(
              brand: brand,
              isSelected: index == 0,
            ),
          );
        },
      ),
    );
  }

  Widget _productsGrid(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            Product product = products[index];
            return ProductCard(
              product: product,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.02,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(
                        product: product,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
