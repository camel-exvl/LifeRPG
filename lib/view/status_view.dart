
import 'package:flutter/material.dart';
import '../model/attribute_model.dart';
import 'package:provider/provider.dart';
import '../viewmodel/status_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StatusViewModel(),
      child: Consumer<StatusViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              SingleChildScrollView(
                  child: Column (
                    children: [
                      StatusCard(viewModel: viewModel),
                      AttributesCard(viewModel: viewModel),
                    ],
                  )
              )
            ],
          );
        },
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final StatusViewModel viewModel;

  const StatusCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: ListTile(
              title: Text(
                '${AppLocalizations.of(context)!.lifeLevel}  ${AppLocalizations.of(context)!.lv}${viewModel.statusModel.level}',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 50.0, 0.0),
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          value: viewModel.getExpPercent(),
                          semanticsLabel: AppLocalizations.of(context)!.lifeLevelExperienceBar,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              '${viewModel.statusModel.exp}/${viewModel.statusModel.levelExpMap[viewModel.statusModel.level] ?? 99999}',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '${AppLocalizations.of(context)!.lifeCompletedTargets}\n${AppLocalizations.of(context)!.workHard}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}

class AttributesCard extends StatelessWidget {
  final StatusViewModel viewModel;

  const AttributesCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.attributes,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              Column(
                children: viewModel.statusModel.attributes.entries.map((attribute) {
                  return AttributeRow(viewModel: viewModel, attribute: attribute.value);
                }).toList(),
              )
            ]
        ),
      ),
    );
  }
}

class AttributeRow extends StatelessWidget {
  final StatusViewModel viewModel;
  final AttributeModel attribute;

  const AttributeRow({super.key, required this.viewModel, required this.attribute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                attribute.iconPath,
                width: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 15) * 1.2,
                height: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 15) * 1.2,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Text(
                  '${viewModel.getAttributeName(attribute.name, context)} ${AppLocalizations.of(context)!.lv}${attribute.level}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  )
              )
          ),
          Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: attribute.exp / (attribute.levelExpMap[attribute.level] ?? 99999),
                      semanticsLabel: AppLocalizations.of(context)!.attributeLevelExperienceBar,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${attribute.exp}/${attribute.levelExpMap[attribute.level] ?? 99999}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                          )
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}