import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class EditProfile extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget NameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name', style: SubtitleTextStyle.copyWith(
              fontSize: 13,
              fontWeight: Regular
            ),),
            TextFormField(
              style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: Regular
              ),
              decoration: InputDecoration(
                hintText: user.name,
                hintStyle: PrimaryTextStyle.copyWith(
                  fontWeight: Regular,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: SubtitleTextColor)
                )
              )
            )
          ],
        ),
      );
    }
    Widget UsernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username', style: SubtitleTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 13
            ),),
            TextFormField(
              style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: Regular
              ),
              decoration: InputDecoration(
                hintStyle: PrimaryTextStyle.copyWith(
                  fontWeight: Regular,
                  fontSize: 16,
                ),
                hintText: '@${user.username}',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: SubtitleTextColor)
                )
              ),
            )
          ],
        ),
      );
    }

    Widget EmailInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: SubtitleTextStyle.copyWith(
              fontSize: 13,
              fontWeight: Regular
            ),),
            TextFormField(
              style: PrimaryTextStyle.copyWith(
                fontWeight: Regular,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: user.email,
                hintStyle: PrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: Regular
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: SubtitleTextColor)
                )
              ),
            )
          ],
        ),
      );
    }
    Widget Content(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    user.profilePhotoUrl
                  )
                )
              ),
            ),
            NameInput(),
            UsernameInput(),
            EmailInput()
          ],
        ),
      );
    }
  
    return Scaffold(
      backgroundColor: BgColor3,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: BgColor3,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile', style: PrimaryTextStyle.copyWith(
          fontWeight: Medium,
          fontSize: 18
        ),),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.check, color: PrimaryColor,))
        ],
      ),
      body: Content(),
    );
  }
}