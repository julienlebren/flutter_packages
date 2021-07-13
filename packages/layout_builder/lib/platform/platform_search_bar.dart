import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';

class PlatformSearchBar extends PlatformWidgetBase<TextField, Padding> {
  PlatformSearchBar({
    required this.controller,
    this.focusNode,
    this.placeholder,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? placeholder;

  @override
  TextField createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextField(
      style: TextStyle(fontSize: 18),
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIcon: Container(
          transform: Matrix4.translationValues(10.0, 0.0, 0.0),
          child: IconButton(
            onPressed: () => controller.clear(),
            icon: Icon(Icons.clear, color: Colors.black, size: 28),
          ),
        ),
      ),
    );
  }

  @override
  Padding createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: CupertinoSearchTextField(
        borderRadius: BorderRadius.circular(24.0),
        controller: controller,
        focusNode: focusNode,
        placeholder: placeholder,
      ),
    );
  }
}
