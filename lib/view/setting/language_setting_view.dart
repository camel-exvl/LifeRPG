import 'package:flutter/material.dart';

class LanguageSettingView extends StatefulWidget {
  const LanguageSettingView({super.key});

  @override
  State<LanguageSettingView> createState() => _LanguageSettingViewState();
}

class _LanguageSettingViewState extends State<LanguageSettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Setting'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),  // 换成你想要的图标
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Card(
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