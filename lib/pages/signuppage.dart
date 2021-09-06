import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/loading_button.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class SignUpPage extends StatefulWidget {
 
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async{

     setState(() {
       isLoading = true;
     });

      if(await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text
      )){
         Navigator.pushNamed(context, '/home');
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AlertColor,
            content: Text('Gagal Register', textAlign: TextAlign.center,)
            )
        ); 
      }

      setState(() {
        isLoading = false;
      });
    }
    Widget Header(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up', style: PrimaryTextStyle.copyWith(
              fontSize: 24, 
              fontWeight: SemiBold
            ),),
            SizedBox(height: 2,),
            Text('Register and Happy Shoping', style: SubtitleTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 14
            ),)
          ],
        ),
      );
    }

    Widget NameInput(){
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name', style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: Medium
            ),),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: BgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/Profile_Icon.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(child: 
                    TextFormField(
                      controller: nameController,
                      style: PrimaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Full Name', 
                        hintStyle: SubtitleTextStyle.copyWith(
                          fontWeight: Regular,
                          fontSize: 14
                        )
                    )))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget UsernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username', style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: Medium,
            ),),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: BgColor2
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/Username_Icon.png', width: 19,),
                    SizedBox(width: 16,),
                    Expanded(child: 
                    TextFormField(
                      controller: usernameController,
                      style: PrimaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Username', 
                        hintStyle: SubtitleTextStyle.copyWith(
                          fontWeight: Regular,
                          fontSize: 14
                        )
                    )))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget EmailInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: Medium,
            ),),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: BgColor2
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/Email_Icon.png', width: 19,),
                    SizedBox(width: 16,),
                    Expanded(child: 
                    TextFormField(
                      controller: emailController,
                      style: PrimaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address', 
                        hintStyle: SubtitleTextStyle.copyWith(
                          fontWeight: Regular,
                          fontSize: 14
                        )
                    )))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget PasswordInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password', style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: Medium,
            ),),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: BgColor2
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/Password_Icon.png', width: 19,),
                    SizedBox(width: 16,),
                    Expanded(child: 
                    TextFormField(
                      controller: passwordController,
                      style: PrimaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password', 
                        hintStyle: SubtitleTextStyle.copyWith(
                          fontWeight: Regular,
                          fontSize: 14
                        )
                    )))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget SignUpButton(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: PrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          child: Text('Sign Up', style: PrimaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: Medium
          ),),
        ),
      );
    }

    Widget Footer(){
      return Container(
        margin: EdgeInsets.only(bottom: 30,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('don\'t have an account ? ', style: SubtitleTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 12
            ),),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text('Sign Up', style: PurpleTextStyle.copyWith(
                fontSize: 12,
                fontWeight: Medium
              ),),
            )
          ],
        ),

      );
    }
    
    return Scaffold(
      backgroundColor: BgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              NameInput(),
              UsernameInput(),
              EmailInput(),
              PasswordInput(),
              Spacer(),
              isLoading ? LoadingButton() : SignUpButton(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}