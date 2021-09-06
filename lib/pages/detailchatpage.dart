import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/widgets/chat_bubble.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';

class DetailChatPage extends StatefulWidget {
  
  ProductModel product;
  DetailChatPage(this.product);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {

  TextEditingController messageController = TextEditingController(text: '');
  @override
   
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async{
       await MessageService().addMessage(
                        user: authProvider.user,
                        isFromUser: true,
                        product: widget.product,
                        message: messageController.text
                      );

                      setState(() {
                        widget.product = UninitializedProductModel();
                        messageController.text = '';
                      });
    }

    Widget ProductPreview(){
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: BgColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: PrimaryColor
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: 
              Image.network(widget.product.galleries[0].url, width: 54,)),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name, style: PrimaryTextStyle.copyWith(
                    fontWeight: Regular,
                    fontSize: 14
                  ),
                  overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 2,),
                  Text('\$${widget.product.price}', style: PriceTextStle.copyWith(
                    fontSize: 14,
                    fontWeight: Medium
                  ),)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: 
              Image.asset('assets/Button_Cancel.png', width: 22,))
          ],
        ),
      );
    }
     Widget ChatInput(){
       return Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.product is UninitializedProductModel ? SizedBox() : ProductPreview(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: BgColor4,
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: messageController,
                          style: PrimaryTextStyle,
                          decoration: InputDecoration.collapsed(
                            hintText:   'Type Message...',
                            hintStyle: SubtitleTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: Regular
                            )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: handleAddMessage,
                    child: Image.asset('assets/Send_Button.png', width: 45,))
                ],
              ),
            ],
          ),
       );
     }

    Widget Content(){
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: snapshot.data.map((MessageModel message) => ChatBubble(
              isSender: message.isFromUser,
              Message: message.message,
              product: message.product,
            )).toList()
          );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
          
        }
      );
    }
    return Scaffold(
      backgroundColor: BgColor3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
           backgroundColor: BgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/image_logoshoponline.png',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: PrimaryTextStyle.copyWith(
                      fontWeight: Medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: SecondaryTextStyle.copyWith(
                      fontWeight: Light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatInput(),
      body: Content(),
    );
  }
}