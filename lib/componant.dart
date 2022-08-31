import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.grey, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            prefix,
            color: Colors.white,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: Colors.white,
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );



void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );



Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),style: TextStyle(color: Colors.teal),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


