import 'package:flutter/material.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Center(
                  child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 100,
              )),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Card(child: ListTile(
                leading: Icon(Icons.email,color: Colors.black,size: 20,),
                title: Text("dsfhgkljsdehg@gmail.com"),
                trailing: Icon(Icons.edit,color: Colors.black,size: 20,),
              )),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Card(child: ListTile(
                leading: Icon(Icons.key_sharp,color: Colors.black,size: 20,),
                title: Text("************"),
                trailing: Icon(Icons.edit,color: Colors.black,size: 20,),
              )),
            )
          ],
        ),
      ),
    );
  }
}
