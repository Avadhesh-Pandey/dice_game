import 'package:demo_flutter/bloc/GameScreenBlock.dart';
import 'package:demo_flutter/utils/AppSetings.dart';
import 'package:demo_flutter/utils/CommonUIs.dart';
import 'package:flutter/material.dart';

class PlayGameScreen extends StatefulWidget {
  @override
  _AskQuestionsState createState() => _AskQuestionsState();
}

class _AskQuestionsState extends State<PlayGameScreen> {
  GameScreenBlock _block=GameScreenBlock();


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(Icons.arrow_back_ios,color: AppColors.themeColor,),
                  margin: EdgeInsets.only(right: 17),
                ),
              ),
              CommonUis.getText("Game Screen", AppColors.black, AppFontSize.size18, AppFonts.PoppinsRegular),
            ],
          ),
        ),
      body: ListView(
        children: [

          SizedBox(height: 50,),
          StreamBuilder(
            stream: _block.rollStream,
            initialData: 0,
            builder: (BuildContext context,AsyncSnapshot snap)
            {
              return
              CircleAvatar(
                radius: 30,
                  child:CommonUis.getText("${snap.data}", AppColors.white, AppFontSize.size20, AppFonts.PoppinsBold,weight: AppFontsStyle.BOLD)
              );
            },
          ),
          SizedBox(height: 8,),
          Align(alignment: Alignment.center,child: CommonUis.getText("Rolled Value", AppColors.blackTxt, AppFontSize.size14, AppFonts.PoppinsRegular),),
          SizedBox(height: 50,),
          StreamBuilder(
            stream: _block.rollHistoryStream,
            initialData: null,
            builder: (BuildContext context,AsyncSnapshot snap)
            {
              List<int> list=snap.data;
              List<int> sortedList=List();
              int sum=0;
              if(snap.data!=null&&list.length>0)
                {
                  list=snap.data;
                  sortedList.clear();
                sortedList.addAll(snap.data);
  
                sortedList.sort((a, b) => a>b?b:0);
                print(sortedList.join(","));
                list.forEach((element) {sum=sum+element;});
                }
              return snap.data==null?SizedBox():
              Column(
                children: [
                  Divider(),
                  _createRow("Roll History", "${list.join(",")}"),
                  Divider(),
                  _createRow("Largest", "${sortedList.length>0?sortedList.last:"N/A"}"),
                  Divider(),
                  _createRow("Total", "${sum}"),
                ],
              );
            },
          ),
          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.all(10),child: CommonUis.getThemeRaisedButton("Roll", () {
            _block.rollTheDice(context);
          }),),
          Padding(padding: EdgeInsets.all(10),child: CommonUis.getThemeRaisedButtonNegative("Reset", () {
            _block.resetTheDeiceValue();

          }),),

        ],
      ),
      /*SafeArea(
          child: Flexible(
            child: ListView(
              children: [




              ],
            ),
          ),
        )*/);
  }

  String errorMsg = "";

  _createRow(String title,String value)
  {
    return Padding(padding: EdgeInsets.only(right: 20,left: 20,top: 8,),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonUis.getText("$title", AppColors.themeColor, AppFontSize.size14, AppFonts.PoppinsRegular,weight: AppFontsStyle.BOLD),
        CommonUis.getText("$value", AppColors.blackTxt, AppFontSize.size14, AppFonts.PoppinsRegular),


      ],
    ),);
  }

}
