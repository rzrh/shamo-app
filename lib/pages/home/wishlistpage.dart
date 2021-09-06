 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/whishlist_card.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget Header(){
      return AppBar(
        backgroundColor: BgColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: Medium
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget EmptyWhishlist(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: BgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/lovepage.png', width: 74, height: 62,),
              SizedBox(height: 23,),
              Text('You don\'t have dream shoes ?', style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: Medium
              ),),
              SizedBox(height: 12,),
              Text('Let\'s find your favorite shoes', style: SubtitleTextStyle.copyWith(
                fontWeight: Regular,
                fontSize: 14
              ),),
              SizedBox(height: 20,),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: (){
                   pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text('Explore Store', style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: Medium
                  ),),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget Content(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: BgColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: wishlistProvider.wishlist.map((product) => WhishlistCard(product)).toList()
          ),
        ),
      );
    }
    return Column(
      children: [
        Header(),
        wishlistProvider.wishlist.length == 0 ? EmptyWhishlist() : Content()
      ],
    );
  }
}