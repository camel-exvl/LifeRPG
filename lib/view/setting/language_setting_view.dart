import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/setting_viewmodel.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/database/database.dart';
import 'package:provider/provider.dart';

class LanguageSettingView extends StatefulWidget {
  const LanguageSettingView({super.key});

  @override
  State<LanguageSettingView> createState() => _LanguageSettingViewState();
}

class _LanguageSettingViewState extends State<LanguageSettingView> {
  final viewModel = SettingViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<SettingViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.language),
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
                    title: Text(AppLocalizations.of(context)!.zh),
                    trailing: viewModel.setting.languageType ==
                            LanguageType.values.indexOf(LanguageType.zh)
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      SettingModel setting = viewModel.setting.copyWith(
                          languageType:
                              LanguageType.values.indexOf(LanguageType.zh));
                      viewModel.updateSetting(setting);
                      //RestartDialog(setting: setting).show(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.en),
                    trailing: viewModel.setting.languageType ==
                            LanguageType.values.indexOf(LanguageType.en)
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      SettingModel setting = viewModel.setting.copyWith(
                          languageType:
                              LanguageType.values.indexOf(LanguageType.en));
                      viewModel.updateSetting(setting);
                      //RestartDialog(setting: setting).show(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.followingSystem),
                    trailing: viewModel.setting.languageType ==
                            LanguageType.values.indexOf(LanguageType.system)
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      SettingModel setting = viewModel.setting.copyWith(
                          languageType:
                              LanguageType.values.indexOf(LanguageType.system));
                      viewModel.updateSetting(setting);
                      //RestartDialog(setting: setting).show(context);
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
