import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccess extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    Widget Content(){
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/CartPage_Icon.png', width: 79, height: 69,),
              SizedBox(height: 20,),
              Text('You made a transcation', style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: Medium
              ),),
              SizedBox(height: 12,),
              Text('Stay at home while we prepare your dream shoes', style: SubtitleTextStyle.copyWith(
                fontWeight: Regular,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              ),
              Container(
                height: 44,
                width: 196,
                margin: EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text('Order Other Shoes', style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: Medium
                  ),),
                ),
              ),
              Container(
                width: 196,
                height: 44,
                margin: EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff39374B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  child: Text('View My Order', style: PrimaryTextStyle.copyWith(
                    fontWeight: Medium,
                    fontSize: 16
                  ),),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: BgColor3,
      appBar:AppBar(
        elevation: 0,
        backgroundColor: BgColor1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Checkout Success', style: PrimaryTextStyle.copyWith(
          fontWeight: Medium,
          fontSize: 18
        ),),
      ),
      body: Content(),
    );
  }
}