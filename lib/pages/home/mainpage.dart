import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/home/homepage.dart';
import 'package:shamo/pages/home/chatpage.dart';
import 'package:shamo/pages/home/wishlistpage.dart';
import 'package:shamo/pages/home/profilepage.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override

  

  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton(){
    
    return FloatingActionButton(
      onPressed: (){},
      backgroundColor: SecondaryColor,
      child: Image.asset('assets/Cart_Icon.png', width: 20,),  
      );
  }

  Widget customNavbar(){
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30)
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12, 
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: BgColor4,
          currentIndex: pageProvider.currentIndex,
          onTap: (value){
            print(value);
            pageProvider.currentIndex = value;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                 child: Image.asset('assets/Home_Icon.png', width: 21, color: pageProvider.currentIndex == 0 ? PrimaryColor : Color(0xff808191),)),
              label: '',
              ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10), 
                child: Image.asset('assets/Chat_Icon.png', width: 21, color:  pageProvider.currentIndex == 1 ? PrimaryColor : Color(0xff808191),)),
              label: ''
              ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10), 
                child: Image.asset('assets/Love_Icon.png', width: 21, color: pageProvider.currentIndex == 2 ? PrimaryColor : Color(0xff808191),)),
              label: ''
              ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10), 
                child: Image.asset('assets/ProfileBottom_Icon.png', width: 21, color:  pageProvider.currentIndex == 3 ? PrimaryColor : Color(0xff808191),)),
              label: ''
              ),
          ]
          
          ),
      ),
    );
  }

   Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }
    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0 ? BgColor1 :BgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNavbar(),
      body: body(),
      
    );
  }
}