import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/instance_dungeon_model.dart';
import 'package:liferpg/model/store/item_model.dart';
import 'package:liferpg/viewmodel/backpack_viewmodel.dart';
import 'package:provider/provider.dart';

class BackpackView extends StatefulWidget {
  const BackpackView({super.key});

  @override
  State<BackpackView> createState() => _BackpackView();
}

class _BackpackView extends State<BackpackView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BackpackViewmodel(),
      child: Consumer<BackpackViewmodel>(
        builder: (context, viewModel, child) {
          viewModel.loadBackpackItems(); // TODO
          final backpackItems = viewModel.backpackItems;
          final equipmentItems = backpackItems.whereType<EquipmentType>();
          final itemItems = backpackItems.whereType<ItemType>();
          final instanceDungeonItems =
              backpackItems.whereType<InstanceDungeonType>();
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.backpack),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: ListView(
              children: <Widget>[
                if (equipmentItems.isNotEmpty)
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.equipments),
                  ),
                ...equipmentItems.map((equipment) {
                  return BackpackItem(
                    title: equipment.name(context),
                    description: equipment.description(context),
                    image: equipment.iconPath,
                  );
                }),
                if (itemItems.isNotEmpty)
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.items),
                  ),
                ...itemItems.map((item) {
                  return const BackpackItem();
                }),
                if (instanceDungeonItems.isNotEmpty)
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.instanceDungeon),
                  ),
                ...instanceDungeonItems.map((instanceDungeon) {
                  return const BackpackItem();
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BackpackItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final Function()? onTap;
  final int? amount;

  const BackpackItem({
    super.key,
    this.title,
    this.description,
    this.image,
    this.onTap,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Expanded(child: Text(title ?? "")),
        amount != null ? Text("x$amount") : Container()
      ]),
      subtitle: Text(description ?? ""),
      leading: image != null
          ? Image.asset(
              image!,
            )
          : null,
      onTap: onTap,
    );
  }
}
