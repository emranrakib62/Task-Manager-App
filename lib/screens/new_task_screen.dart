import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/task_card.dart';
import 'package:task_manager/Widgets/task_count_by_status.dart';
import 'package:task_manager/screens/tm_appbar.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index){
                return TaskCountByStatus(title: 'New', count: 10);
              }, separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              }, itemCount: 4),
            ),
          ),
 
 Expanded(
   child: ListView.separated(itemBuilder: (context,index){
   
     return TaskCard();
   }, separatorBuilder: (context,index){
   
     return Divider();
   }, itemCount: 10),
 ),
 
 TaskCard()
        ],
      ),
    );
  }
}


