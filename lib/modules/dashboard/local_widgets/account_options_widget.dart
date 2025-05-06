import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const AccountOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
