import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/loading_button.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class SignInPage extends StatefulWidget {
  
  @override
  _SignInPageState createState() => _SignInPageState();
}
  
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async{

     setState(() {
       isLoading = true;
     });

      if(await authProvider.login(
        email: emailController.text,
        password: passwordController.text
      )){
         Navigator.pushNamed(context, '/home');
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AlertColor,
            content: Text('Gagal Login', textAlign: TextAlign.center,)
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
            Text('Login', style: PrimaryTextStyle.copyWith(
              fontSize: 24, 
              fontWeight: SemiBold
            ),),
            SizedBox(height: 2,),
            Text('Sign in to Countinue', style: SubtitleTextStyle.copyWith(
              fontWeight: Regular,
              fontSize: 14
            ),)
          ],
        ),
      );
    }

    Widget InputEmail(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: PrimaryTextStyle.copyWith(
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
                    Image.asset('assets/Email_Icon.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(child: 
                    TextFormField(
                      style: PrimaryTextStyle,
                      controller: emailController,
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

    Widget InputPassword(){
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
                      style: PrimaryTextStyle,
                      obscureText: true,
                      controller: passwordController,
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

    Widget SignInButton(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
            backgroundColor: PrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          child: Text('Sign In', style: PrimaryTextStyle.copyWith(
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
                Navigator.pushNamed(context, '/sign-up');
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
              InputEmail(),
              InputPassword(),
              isLoading ? LoadingButton() : SignInButton(),
              Spacer(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}