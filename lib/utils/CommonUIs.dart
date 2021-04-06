import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'AppSetings.dart';

class CommonUis
{
  static Widget getText(String text,Color color, double size, String font,{TextAlign alignment = TextAlign.start,int maxLines,FontWeight weight = FontWeight.normal}) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: font,
          fontSize: size,
          fontWeight: weight
      ),
    );
  }
    static Container getThemeButton(String text)
  {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.themeColor
      ),
      margin: EdgeInsets.only(right: 10, left: 10),
      height: 45.0,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 12.0,
            color: AppColors.white,
            fontFamily: AppFonts.ProximaNova,
            fontWeight: AppFontsStyle.SEMI_BOLD),
      )
    );
  }

  static Container getThemeTextField(String text)
  {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: AppColors.themeColor
        ),
        margin: EdgeInsets.only(right: 10, left: 10),
        height: 40.0,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12.0,
              color: AppColors.white,
              fontFamily: AppFonts.ProximaNova,
              fontWeight: AppFontsStyle.REGULAR),
        )
    );
  }
  static Container getThemeRaisedButton(String text,Function() onButtonPressed)
  {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
          onPressed: () {
            onButtonPressed();
          },
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.all(0.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 12.0,
                color: AppColors.white,
                fontFamily: AppFonts.ProximaNova,
                fontWeight: AppFontsStyle.SEMI_BOLD),
          )),
    );
  }

  static Container getThemeRaisedButtonNegative(String text,Function() onButtonPressed)
  {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: double.infinity,
      height: 43.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.white,
        border: Border.all(
        width: 1.0,
        color: AppColors.themeColor,
      ),
      ),

      child: RaisedButton(
          onPressed: () {
            onButtonPressed();
          },
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.all(0.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 12.0,
                color: AppColors.themeColor,
                fontFamily: AppFonts.ProximaNova,
                fontWeight: AppFontsStyle.SEMI_BOLD),
          )),
    );
  }

  static Widget getButton(String text,{Color textColor = AppColors.textColor,String font = AppFonts.ProximaNova,double fontSize = 16.0,FontWeight fontWeight = FontWeight.normal,Function onButtonPressed,double height = 45.0,double width = double.infinity,Color color = AppColors.themeColor}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height/2),
        color: color
      ),

      child: RaisedButton(
          onPressed: () {
            onButtonPressed();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height/2)
          ),
          color: color,
          child: CommonUis.getText(text, textColor, fontSize, font,alignment: TextAlign.center)),
    );
  }


  static Container getCommonTextField({String hint="",String text,TextEditingController controller,TextInputType textInputType=TextInputType.text,int maxLength=null,textCapitalization=TextCapitalization.words})
  {
    return Container(
      height: 45,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.textFieldBG
      ),
      child: Theme(
        data: ThemeData(
            primaryColor: AppColors.black,
            accentColor: AppColors.black,
            hintColor: AppColors.greyTxt),
        child:
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            labelText: text,
            counterText: "",
            contentPadding: EdgeInsets.only(left: 10, bottom: 5),
            hintStyle: new TextStyle(color: AppColors.greyTxt),
            labelStyle: new TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
          textCapitalization: textCapitalization,
          style: TextStyle(
            fontSize: 16.0,
            color: AppColors.blackTxt,
            fontFamily: AppFonts.Montserrat,
            fontWeight: AppFontsStyle.MEDIUM,
          ),
          maxLines: 1,

          maxLength: maxLength,
          controller: controller,
          keyboardType: textInputType,
        ),
      ),
    );
  }

  static BoxDecoration getBoxDecorationTopCurved()
  {
    return BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      color: AppColors.white,
      border: Border.all(
      width: 0.0,
      color: AppColors.white,
    ),
    );
  }

  static getGradientColor()
  {
    return [
      const Color(0xFF00747C),
      const Color(0xFF00587C),
      const Color(0xFF00497C)
    ];
  }

  static showToast(String msg,context, {int duration=3, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

}