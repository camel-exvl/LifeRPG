import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/setting_viewmodel.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/database/database.dart';
import 'package:provider/provider.dart';

class BrightnessSettingView extends StatefulWidget {
  const BrightnessSettingView({super.key});

  @override
  State<BrightnessSettingView> createState() => _BrightnessSettingView();
}

class _BrightnessSettingView extends State<BrightnessSettingView> {
  final viewModel = SettingViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<SettingViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.brightness),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.dayMode),
                    trailing: viewModel.setting.brightnessType ==
                            BrightnessType.values.indexOf(BrightnessType.light)
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      SettingModel setting = viewModel.setting.copyWith(
                          brightnessType: BrightnessType.values
                              .indexOf(BrightnessType.light));
                      viewModel.updateSetting(setting);
                      //RestartDialog(setting: setting).show(context);
                    },
                  ),
                  ListTile(
                      title: Text(AppLocalizations.of(context)!.nightMode),
                      trailing: viewModel.setting.brightnessType ==
                              BrightnessType.values.indexOf(BrightnessType.dark)
                          ? const Icon(Icons.check)
                          : null,
                      onTap: () {
                        SettingModel setting = viewModel.setting.copyWith(
                            brightnessType: BrightnessType.values
                                .indexOf(BrightnessType.dark));
                        viewModel.updateSetting(setting);
                        //RestartDialog(setting: setting).show(context);
                      }),
                  ListTile(
                      title:
                          Text(AppLocalizations.of(context)!.followingSystem),
                      trailing: viewModel.setting.brightnessType ==
                              BrightnessType.values
                                  .indexOf(BrightnessType.system)
                          ? const Icon(Icons.check)
                          : null,
                      onTap: () {
                        SettingModel setting = viewModel.setting.copyWith(
                            brightnessType: BrightnessType.values
                                .indexOf(BrightnessType.system));
                        viewModel.updateSetting(setting);
                        //RestartDialog(setting: setting).show(context);
                      }),
                ],
              ),
            ),
          );
        }));
  }
}
