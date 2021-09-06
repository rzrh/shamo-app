import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: BgColor4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(cart.product.galleries[0].url)
                  )
                )
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.product.name, style: PrimaryTextStyle.copyWith(
                      fontWeight: SemiBold,
                      fontSize: 14
                    ),),
                    SizedBox(height: 2,),
                    Text('\$${cart.product.price}', style: PriceTextStle.copyWith(
                      fontSize: 14,
                      fontWeight: Regular
                    ),)
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset('assets/Button_add.png', width: 16,)),
                  SizedBox(height: 2,),
                  Text(cart.quantity.toString(), style: PrimaryTextStyle.copyWith(
                    fontWeight: Medium,
                    fontSize: 14
                  ),),
                  GestureDetector(
                    onTap: (){
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset('assets/Button_min.png', width: 16,))
                ],
              )
            ],
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset('assets/Button_delete.png', width: 10,),
                SizedBox(width: 4,),
                Text('Remove', style: GoogleFonts.poppins(
                  color: Color(0xffED6363),
                  fontSize: 12,
                  fontWeight: Light
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}