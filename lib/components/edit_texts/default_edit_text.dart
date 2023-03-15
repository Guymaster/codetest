import 'package:groupe/components/edit_texts/card_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupe/utils/colors.dart';

class DefaultEditText extends StatelessWidget {

  final bool isPasswordVisible;
  final Function()? onTap;
  final String hintText;
  final Icon prefixIcon;
  final Function(String) onChanged;
  final TextInputType textInputType;
  final bool isPadding;
  final List<TextInputFormatter> textInputFormatter;
  final bool isEnable;

  const DefaultEditText({Key? key, this.isPasswordVisible = true, this.textInputType = TextInputType.text, this.onTap, required this.hintText, required this.onChanged, required this.prefixIcon, this.isPadding = true, this.textInputFormatter = const[], this.isEnable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding ? const EdgeInsets.only(bottom: 8.0, left: 20, right: 20) : const EdgeInsets.only(bottom: 8.0, right: 20),
      child: TextField(
        enabled: isEnable,
        cursorColor: primaryColor,
        style: const TextStyle(color: primaryColor, fontSize: 15),
        keyboardType: textInputType,
        obscureText: isPasswordVisible ? false : true,
        onChanged: onChanged,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF7F8F8).withOpacity(0.7),
            prefixIconConstraints: const BoxConstraints(minWidth: 45),
            prefixIcon: prefixIcon,
            suffixIconConstraints:
            const BoxConstraints(minWidth: 45, maxWidth: 46),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: primaryColor, fontSize: 15),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0x95faf3f3) )
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0x95faf3f3) )
            )

        ),

      ),
    );
  }
}
