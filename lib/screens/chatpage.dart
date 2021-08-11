import 'package:flutter/material.dart';
import 'package:fluttertask7/screens/MyList.dart';
import 'package:fluttertask7/screens/Chatting.dart';

class Chats extends StatefulWidget {
  const Chats({Key key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            thickness: 1.0,
          ),
          itemCount: getCallsList().length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonChat(name: getCallsList()[index].name)));},
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent[100],
                child: Text(
                  getCallsList()[index].name.substring(0,2),
                ),
              ),
              title: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getCallsList()[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      getCallsList()[index].time,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
