import 'package:e_commerce_shop_app/pages/cart_page.dart';
import 'package:e_commerce_shop_app/pages/favourite_page.dart';
import 'package:e_commerce_shop_app/pages/home_page.dart';
import 'package:e_commerce_shop_app/pages/order_history_page.dart';
import 'package:line_icons/line_icons.dart';

List sideMenuItems = [
  {
    "label": "Home",
    "selected": true,
    "icon": LineIcons.home,
    "page": HomePage()
  },
  {
    "label": "My Cart",
    "selected": false,
    "icon": LineIcons.shoppingCart,
    "page": CartPage()
  },
  {
    "label": "Favourite",
    "selected": false,
    "icon": LineIcons.heart,
    "page": FavouritePage()
  },
  {
    "label": "Orders",
    "selected": false,
    "icon": LineIcons.history,
    "page": OrderHistoryPage()
  },
];
