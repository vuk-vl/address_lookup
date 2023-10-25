import 'package:flutter/material.dart';

class ValidatedTextFieldWidget extends StatefulWidget {
  final Function onValueChanged;
  final bool isEnabled;
  final bool numbersOnly;
  final String? hintText;
  final String? initialValue;
  final bool isInputValid;

  const ValidatedTextFieldWidget({
    super.key,
    required this.onValueChanged,
    this.hintText,
    this.initialValue,
    this.isEnabled = true,
    this.isInputValid = false,
    this.numbersOnly = false,
  });

  @override
  State createState() => _ValidatedTextFieldWidgetState();
}

class _ValidatedTextFieldWidgetState extends State<ValidatedTextFieldWidget> {
  TextEditingController? _textEditingController;

  final successColor = Colors.green;
  final errorColor = Colors.red;
  final borderWidth = 2.0;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        key: widget.key,
        controller: _textEditingController,
        onChanged: (text) {
          widget.onValueChanged(text);
          setState(() {});
        },
        enabled: widget.isEnabled,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.isInputValid ? Colors.green : Colors.red,
              width: borderWidth,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: borderWidth,
            ),
          ),
        ),
      ),
    );
  }
}
