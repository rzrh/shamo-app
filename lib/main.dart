import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cartpage.dart';
import 'package:shamo/pages/checkoutpage.dart';
import 'package:shamo/pages/checkoutsuccespage.dart';
import 'package:shamo/pages/detailchatpage.dart';
import 'package:shamo/pages/home/editprofile.dart';
import 'package:shamo/pages/home/mainpage.dart';
import 'package:shamo/pages/productpage.dart';
import 'package:shamo/pages/signinpage.dart';
import 'package:shamo/pages/signuppage.dart';
import 'package:shamo/pages/splashpage.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfile(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccess(),
        },
      ),
    );
  }
}

