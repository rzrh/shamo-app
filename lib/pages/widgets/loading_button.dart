import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
class LoadingButton extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            backgroundColor: PrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    PrimaryTextColor
                  ),
                  strokeWidth: 2,
                ),
              ),
              SizedBox(width: 4,),
              Text('Loading', style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: Medium
              ),),
            ],
          ),
        ),
      );
  }
}