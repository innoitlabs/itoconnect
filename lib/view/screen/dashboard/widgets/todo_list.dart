import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/dashboard/dashboard_cubit.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 5),
          height: 205,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).highlightColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5)
            ],
            border: Border.all(
              width: 1,
              color: const Color(0xFFD8D8D8),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'To Do List',
                style: titleTabHeader,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: CustomTextField(
                        hintText: "Add your new todo ",
                        textInputType: TextInputType.text,
                        controller: todoController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xFF528BB8),
                        ),
                        width: 32,
                        height: 32,
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                      onTap: () {
                        if (todoController.text.isNotEmpty) {
                          BlocProvider.of<DashboardCubit>(context)
                              .addTodo(todoController.text);
                          todoController.clear();
                        }
                      },
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 115,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 5),
                      margin:
                          const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xFFD8D8D8)),
                      ),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Text(
                              state.todoList[index].todoTitle ?? '',
                              style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF444444)),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xFFC0534F),
                              ),
                              onPressed: (){
                              BlocProvider.of<DashboardCubit>(context)
                                  .deleteTodo(state.todoList[index].todoId ?? 0);
                                todoController.clear();
                              },
                            ),
                      ]),
                    );
                  },
                  itemCount: state.todoList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
