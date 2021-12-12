import 'package:flutter/material.dart';
import 'package:pract3_2/common/theme.dart';
import 'package:pract3_2/models/cart.dart';
import 'package:pract3_2/models/catalog.dart';
import 'package:pract3_2/screens/cart.dart';
import 'package:pract3_2/screens/catalog.dart';
import 'package:pract3_2/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: const MyApp(),
        create: (context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
        providers: [
          // In this sample app, CatalogModel never changes, so a simple Provider
          // is sufficient.
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            },
          ),
          // ChangeNotifierProvider<ThemeProvider>(
          //   create: (context) {
          //     return ThemeProvider();
          //   },
          // ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Shopping app',
              theme: themeProvider.theme,
              initialRoute: '/',
              routes: {
                '/': (context) => const MyLogin(User()),
                '/catalog': (context) => const MyCatalog(),
                '/cart': (context) => const MyCart(),
              },
            );
          },
        ));
  }
}
