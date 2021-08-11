import 'package:flutter/material.dart';
import 'package:fluttertask7/screens/MyList.dart';

class Calls extends StatelessWidget {
  const Calls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Call Log'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.call_received),
                text: 'Incoming',
              ),
              Tab(
                icon: Icon(Icons.call_made),
                text: 'Outgoing',
              ),
              Tab(
                icon: Icon(Icons.call_missed),
                text: 'Missed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Incoming(),
            Outgoing(),
            MissedCalls(),
          ],
        ),
      ),
    );
  }
}

class MissedCalls extends StatelessWidget {
  const MissedCalls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MyCallList(
        callIcon: Icon(
          Icons.call_missed,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Outgoing extends StatelessWidget {
  const Outgoing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MyCallList(
        callIcon: Icon(
          Icons.call_made,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class Incoming extends StatelessWidget {
  const Incoming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MyCallList(
        callIcon: Icon(
          Icons.call_received,
          color: Colors.green,
        ),
      ),
    );
  }
}

class MyCallList extends StatelessWidget {
  const MyCallList({Key key, this.callIcon}) : super(key: key);
  final Icon callIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>Divider(),
      itemCount: getCallsList().length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueAccent[100],
          child: Text(
            getCallsList()[index].name.substring(0, 1),
          ),
        ),
        title: Text(
          getCallsList()[index].name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  callIcon,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      getCallsList()[index].number,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                getCallsList()[index].time,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
