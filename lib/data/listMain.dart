import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Opsi {Home, Cart, Profile}

Map<Opsi, IconData> opsiIcon = {
    Opsi.Home: Icons.home,
    Opsi.Cart: Icons.shopping_cart,
    Opsi.Profile: Icons.person,
  };
