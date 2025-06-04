import 'package:flutter/material.dart';
import '../../../shared/utils/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  int _selectedIndex = 0;
  String searchText = '';

  void _onItemTapped(final int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Configurações')),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          const Text(
            'Troca de tema',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Switch(
            value: ThemeChange.instance.isDartTheme,
            onChanged: (final value) {
              ThemeChange.instance.changeTheme();
            },
          ),
        ],
      ),
    ),
  );
}
