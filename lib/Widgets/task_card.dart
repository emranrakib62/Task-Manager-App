import 'package:flutter/material.dart';
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text('Task title',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize:18
          )),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Des'),
              Text('Date:27 April 2026'),
              Row(
                children: [
                  Chip(label: Text('New',

                  ),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded,color: Colors.orange),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}