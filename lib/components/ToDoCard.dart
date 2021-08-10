import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todey/models/Task.dart';
import 'package:todey/models/TaskList.dart';

class ToDoCard extends StatefulWidget {
  final int index;
  final Function() notifyParent;

  const ToDoCard({required this.index, required this.notifyParent});

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    Task task = kTaskList[widget.index];

    TextEditingController textEditingController =
        TextEditingController(text: task.taskName);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 28,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Expanded(
              child: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(Color(0xFFAC6DDE)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: task.status,
                    onChanged: (a) {
                      setState(() {
                        Task newTask = Task(
                            taskName: task.taskName,
                            status: a == null ? false : a);
                        kTaskList[widget.index] = newTask;
                      });
                    }),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 6,
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  child: edit
                      ? TextField(
                          cursorColor: Color(0xFFAC6DDE),
                          maxLines: 1,
                          maxLength: 25,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                          autofocus: true,
                          controller: textEditingController,
                          onSubmitted: (text) {
                            setState(() {
                              kTaskList.removeAt(widget.index);
                              kTaskList.insert(
                                widget.index,
                                Task(
                                  taskName: text,
                                  status: task.status,
                                ),
                              );
                              edit = false;
                              widget.notifyParent();
                            });
                          },
                        )
                      : Text(
                          "${task.taskName}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    kTaskList.removeAt(widget.index);
                    kTaskList.insert(
                      widget.index,
                      Task(
                        taskName: textEditingController.text,
                        status: task.status,
                      ),
                    );
                    edit = !edit;
                    widget.notifyParent();
                  });
                },
                child: edit
                    ? FaIcon(FontAwesomeIcons.check)
                    : FaIcon(FontAwesomeIcons.edit),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  kTaskList.removeAt(widget.index);
                  print(kTaskList);
                  widget.notifyParent();
                },
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.trashAlt,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
