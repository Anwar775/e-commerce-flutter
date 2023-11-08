
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstance = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("CheckOut Screen"),
        // actions: [ProductsAndPrice()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: classInstance.selectedProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(classInstance.selectedProduct[index].name),
                      subtitle: Text(
                          "\$ ${classInstance.selectedProduct[index].price} - ${classInstance.selectedProduct[index].Location}"),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            classInstance.selectedProduct[index].Path),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          classInstance.delete(classInstance.selectedProduct[index]);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            //   press button for pay
              const AlertDialog(
                title: Text("Success"),
                content: Text("Saved successfully"),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnPink),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Text(
              "Pay ${classInstance.price}",
              style: const TextStyle(fontSize: 19.0),
            ),
          ),
        ],
      ),
    );
  }
}
