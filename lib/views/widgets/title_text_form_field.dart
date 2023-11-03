import 'package:flutter/material.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Enter Title' : null,
      controller: textEditingController,
      keyboardType: TextInputType.text,
      autocorrect: false,
      // cursorColor: Colors.grey,
      textInputAction: TextInputAction.done,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFF0D2972)),
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(17, 20, 17, 25),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
          borderSide: BorderSide(color: Color(0xFFCBCBCB), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
          borderSide: BorderSide(color: Color(0xFFCBCBCB), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
