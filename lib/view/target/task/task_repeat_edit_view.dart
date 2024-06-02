import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liferpg/view/target/task/task_edit_view.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../model/target/task_model.dart';

class TaskRepeatEditView extends StatefulWidget {
  const TaskRepeatEditView(
      {super.key,
      required this.repeatTypeValue,
      required this.repeatValue,
      required this.repeatDaysOfWeek,
      required this.repeatDaysOfMonth,
      required this.deadline});

  final RepeatType repeatTypeValue;
  final int repeatValue;
  final List<int> repeatDaysOfWeek;
  final List<int> repeatDaysOfMonth;
  final DateTime? deadline;

  @override
  State<TaskRepeatEditView> createState() => _TaskRepeatEditViewState();
}

class _TaskRepeatEditViewState extends State<TaskRepeatEditView> {
  static const itemExtent = 32.0;

  late RepeatType _repeatTypeValue;
  late int _repeatValue;
  late List<int> _repeatDaysOfWeek;
  late List<int> _repeatDaysOfMonth;
  late DateTime? _deadline;

  late FixedExtentScrollController _repeatValueController;
  late FixedExtentScrollController _repeatTypeController;

  @override
  void initState() {
    super.initState();
    _repeatTypeValue = widget.repeatTypeValue;
    _repeatValue = widget.repeatValue;
    _repeatDaysOfWeek = widget.repeatDaysOfWeek;
    _repeatDaysOfMonth = widget.repeatDaysOfMonth;
    _deadline = widget.deadline;

    _repeatValueController =
        FixedExtentScrollController(initialItem: _repeatValue - 1);
    _repeatTypeController =
        FixedExtentScrollController(initialItem: _repeatTypeValue.index - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.repeat),
          actions: [
            TextButton(
              onPressed: () {
                final date = DateTime.now();
                if (_repeatTypeValue == RepeatType.weekly &&
                    _repeatDaysOfWeek.isEmpty) {
                  _repeatDaysOfWeek = [date.weekday == 7 ? 0 : date.weekday];
                }
                if (_repeatTypeValue == RepeatType.monthly &&
                    _repeatDaysOfMonth.isEmpty) {
                  _repeatDaysOfMonth = [date.day];
                }
                Navigator.pop(context, {
                  'repeatTypeValue': _repeatTypeValue,
                  'repeatValue': _repeatValue,
                  'repeatDaysOfWeek': _repeatDaysOfWeek,
                  'repeatDaysOfMonth': _repeatDaysOfMonth,
                  'deadline': _deadline
                });
              },
              child: Text(AppLocalizations.of(context)!.save),
            )
          ],
        ),
        body: Wrap(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(repeatHint(context, _repeatTypeValue, _repeatValue,
                    _repeatDaysOfWeek, _repeatDaysOfMonth)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Wrap(children: [
                RadioListTile<RepeatType>(
                  title: Text(RepeatType.none.localizedString(context)),
                  value: RepeatType.none,
                  groupValue: _repeatTypeValue,
                  onChanged: (value) {
                    setState(() {
                      _repeatTypeValue = value!;
                    });
                  },
                ),
                RadioListTile<RepeatType>(
                  title: Text(AppLocalizations.of(context)!.customRepeat),
                  value: _repeatTypeValue == RepeatType.none
                      ? RepeatType.daily
                      : _repeatTypeValue,
                  groupValue: _repeatTypeValue,
                  onChanged: (value) {
                    setState(() {
                      final date = DateTime.now();
                      _repeatValue = 1;
                      _repeatTypeValue = value!;
                      _repeatDaysOfWeek = [
                        date.weekday == 7 ? 0 : date.weekday
                      ];
                      _repeatDaysOfMonth = [date.day];
                      _repeatValueController.jumpToItem(0);
                      _repeatTypeController
                          .jumpToItem(_repeatTypeValue.index - 1);
                    });
                  },
                )
              ]),
            ),
            if (_repeatTypeValue == RepeatType.none)
              ListTile(
                  title: Text(AppLocalizations.of(context)!.deadline),
                  subtitle: Text(_deadline == null
                      ? AppLocalizations.of(context)!.noDeadline
                      : DateFormat('yyyy-MM-dd HH:mm').format(_deadline!)),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: _deadline ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 99)),
                    ).then((date) {
                      if (date != null) {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              _deadline ?? DateTime.now()),
                        ).then((time) {
                          if (time != null) {
                            setState(() {
                              _deadline = DateTime(date.year, date.month,
                                  date.day, time.hour, time.minute);
                            });
                          }
                        });
                      }
                    });
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _deadline = null;
                      });
                    },
                  ))
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Wrap(children: [
                    Wrap(children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: itemExtent * 4,
                              child: ListWheelScrollView(
                                itemExtent: itemExtent,
                                overAndUnderCenterOpacity: 0.5,
                                physics: const FixedExtentScrollPhysics(),
                                controller: _repeatValueController,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    _repeatValue = index + 1;
                                  });
                                },
                                children: List.generate(
                                    99,
                                    (index) => Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text('${index + 1}'),
                                        ))),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: itemExtent * 4,
                              child: ListWheelScrollView(
                                itemExtent: itemExtent,
                                overAndUnderCenterOpacity: 0.5,
                                physics: const FixedExtentScrollPhysics(),
                                controller: _repeatTypeController,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    _repeatTypeValue =
                                        RepeatType.values[index + 1];
                                  });
                                },
                                children: RepeatType.values
                                    .where(
                                        (element) => element != RepeatType.none)
                                    .map((scheduleType) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(scheduleType
                                              .localizedString(context)),
                                        )))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Wrap(children: [
                          if (_repeatTypeValue == RepeatType.weekly)
                            Wrap(
                                children: List<Widget>.generate(7, (index) {
                              return ChoiceChip(
                                label: Text(DayOfWeek.values[index]
                                    .localizedSingleString(context)),
                                shape: const CircleBorder(),
                                showCheckmark: false,
                                selected: _repeatDaysOfWeek.contains(index),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _repeatDaysOfWeek.add(index);
                                      _repeatDaysOfWeek.sort();
                                    } else {
                                      _repeatDaysOfWeek.remove(index);
                                    }
                                  });
                                },
                              );
                            }))
                          else if (_repeatTypeValue == RepeatType.monthly)
                            TableCalendar(
                              focusedDay: DateTime.now(),
                              firstDay: DateTime.utc(
                                  DateTime.now().year, DateTime.now().month, 1),
                              lastDay: DateTime.utc(DateTime.now().year,
                                  DateTime.now().month + 1, 0),
                              calendarFormat: CalendarFormat.month,
                              headerVisible: false,
                              calendarStyle: CalendarStyle(
                                isTodayHighlighted: false,
                                selectedDecoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  shape: BoxShape.circle,
                                ),
                                selectedTextStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                              ),
                              selectedDayPredicate: (day) {
                                return _repeatDaysOfMonth.contains(day.day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  if (_repeatDaysOfMonth
                                      .contains(selectedDay.day)) {
                                    _repeatDaysOfMonth.remove(selectedDay.day);
                                  } else {
                                    _repeatDaysOfMonth.add(selectedDay.day);
                                    _repeatDaysOfMonth.sort();
                                  }
                                });
                              },
                            ),
                        ]),
                      ),
                    )
                  ]),
                ),
              )
            // )
          ],
        ));
  }
}
