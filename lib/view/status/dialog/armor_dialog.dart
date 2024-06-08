import 'package:liferpg/database/database.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/store/equipment_model.dart';

import '../../store/store_view.dart';

class ArmorDialog {
  StatusViewModel viewModel = StatusViewModel();
  final EquipmentModel equipment;
  final int armorIndex;
  final bool isEquipped;

  ArmorDialog({required this.equipment, required this.armorIndex, required this.isEquipped});

  Future<bool?> show(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            equipment.equipmentType.name(context),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(equipment.equipmentType.iconPath),
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 10),
              Text(
                equipment.equipmentType.description(context),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (equipment.equipmentType.attackPower != 0)
                    IconWithText(
                      iconPath: equipment.equipmentType.attackPowerIconPath,
                      text: " +${equipment.equipmentType.attackPower}",
                    ),
                  if (equipment.equipmentType.attackPower != 0 &&
                      equipment.equipmentType.defensePower != 0)
                    const SizedBox(width: 30), // 添加间距仅在attackPower非零时
                  if (equipment.equipmentType.defensePower != 0)
                    IconWithText(
                      iconPath:
                      equipment.equipmentType.defensePowerIconPath,
                      text: " +${equipment.equipmentType.defensePower}",
                    ),
                ],
              )
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement the purchase logic here
                    // For example, you can deduct money from the user's account and update the stock
                    // Then close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
                TextButton(
                    onPressed: () {
                      if (isEquipped) {
                        viewModel.removeArmor();
                      } else {
                        viewModel.equipArmor(armorIndex);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(isEquipped
                        ? AppLocalizations.of(context)!.takeOff
                        : AppLocalizations.of(context)!.equip)),
              ],
            )
          ],
        ));
  }
}
