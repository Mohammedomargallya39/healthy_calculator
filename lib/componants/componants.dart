import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndEnd(context,Widget widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget), (route) => false);
}
void navigateTo(context,Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget),);
}
void showToast({required String message, required ToastStates state}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastStates{SUCCESS, ERROR , WARNING}
Color toastColor(ToastStates state){
  Color color ;
  switch (state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
Widget defaultButton({
  // Color background = defaultColor,
  double width = double.infinity,
  required dynamic color,
  dynamic textColor = Colors.white,
  double height = 77,
  bool isUpperCase = true,
  double radius = 6.0,
  required Function() function,
  required String text,
  required BuildContext context,
  double fontSize = 16,
}) {
  return  Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    child: AnimatedButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: Theme.of(context).textTheme.button!.copyWith(
          color: textColor,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      enabled: true,
      shadowDegree: ShadowDegree.light,
      color: color,
    ),
  );
}

Widget defaultTextButton({
  required Function()? onPressed,
  required String text,
  required dynamic color,
  double fontSize = 16,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget defaultFormField({
  String? text,
  isPassword = false,
  required TextEditingController controller,
  dynamic prefix,
  ValueChanged<String>? onChange,
  IconData? suffix,
  Function? suffixPressed,
  Function? validate,
  Function? onSubmit,
  required TextInputType type ,
  required context,
  dynamic textColor,
  dynamic labelStyleColor,
  dynamic fillColor,
  dynamic suffixIconColor,
  dynamic borderColor,
  dynamic cursorColor,


  int maxLines = 1,
})
{
  return TextFormField(
    cursorColor: cursorColor,
    maxLines: maxLines,
    controller: controller,
    obscureText: isPassword,
    onChanged: onChange,
    validator:(value){
      return validate!(value);
    },
    keyboardType: type,
    style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      isDense: true,
      labelText: text,
      filled: false,
      labelStyle: TextStyle(
          color:  labelStyleColor
      ),
      fillColor: fillColor ,
      prefixIcon: prefix,
      suffixIcon: IconButton(onPressed: (){
        return suffixPressed!();
      }, icon: Icon(suffix),color:suffixIconColor,),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0 ),
        borderSide:  BorderSide(color: borderColor , width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0 ),
        borderSide:  BorderSide(color: borderColor , width: 1),
      ),
    ),
  );
}