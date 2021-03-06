import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pract3_2/models/user.dart';
import 'package:provider/provider.dart';
import 'package:pract3_2/models/cart.dart';
import 'package:pract3_2/models/catalog.dart';
import 'package:pract3_2/screens/catalog.dart';
import 'package:pract3_2/screens/login.dart';

void main() {
  testWidgets('Login page Widget test', (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart!.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(User()),
          '/catalog': (context) => const MyCatalog(),
        },
      ),
    ));

    // Verifying the behaviour of ENTER button.
    await tester.tap(find.text('ENTER'));
    await tester.pumpAndSettle();

    expect(find.text('Catalog'), findsOneWidget);
  });
}
