import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final Function onButtonPressed;

  const RoundedButton(
      {Key? key, required this.buttonText, required this.onButtonPressed})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.lightBlueAccent,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: (){
          onButtonPressed();
        },

        minWidth: 320,
        height: 55,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
