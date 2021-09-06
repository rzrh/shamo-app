import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/theme.dart';
class ChatBubble extends StatelessWidget {
  final String Message;
  final bool isSender;
  final ProductModel product;

  ChatBubble({this.Message = '',  this.isSender = false, this.product});
  @override
  Widget build(BuildContext context) {
    Widget ProductPreview(){
      return Container(
        width: 230,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? BgColor5 : BgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(product.galleries[0].url, width: 70, height: 70,),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: PrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: Regular
                      ),),
                      SizedBox(height: 2,),
                      Text('\$${product.price}', style: PriceTextStle.copyWith(
                        fontWeight: Medium,
                        fontSize: 14
                      ),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: PrimaryColor
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ) 
                  ),
                  child: Text('Add to chart', style: PurpleTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: Regular
                  ),),
                  ),
                   SizedBox(width: 8,),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              child: Text('Buy Now', style: GoogleFonts.poppins(
                color: BgColor5,
                fontWeight: Medium,
                fontSize: 14,
              ),),)
            
              ],
            ),
           
          ],
        ),
      );
    }
    return Container(
           width: double.infinity,
           margin: EdgeInsets.only(top: 30),
           child: Column(
             crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
             children: [
               product is UninitializedProductModel ? SizedBox() : ProductPreview(),
               Row(
                 mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                 children: [
                   Flexible(
                     child: Container(
                       constraints: BoxConstraints(
                         maxWidth: MediaQuery.of(context).size.width * 0.6
                       ),
                       padding: EdgeInsets.symmetric(
                         horizontal: 16,
                         vertical: 12
                       ),
                       decoration: BoxDecoration(
                         color: isSender ? BgColor5 : BgColor4,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(isSender ? 12 : 0),
                           bottomLeft: Radius.circular(12),
                           bottomRight: Radius.circular(12),
                           topRight: Radius.circular(isSender ? 0 : 12),
                         ),
                       ),
                       child: Text(Message, style: PrimaryTextStyle.copyWith(
                         fontSize: 14,
                         fontWeight: Regular
                       ),),
                     ),
                   )
                 ],
               ),
             ],
           ),
          );
  }
}