import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/pages/edit_note_page.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, EditNotePage.id);
      },
      child: Container(
        height: 250,
        margin: EdgeInsets.only(top: 8.0,right: 16.0,left: 16.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter tips',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Build Your Carear with Momen Albash',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black26.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete,size: 40,),
                  ),
                  Text(
                    'May 21,2002',
                    style: TextStyle(
                      color: Colors.black26.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
