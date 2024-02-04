import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labeltext;
  final Icon icon;
  final TextEditingController? controller;
  final Function(String)? validator;
  final bool obsecureText;
  const CustomTextField({
    Key? key,
    required this.labeltext,
    required this.icon,
    this.controller,
    this.validator,
    required this.obsecureText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 190, 190, 190)),
      child: TextFormField(
        obscureText: widget.obsecureText,
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: widget.labeltext, contentPadding: const EdgeInsets.only(left: 20)),
      ),
    );
  }
}
