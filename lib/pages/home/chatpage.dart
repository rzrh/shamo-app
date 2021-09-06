import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/pages/widgets/chat_tile.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';

class ChatPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget Header(){
      return AppBar(
        backgroundColor: BgColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: Medium
          ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
      );
    }

    Widget EmptyChat(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: BgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Headset_Icon.png', width: 80,),
              SizedBox(height: 20,),
              Text('Opps no message yet ?', style: PrimaryTextStyle.copyWith(
                fontWeight: Medium,
                fontSize: 16
              ),),
              SizedBox(height: 12,),
              Text('You have never done a transaction', style: SubtitleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: Regular
              ),),
              SizedBox(height: 20,),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: (){
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10
                    ),
                    backgroundColor: PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text(
                    'Explore Store',
                    style: PrimaryTextStyle.copyWith(
                      fontWeight: Medium,
                      fontSize: 16
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    Widget Content(){
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {
         if(snapshot.hasData){
            if(snapshot.data.length == 0){
              return EmptyChat();
            }

            return Expanded(
            child: Container(
              width: double.infinity,
              color: BgColor3,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: [
                  ChatTile(snapshot.data[snapshot.data.length - 1])
                  
                ],
              ),
            ),
          );
         }else{
           return EmptyChat();
         }
         
        }
      );
    }
    return Column(
      children: [
        Header(),
        Content()
        
      ],
    );
  }
}