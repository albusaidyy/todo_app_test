import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/widgets/done_button.dart';

import '../../../models/dummy_data.dart';
import '../../../models/to_do_model.dart';
import '../../../provider/to_do_item_provider.dart';
import '../../widgets/title_text_form_field.dart';

class EditScreen extends StatefulWidget {
  final String title;
  final int itemIndex;
  const EditScreen({super.key, required this.title, required this.itemIndex});

  @override
  State<EditScreen> createState() => _EditScreentate();
}

class _EditScreentate extends State<EditScreen> {
  TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.title;
  }

// Validates and saves the form if valid
  bool validateFields() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoItemProvider>(context);
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Task',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 39,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Task Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 0),
                      child: TitleTextFormField(
                          textEditingController: textEditingController),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.381,
              ),
              DoneButton(
                onTap: () {
                  if (validateFields()) {
                    ToDo toDo = dummyData[widget.itemIndex];
                    toDoProvider.editItem(toDo, textEditingController.text);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
