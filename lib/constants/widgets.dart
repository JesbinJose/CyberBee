import 'package:flutter/material.dart';

const SizedBox k10Height = SizedBox(height: 10);
const SizedBox k20Height = SizedBox(height: 20);
const SizedBox k30Height = SizedBox(height: 30);
const SizedBox k10Width = SizedBox(width: 10);
const SizedBox k20Width = SizedBox(width: 20);
const SizedBox k30Width = SizedBox(width: 30);
Widget ratioSize(int flex) {
  return Expanded(
    flex: flex,
    child: const SizedBox.shrink(),
  );
}
