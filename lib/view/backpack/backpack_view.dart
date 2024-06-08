import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BackpackView extends StatefulWidget {
  const BackpackView({super.key});

  @override
  State<BackpackView> createState() => _BackpackView();
}

class _BackpackView extends State<BackpackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.backpack),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined), // 换成你想要的图标
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Placeholder(),
    );
  }
}
