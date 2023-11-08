import 'package:e_commerce/auth/login.dart';
import 'package:e_commerce/model/item.dart';
import 'package:e_commerce/pages/About_Screen.dart';
import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/pages/details_screen.dart';
import 'package:e_commerce/pages/settings.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/shared/appbar.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Make this class in other folder
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 22),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Details(product: items[index], price: items[index]),
                  ),
                );
              },
              child: GridTile(
                footer: GridTileBar(
                  trailing: Consumer<Cart>(
                    builder: (context, classInstance, child) {
                      return IconButton(
                          color: const Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            classInstance.add(items[index]);
                          },
                          icon: const Icon(Icons.add));
                    },
                  ),
                  leading: Text("${items[index].price}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  title: const Text(""),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // top: -3,
                      // bottom: -9,
                      // height: 0,
                      // left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset("${items[index].Path}"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // backgroundColor: appbarGreen,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  // DrawerHeaderImage
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.jpg"),
                        fit: BoxFit.cover),
                  ),
                  accountName: Text(
                    "Anwar Khaled Ali",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  accountEmail: Text("anweralsanabni@gmail.com"),
                  currentAccountPictureSize: Size.square(99),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    // profile
                    backgroundImage: AssetImage("images/background.jpg"),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("My Product"),
                  leading: const Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckOut()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {
                  //   About Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutScreen()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Settings"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                  //   Logout
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ],
            ),
            const Text(
              "Developed By Anwar Khaled © 2023",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Consumer<Cart>(
          builder: (context, classInstance, child) {
            // ${classInstance.SelectedProduct}
            return const Text("Home");
          },
        ),
        backgroundColor: appbarGreen,
        actions: [
          Consumer<Cart>(builder: (context, classInstance, child) {
          //   Row() was Here
           return const ProductsAndPrice();
          },),
        ],
      ),
    );
  }
}
