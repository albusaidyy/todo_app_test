import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/screens/edit_screen/edit_screen.dart';

import '../../../models/dummy_data.dart';
import '../../../models/to_do_model.dart';
import '../../../provider/to_do_item_provider.dart';
import '../../../utils/app_colors.dart';

class TodoItem extends StatefulWidget {
  final int itemIndex;
  final String id;
  final String title;
  final bool isChecked;
  const TodoItem({
    super.key,
    required this.itemIndex,
    required this.id,
    required this.title,
    required this.isChecked,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool? _isChecked;
  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoItemProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 91,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 4.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  _isChecked = !_isChecked!;
                  ToDo toDo = dummyData[widget.itemIndex];
                  toDoProvider.editDone(toDo);
                });
              },
              child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isChecked
                        ? const Color(0xFF53DA69)
                        : Colors.white,
                    border: Border.all(
                      width: 1.5,
                      color: widget.isChecked
                          ? const Color(0xFF49C25D)
                          : AppColors.mainBlue,
                    ),
                  ),
                  child: widget.isChecked
                      ? const Icon(
                          Icons.check,
                          color: Color(0xFF399649),
                        )
                      : null),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: widget.isChecked
                      ? AppColors.textDone
                      : AppColors.textNotDone,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  decoration: widget.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(
                      itemIndex: widget.itemIndex, title: widget.title),
                ),
              ),
              child: Container(
                width: 51,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: AppColors.mainBlue)),
                child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        color: AppColors.mainBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
