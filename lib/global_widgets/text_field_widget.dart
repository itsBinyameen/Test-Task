import 'package:flutter/material.dart';
import 'package:test_task/core/theme/text_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.onchange,
  });

  final TextEditingController textEditingController;
  final Function onchange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (val) => onchange(val),
      decoration: InputDecoration(
        hintText: "Search",
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyles.bodyText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
      ),
    );
  }
}
