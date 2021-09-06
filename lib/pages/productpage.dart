import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/detailchatpage.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // List images = [
  //   'assets/image_shoes7.png',
  //   'assets/image_shoes7.png',
  //   'assets/image_shoes7.png',
  // ];
  List familiarShoes = [
    'assets/image_shoes1.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
  ];

  int currentIndex = 0;

  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

     
    Future<void> ShowSuccessDialog() async{
      return showDialog(
        context: context, 
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * 30),
          child: AlertDialog(
            backgroundColor: BgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: PrimaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset('assets/Success_Icon.png', width: 100,),
                  SizedBox(height: 12,),
                  Text('Hurry :)', style: PrimaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: SemiBold
                  ),),
                  SizedBox(height: 12,),
                  Text('Item added successfully', style: SecondaryTextStyle.copyWith(
                    fontWeight: Regular,
                    fontSize: 14
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      child: Text('View My Cart', style: PrimaryTextStyle.copyWith(
                        fontWeight: Medium,
                        fontSize: 16
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        );
    }
    Widget indicator(int index){
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? PrimaryColor : Color(0xffC4C4C4)
        ),
      );
    }
    Widget FamiliarShoesCard(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl)
          ),
        ),
      );
    }
    Widget Header(){
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: 
                  Icon(
                    Icons.chevron_left
                    )),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: 
                      Icon(
                        Icons.shopping_bag
                        ))
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries.map(
              (image) => Image.network(
                image.url, 
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover, 
                height: 310,)).toList(), 
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex = index;
                });
              }
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                widget.product.galleries.map((e){
                  index++;
                  return indicator(index);
                }).toList()
            )
        ],
      );
    }
    Widget Content(){
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          color: BgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24)
          )
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product.name, style: PrimaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: SemiBold
                        ),),
                         SizedBox(height: 2,),
                        Text(widget.product.category.name, style: SubtitleTextStyle.copyWith(
                          fontWeight: Regular,
                          fontSize: 12
                  ),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      wishlistProvider.setProduct(widget.product);
                      if(wishlistProvider.isWishlist(widget.product)){
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: SecondaryColor,
                          content: Text(
                            'Has been added to Whishlist',
                            textAlign: TextAlign.center,
                          ),)
                      );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AlertColor,
                          content: Text(
                            'Has been removed from the Whishlist',
                            textAlign: TextAlign.center,
                          ),)
                      );
                      }
                    },
                    child: 
                    Image.asset(
                      wishlistProvider.isWishlist(widget.product) ? 'assets/WhistlistBlue_Button.png' :
                      'assets/Whistlist_Button.png', 
                      width: 46,)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: BgColor2,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price start from', style: PrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: Regular
                  ),),
                  Text('\$${widget.product.price}', style: PriceTextStle.copyWith(
                    fontWeight: SemiBold,
                    fontSize: 16
                  ),)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30,left: 30, right: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: BgColor1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: PrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: Medium
                  ),),
                  SizedBox(height: 12,),
                  Text(widget.product.description,
                  style: SubtitleTextStyle.copyWith(
                    fontWeight: Light,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,)
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: BgColor1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Familiar Shoes', style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: Medium
                    ),),
                  ),
                  SizedBox(height: 12,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: 
                        familiarShoes.map((image) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ?  30 : 0),
                            child: FamiliarShoesCard(image),
                          );
                        }).toList()
                      
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: BgColor1,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => DetailChatPage(widget.product)));
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Chat_Button.png')
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: (){
                          cartProvider.addCart(widget.product);
                          ShowSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                        child: Text('Add to Chart', style: PrimaryTextStyle.copyWith(
                          fontWeight: SemiBold,
                          fontSize: 16
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: BgColor6,
      body: SafeArea(
        child: ListView(
          children: [
            Header(),
            Content()
          ],
        ),
      )
    );
  }
}