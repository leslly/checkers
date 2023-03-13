import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
  const ColorButton({Key? key}) : super(key: key);

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {

  bool _picked = true;
  bool _textcolor = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState( () {
          _picked = !_picked;
          _textcolor = !_textcolor;
        });
      },
      child: Container(
        color: Colors.black,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Fanthom',
          style: TextStyle(
            //color: _textcolor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        //_picked ? Colors.black : Colors.white ;
      ),
    );
  }
}
