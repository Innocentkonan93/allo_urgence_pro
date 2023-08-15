import 'package:flutter/material.dart';

class FormItem {
  final Widget item;
  FormItem({
    required this.item,

  });

  FormItem copyWith({
    Widget? item,
    String? label,
  }) {
    return FormItem(
      item: item ?? this.item,

    );
  }
}
