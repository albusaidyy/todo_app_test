import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/to_do_item_provider.dart';
import '../../widgets/done_button.dart';
import '../../widgets/title_text_form_field.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
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
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoItemProvider>(context);
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add New Task',
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
                      child: TitleTextFormField(textEditingController: textEditingController),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.381,
              ),
              DoneButton(
                onTap: () {
                  //add item and go back
                  if (validateFields()) {
                    toDoProvider.addNewItem(DateTime.now().toString(),
                        textEditingController.text, false);
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

