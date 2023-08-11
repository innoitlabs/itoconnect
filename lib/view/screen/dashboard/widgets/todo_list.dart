import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
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
              width: 1, color: Color(0xFFD8D8D8))),
      child: Column(
        children: [
          Text(
            'To Do List',
            style: titleTabHeader,
          ),
          SizedBox(height: 5,),
          Container(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.75, child: CustomTextField(
                  hintText: "Add your new todo ",
                  textInputType: TextInputType.text,
                ),),
                SizedBox(width: 10,),
                InkWell(child: Container(decoration: BoxDecoration(borderRadius:
                BorderRadius.circular(3),color: Color(0xFF528BB8),),width: 32, height: 32 ,child: const Icon(Icons.add,),) , onTap: (){},)
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            height: 115,
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index)  {
                  return Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFFD8D8D8)),
                    ),
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: Row(
                        children:[
                          Text("Call to Counsellor", style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF444444)) ,),
                        ]
                    ),
                  );
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
