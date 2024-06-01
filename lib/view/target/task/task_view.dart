import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liferpg/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../database/database.dart';
import '../../../model/task_model.dart';
import 'task_edit_view.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView>
    with AutomaticKeepAliveClientMixin {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

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
                                "${AppLocalizations.of(context)!.deadline}: ${DateFormat('yyyy-MM-dd HH:mm').format(task.deadline!)}")
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
                        icon: const Icon(Icons.add),
                        onPressed: () {},
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
              child: const Icon(Icons.add),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => true; // keep the state of the widget
}
