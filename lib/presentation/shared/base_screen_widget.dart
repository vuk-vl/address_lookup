import 'package:flutter/material.dart';

class BaseScreenWidget extends StatelessWidget {
  final Widget screenContent;
  final String title;
  final bool showAppBar;
  final EdgeInsets contentPadding;

  const BaseScreenWidget({
    super.key,
    required this.screenContent,
    required this.title,
    required this.contentPadding,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple.shade900,
        ),
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: contentPadding,
              child: screenContent,
            ),
          ),
        ),
      );
}
