
import 'package:flutter/material.dart';

import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/productpage.dart';

import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:  (context) => ProductPage(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(
              product.galleries[0].url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: SubtitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: BlackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: SemiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: PriceTextStle.copyWith(
                      fontSize: 14,
                      fontWeight: Medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
