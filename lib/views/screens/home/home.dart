import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/to_do_model.dart';
import 'package:todo_app/provider/to_do_item_provider.dart';
import 'package:todo_app/utils/app_colors.dart';

import '../add_screen/add_screen.dart';
import 'todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    //
    final toDoProvider = Provider.of<ToDoItemProvider>(context);
    List<ToDo> todoList = toDoProvider.toDoList;

    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddScreen(),
                  ),
                ),
            child: Container(
                width: 60,
                height: 61,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: const Color(0xFF123EB1)),
                  shape: BoxShape.circle,
                  color: const Color(0xFF3556AB),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 4.0,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Color(0x80A8B5DE),
                      blurRadius: 1.0,
                      blurStyle: BlurStyle.inner,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(Icons.add))),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 123,
                padding: const EdgeInsets.only(left: 32, top: 19, bottom: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFF3556AB),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x263556AB),
                      blurRadius: 4.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF3556AB),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x263556AB),
                            blurRadius: 0.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Jhon',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    offset: Offset(1.0, 1.5),
                                  ),
                                ],
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'What are your plans\n for today?',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 116,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: const Color(0xFF9EB031)),
                      color: const Color(0xFFCDE53D),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0X99FFFFFF),
                            blurRadius: 0.0,
                            offset: Offset(0, 4),
                            blurStyle: BlurStyle.inner),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/trophy.png'),
                          const SizedBox(
                            width: 24,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Go Pro (No Ads)',
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 1.0,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                  color: Color(0xFF071C55),
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'No fuss, no ads, for only \$1 a \nmonth',
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 1.0,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                  color: Color(0xFF0C2971),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 23,
                    top: 0,
                    child: Container(
                      width: 66.11,
                      height: 71,
                      decoration: const BoxDecoration(color: Color(0xFF071C55)),
                      child: const Center(
                        child: SizedBox(
                          width: 22.76,
                          child: Text(
                            '\$1',
                            style: TextStyle(
                              color: Color(0xFFF2C94C),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TodoItem(
                        itemIndex: index,
                        id: todoList[index].id,
                        title: todoList[index].title,
                        isChecked: todoList[index].isChecked);
                  },
                  itemCount: todoList.length,
                ),
              )
            ],
          ),
        ));
  }
}
