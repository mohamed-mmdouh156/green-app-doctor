import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultElevatedButton(
    {double width = double.infinity,
      required String text,
      required Color onprimary,
      required Color primary,
      double fontsize = 25,
      double top = 50,
      double border = 10,
      required Color color,
      required Function() onPress}) =>
    Container(
      width: width,
      padding: EdgeInsets.only(left: 20, right: 20, top: top),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            onPrimary: onprimary,
            primary: primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border))),
        child: Text(text,
            style: TextStyle(
                fontSize: fontsize, color: color, fontFamily: 'Courgette-Regular')),
      ),
    );

Widget defaultText(
    {required String text,
      double fontsize = 40,
      String fontfamily = 'Courgette-Regular',
      required Color color}) =>
    Text(
      text,
      style:
      TextStyle(fontSize: fontsize, fontFamily: fontfamily, color: color),
    );

Widget defaulttextform(
    {
      double left = 20,
      double right = 20,
      double top = 15,
      double bottom = 15,
      double margin = 14,
      double border = 20 ,
      double hight = 60,
      required IconData icon,
      int color = 0xff416F46,
      int textlabelcolor = 0xff416F46,
      required String labeltext,
      String fontfamily = 'Courgette-Regular',
      TextAlign textAlign = TextAlign.start,
      required TextInputType textInputType,
      String? Function(String?)? validator,
      bool obscureText = false,
      suffix,
      required void Function(String value) onSubmit,
      required TextEditingController controller,
      required Null Function(dynamic val) onChanged,
      required Null Function(dynamic val) onSaved,
      required List<TextInputFormatter> inputFormatters }) =>

    Container(
      margin: EdgeInsets.all(margin),
      child: TextFormField(
        onSaved: onSaved,
        onFieldSubmitted: onSubmit,
        inputFormatters: inputFormatters,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(left , top , right , bottom),
          enabled: true,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(border),),
          suffixIcon: suffix,
          prefixIcon: Icon(
            icon,
            color: Color(color),
          ),
          labelText: labeltext,
          labelStyle:
          TextStyle(color: Color(textlabelcolor), fontFamily: fontfamily, ),
        ),
        textAlign: textAlign,
        keyboardType: textInputType,

      ),
    );
