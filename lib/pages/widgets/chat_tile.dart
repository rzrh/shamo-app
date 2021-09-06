import 'package:flutter/material.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/detailchatpage.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {

  final MessageModel message;

  ChatTile(this.message);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:  (context) => DetailChatPage(UninitializedProductModel())));
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/image_logoshop.png', width: 54, height: 54,),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shoe Store', style: PrimaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: Regular
                    ),),
                    SizedBox(height: 2,),
                    Text(message.message, style: SubtitleTextStyle.copyWith(
                      fontWeight: Light,
                      fontSize: 14
                    ),overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Text('Now', style: SubtitleTextStyle.copyWith(
                fontSize: 10,
                fontWeight: Regular
              ),),
              SizedBox(height: 17,),
              Divider(
                thickness: 10,
                color: Color(0xff2B2939),
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}