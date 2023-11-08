import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
    List selectedProduct = [];
    double price = 0;

    add(product)
    {
        selectedProduct.add(product);
        price += product.price.round();
        notifyListeners();
    //     to reload widgets
    }
    delete(product)
    {
        selectedProduct.remove(product);
        price -= product.price.round();
        notifyListeners();

        // rebuild method
    }
}