
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/status_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> with AutomaticKeepAliveClientMixin {
  final viewModel = StatusViewModel();
  Future<bool>? loadResult;  // 声明 future 变量

  @override
  void initState() {
    super.initState();
    loadResult = loadData(); // 在initState函数中加载数据
  }

  Future<bool> loadData() async {
    await viewModel.loadStatus();
    await viewModel.loadAttributes();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<bool>(
      future: loadResult,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
              child: Column(
                children: [
                  StatusCard(viewModel: viewModel),
                  AttributesCard(viewModel: viewModel),
                ],
              )
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
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
                '${AppLocalizations.of(context)!.lifeLevel}  ${AppLocalizations.of(context)!.lv}${viewModel.status.level}',
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
                              '${viewModel.status.exp}/${viewModel.getLifeLevelMaxExp(viewModel.status.level)}',
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
                      '${AppLocalizations.of(context)!.lifeChickenSoup}\n${AppLocalizations.of(context)!.workHard}',
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
                children: viewModel.attributes.map((attribute) {
                  return AttributeRow(viewModel: viewModel, attribute: attribute);
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
                      value: attribute.exp / (viewModel.getAttributeMaxExp(attribute.level)),
                      semanticsLabel: AppLocalizations.of(context)!.attributeLevelExperienceBar,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${attribute.exp}/${viewModel.getAttributeMaxExp(attribute.level)}',
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