import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingView();
}

class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          icon: Icon(Icons.star),  // 换成你想要的图标
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text('Card title'),
              subtitle: Text('Card subtitle'),
            ),
          ],
        ),
      ),
    );
  }
}
