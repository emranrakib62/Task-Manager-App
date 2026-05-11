import 'package:flutter/material.dart';
class TmAppbar extends StatelessWidget implements PreferredSize{
  const TmAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:  NetworkImage('https://avatars.githubusercontent.com/u/122172406?v=4&size=64'),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Emranul Hoque',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white
              ),
              ),
              Text('emranrakib01862@gmail.com',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white
                ),
              ),
            ],
          )


        ],

      ),
       
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout,color:Colors.white)),
      ],
      
      
    );
  }

  @override
  
  Widget get child => throw UnimplementedError();

  @override
 
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
