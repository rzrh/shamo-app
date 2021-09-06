
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/cart_card.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget EmptyCart(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/CartPage_Icon.png', width: 79, height: 69,),
            SizedBox(height: 20,),
            Text('Opps! Your Cart is Empty', style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: Medium
            ),),
            SizedBox(height: 12,),
            Text('Let\'s find your favorite shoes', style: SecondaryTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 14
            ),),
            SizedBox(height: 20,),
            Container(
              width: 152,
              height: 44,
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Text('Explore Store', style: PrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: Medium
                ),),
              ),
            )
          ],
        ),
      );
    }

    Widget Content(){
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: cartProvider.carts.map((cart) => CartCard(cart)).toList()
      );
    }

    Widget CustomButtonNav(){
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Subtotal', style: PrimaryTextStyle.copyWith(
                     fontWeight: Regular,
                     fontSize: 14
                   ),),
                   Text('\$${cartProvider.totalPrice()}', style: PriceTextStle.copyWith(
                     fontSize: 16,
                     fontWeight: SemiBold
                   ),),
                ],
              ),
            ),
            SizedBox(height: 30,),
             Divider(
                     thickness: 1,
                     color: SubtitleTextColor,
                   ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ) 
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Continue to Checkout', style: PrimaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: SemiBold
                    ),),
                    Icon(
                      Icons.chevron_right,
                      color: PrimaryTextColor,
                    )
                  ],
                ),
              ),  
            
            )
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: BgColor3,
      appBar: AppBar(
        backgroundColor: BgColor1,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon: Icon(Icons.chevron_left)),
        centerTitle: true,
        title: Text('Your Cart', style: PrimaryTextStyle.copyWith(
          fontWeight: Medium,
          fontSize: 18
        ),),
        elevation: 0,
      ),
      body: cartProvider.carts.length == 0 ? EmptyCart() : Content(),
      bottomNavigationBar: cartProvider.carts.length == 0 ? SizedBox() : CustomButtonNav(),
    );
  }
}