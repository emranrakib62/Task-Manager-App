import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/tm_appbar.dart';
class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TmAppbar() ,
      
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key:_formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text('Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                controller: titleController,

                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),

                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'please enter title';
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                   maxLines: 6,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),

                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'please enter description';
                    }

                    return null;
                  },
                ),

              FilledButton(
                  onPressed: (){

                if(_formKey.currentState!.validate()){


        }
                },
                    child: Icon(Icons.arrow_circle_right_outlined)),

                ],
            ),
          ),
        ),
      )),
    );
  }
}
