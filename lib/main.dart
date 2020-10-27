import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Share & Comment Notification';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var avatarCard = CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(
          'https://scontent.fhph1-2.fna.fbcdn.net/v/t1.0-9/106373490_10223129652010988_6553563550268663777_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=C3tKjEg7lLkAX-N5Pxg&_nc_oc=AQkbXyvZUd8E4FwHSL-SSDaDsoySAOYwajrHjGYlZK7ohW16ZFOUgA3EKqAlh9joOhE&_nc_ht=scontent.fhph1-2.fna&oh=cfb7469c27701eee68660630e48d1c2a&oe=5FBDFAAD'));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.credit_card),
                Text('TNHH Company FF 2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.credit_card),
                Text('An Le Ha'),
              ],
            ),
            const DecoratedBox(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: const Text('#営業訪問'),
            ),
            Text('会社新規'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                avatarCard,
                avatarCard,
                avatarCard,
                avatarCard,
                avatarCard,
                avatarCard
              ],
            ),
            Text('2020/07/01  11:00 - 12:00'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Branch manager's comment",
                    ),
                  ),
                ),
                Text('View business detail')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.thumb_up),
                Icon(Icons.comment),
                Icon(Icons.star),
                RaisedButton(
                  onPressed: () {},
                  child: Text("OK"),
                  color: Colors.blue,
                ),
                Text('2020/10/06  11:42')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
