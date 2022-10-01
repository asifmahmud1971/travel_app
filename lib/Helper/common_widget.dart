import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

var direction = TextDirection.ltr;

//This is the common function which works whole application, which set Text with different font and color.
setCommonText(String title, dynamic color, dynamic fontSize, dynamic fontweight,
    dynamic noOfLine,

    {dynamic talign,var font = GoogleFonts.poppins}) {
  return  AutoSizeText(
    title,
    textDirection: direction,
    /* style: new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontweight,
        fontFamily: 'Poppins'),*/
    style: font(
      color: color,
      fontSize: fontSize,
      fontWeight: fontweight,
    ),
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
    textAlign: talign,
  );
}

textIcon(String title, dynamic icon, dynamic color, dynamic fontweight,dynamic fontSize,
    dynamic noOfLine,

    {dynamic talign,var font = GoogleFonts.poppins,Widget? route}) {
  return  TextButton.icon(
      onPressed: () {
        Get.to(route);
      },
      icon: Icon(icon,color: color),
      label: setCommonText(
          title,
          Colors.black,
          fontSize,
          fontweight,
          noOfLine));
}


setDefaultText(
    String title, dynamic fontSize, dynamic fontweight, dynamic noOfLine,
    {dynamic talign}) {
  return AutoSizeText(
    title,
    textDirection: direction,
    style:  TextStyle(
      fontSize: fontSize,
      fontWeight: fontweight,
    ),
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
    textAlign: talign,
  );
}

showSnackbar(String value, GlobalKey<ScaffoldState> key) {
  key.currentState!.showSnackBar(new SnackBar(
      duration: Duration(seconds: 15),
      content: new Row(
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(),
            height: 25.0,
            width: 25.0,
          ),
          SizedBox(width: 15),
          new Expanded(
              child:
                  setCommonText(value, Colors.white, 17.0, FontWeight.w500, 2))
        ],
      )));
}

setHeight(double height) {
  return SizedBox(
    height: height,
  );
}

setWidth(double width) {
  return SizedBox(
    width: width,
  );
}

//This widget will display after payment success.

//This is the common textfield widgets which use whole app.

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(),
    );
  }
}

//This is for restaurant close
