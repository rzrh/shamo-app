import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/signinpage.dart';
import 'package:shamo/pages/widgets/checkout_card.dart';
import 'package:shamo/pages/widgets/loading_button.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/theme.dart';

class CheckoutPage extends StatefulWidget {
  

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async{
      setState(() {
        isLoading = true;
      });
      if(await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts, 
        cartProvider.totalPrice()
      )){
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }
    Widget ListItems(){
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('List Items', style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: Medium
                  ),),
                  Column(children: 
                    cartProvider.carts.map((cart) => CheckoutCard(cart)).toList()
                  ,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: BgColor4
              ),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address Details', style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: Medium
                  ),),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Image.asset('assets/Storelocation_Icon.png', width: 40,),
                      SizedBox(width: 12,),
                      Column(
                        children: [
                          Text('Store Location', style: SubtitleTextStyle.copyWith(
                            fontWeight: Light,
                            fontSize: 12
                          ),),
                          SizedBox(height: 1,),
                          Text('Adidas Store', style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: Medium
                          ),)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Line.png', width: 40, height: 40,)
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Address_Icon.png', width: 40,),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Address', style: SubtitleTextStyle.copyWith(
                            fontWeight: Light,
                            fontSize: 12
                          ),),
                          SizedBox(height: 1,),
                          Text('Cijawura Girang IV', style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: Medium
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: BgColor4,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Summary', style: PrimaryTextStyle.copyWith(
                    fontWeight: Medium,
                    fontSize: 16
                  ),),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Quantity', style: SubtitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: Regular
                      ),),
                      Text('${cartProvider.totalItems()} Items', style: PrimaryTextStyle.copyWith(
                        fontWeight: Medium,
                        fontSize: 14
                      ),)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Price', style: SubtitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: Regular
                      ),),
                      Text('\$${cartProvider.totalPrice()}', style: PrimaryTextStyle.copyWith(
                        fontWeight: Medium,
                        fontSize: 14
                      ),)
                    ],
                  ),
                   SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping', style: SubtitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: Regular
                      ),),
                      Text('Free', style: PrimaryTextStyle.copyWith(
                        fontWeight: Medium,
                        fontSize: 14
                      ),)
                    ],
                  ),
                  SizedBox(height: 11,),
                  Divider(
                    thickness: 1,
                    color: SubtitleTextColor,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: PriceTextStle.copyWith(
                        fontSize: 14,
                        fontWeight: SemiBold
                      ),),
                      Text('\$${cartProvider.totalPrice()}', style: PriceTextStle.copyWith(
                        fontWeight: SemiBold,
                        fontSize: 14
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
             Divider(
                thickness: 1,
                color: SubtitleTextColor,
              ),
            isLoading ? LoadingButton() : Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: TextButton(
                onPressed: handleCheckout,
                style: TextButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Text('Checkout Now', style: PrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: SemiBold
                ),),
              ),
            )   
          ],
        );
    }
    return Scaffold(
      backgroundColor: BgColor3,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: PrimaryTextColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: BgColor1,
        title: Text('Checkout Details', style: PrimaryTextStyle.copyWith(
          fontWeight: Medium,
          fontSize: 16
        ),),
      ),
      body: ListItems(),
    );
  }
}