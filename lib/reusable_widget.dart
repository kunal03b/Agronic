import 'package:flutter/material.dart';


Image logo(String imagename) {
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
  );
}

Container textField(String text, IconData iconData, bool ispasswordtype,
    TextEditingController controller) {
  return Container(
      width: 500,
      height: 80,
      child: TextField(
        controller: controller,
        obscureText: ispasswordtype,
        enableSuggestions: !ispasswordtype,
        autocorrect: ispasswordtype,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: Icon(iconData),
            fillColor: Colors.white,
            filled: true,
            // labelText: text,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        keyboardType: ispasswordtype
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ));
}

Container elevatedButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    // height: 80,
    width: 500,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.all(15),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'Log In' : 'Create New Account',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}

TextButton textButton(bool islogin, Function onTap) {
  return TextButton(
      onPressed: () {
        onTap();
      },
      child: Text(islogin ? 'Sign Up' : 'Sign In',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)));
}

IconButton iconButton(
    BuildContext context, IconData iconData, Color color, Function onTap) {
  return IconButton(
    onPressed: () {
      onTap();
    },
    icon: Icon(
      iconData,
      color: color,
    ),
  );
}