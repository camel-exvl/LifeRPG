import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liferpg/view/target/dialog/finish_dialog.dart';
import 'package:liferpg/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../database/database.dart';
import '../../../model/target/task_model.dart';
import '../dialog/frequent_finish_warning_dialog.dart';
import 'task_edit_view.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView>
    with AutomaticKeepAliveClientMixin {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      // wait for the widget to be built
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => TaskViewModel(),
        child: Consumer<TaskViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () {
                  dateTime = DateTime.now();
                  return viewModel.loadTasks();
                },
                child: ReorderableListView.builder(
                  itemCount: viewModel.tasks.length,
                  itemBuilder: (context, index) {
                    TaskModel task = viewModel.tasks[index];
                    return ListTile(
                      key: ValueKey(task.id),
                      title: Text(task.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (task.description.isNotEmpty)
                            Text(task.description),
                          if (task.deadline != null &&
                              task.repeatType == RepeatType.none)
                            Text(
                                "${AppLocalizations.of(context)!.deadline}: ${DateFormat('yyyy-MM-dd HH:mm').format(task.deadline!)}"),
                          if (task.repeatType != RepeatType.none &&
                              dateTime.isBefore(task.nextScheduledAt))
                            Text(
                                "${AppLocalizations.of(context)!.nextScheduledAt}: ${DateFormat('yyyy-MM-dd').format(task.nextScheduledAt)}"),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TaskEditView(
                                viewModel: viewModel,
                                isAdd: false,
                                task: task)));
                      },
                      trailing: IconButton(
                        icon: Image(
                          image: task.nextScheduledAt.isAfter(dateTime)
                              ? const AssetImage('res/icons/finish_disable.png')
                              : const AssetImage('res/icons/finish.png'),
                          width: Theme.of(context).iconTheme.size,
                          height: Theme.of(context).iconTheme.size,
                        ),
                        onPressed: task.nextScheduledAt.isAfter(dateTime)
                            ? null
                            : () async {
                                final response =
                                    await viewModel.finishTask(task);
                                if (context.mounted) {
                                  await FinishDialog().show(context, response);
                                }
                                if (context.mounted &&
                                    response.penaltyCoefficient < 0.8) {
                                  FrequentFinishWarningDialog().show(context);
                                }
                              },
                      ),
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    viewModel.reorderTasks(oldIndex, newIndex);
                  },
                )),
            floatingActionButton: FloatingActionButton(
              heroTag: 'TaskView',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TaskEditView(
                        viewModel: viewModel,
                        isAdd: true,
                        order: viewModel.tasks.length)));
              },
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0,
              child: const Image(
                image: AssetImage('res/icons/add.png'),
              ),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => true; // keep the state of the widget
}
