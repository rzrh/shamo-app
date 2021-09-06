import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    
    Widget Header(){
      return AppBar(
        backgroundColor: BgColor1,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                ClipOval(
                  child: 
                  Image.network(user.profilePhotoUrl, width: 64, height: 64,)),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hallo, ${user.name}', style: PrimaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: SemiBold
                      ),),
                      SizedBox(height: 2,),
                      Text('@${user.username}', style: SubtitleTextStyle.copyWith(
                        fontWeight: Regular,
                        fontSize: 16
                      ),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                  },
                  child: 
                  Image.asset('assets/Exit_Button.png', width: 20,))
              ],
            ),
          ),
        ),
      );
    }

    Widget MenuItem(String menu){
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menu, style: SubtitleTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 13
            ),),
            Icon(
              Icons.chevron_right,
              color: SubtitleTextColor,
            )
          ],
        ),
      );
    }
    Widget Content(){
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: BgColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('Account', style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: SemiBold
              ),),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: MenuItem(
                  'Edit Profile'
                ),
              ),
              MenuItem(
                'Your Orders'
              ),
              MenuItem(
                'Help'
              ),
              SizedBox(height: 30,),
              Text('General', style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: SemiBold
              ),),
              MenuItem(
                'Privacy & Policy'
              ),
              MenuItem(
                'Terms of Service'
              ),
              MenuItem(
                'Rate App'
              ),
            ],
          ),
        ),
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