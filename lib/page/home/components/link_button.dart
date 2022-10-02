import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({Key? key, this.onTap, required this.text})
      : super(key: key);
  final VoidCallback? onTap;
  final String text;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

bool _isSelected = false;

class _LinkButtonState extends State<LinkButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = true;
        });
        Future.delayed(const Duration(milliseconds: 1000), (() {
          setState(() {
            _isSelected = false;
          });
        }));
        widget.onTap!();
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: _isSelected ? Color.fromARGB(255, 255, 179, 0) : null,
          border:
              _isSelected ? null : Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: _isSelected ? Colors.black : Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
