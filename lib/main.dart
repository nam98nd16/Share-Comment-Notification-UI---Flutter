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

class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  static final creatorImageUrl =
      "https://scontent.fhan3-3.fna.fbcdn.net/v/t1.0-9/29243976_548192018885015_8848872616883126272_n.jpg?_nc_cat=106&ccb=2&_nc_sid=09cbfe&_nc_ohc=QkIdLIZDw8cAX_zKthG&_nc_ht=scontent.fhan3-3.fna&oh=56f986fd9c8c1f9a67268e13cf2f80fb&oe=5FC208CA";
  static final sharedToImageUrl =
      "https://scontent.fhph1-2.fna.fbcdn.net/v/t1.0-9/106373490_10223129652010988_6553563550268663777_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=C3tKjEg7lLkAX-N5Pxg&_nc_oc=AQkbXyvZUd8E4FwHSL-SSDaDsoySAOYwajrHjGYlZK7ohW16ZFOUgA3EKqAlh9joOhE&_nc_ht=scontent.fhph1-2.fna&oh=cfb7469c27701eee68660630e48d1c2a&oe=5FBDFAAD";
  List<dynamic> branchJudgementList = ["NG", "OK", "NG", "OK"];
  List<dynamic> likedList = [false, false, false, false];
  List<dynamic> starredList = [false, false, false, false];
  List<dynamic> displayingComments = [false, false, false, false];
  String dropdownValue = "Creator";

  var commentSection = Text("This is for comment component");
  var avatarCard = Tooltip(
      message: "Shared to Nguyễn Văn A",
      child: CircleAvatar(
          radius: 18, backgroundImage: NetworkImage(sharedToImageUrl)));
  var creatorCard = Tooltip(
      message: "Creator: Nguyễn Văn B",
      child: CircleAvatar(
          radius: 18, backgroundImage: NetworkImage(creatorImageUrl)));

  Widget buildCard(BuildContext context, int index) => GestureDetector(
        onTap: () => _navigateToNextScreen(context),
        child: Card(
          margin: EdgeInsets.all(10),
          elevation:
              3.0, // this field changes the shadow of the card 1.0 is default
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                        message: "Star",
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                              onTap: () => setState(() {
                                    starredList[index] = !starredList[index];
                                  }),
                              child: Icon(
                                Icons.star,
                                color: starredList[index]
                                    ? Colors.yellow
                                    : Colors.black,
                                size: 35,
                              )),
                        )),
                    creatorCard,
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Tooltip(
                        message: "Work date & period",
                        child: Text('2020/07/01  11:00 - 12:00')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.credit_card),
                    Tooltip(
                        message: "Company", child: Text('TNHH Company FF 2')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.credit_card),
                    Tooltip(
                        message: "Person in charge/Object",
                        child: Text('An Le Ha')),
                  ],
                ),
                Tooltip(
                  message: "Tag",
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.blueAccent),
                    child: const Text('#営業訪問'),
                  ),
                ),
                Tooltip(message: "Visit company type", child: Text('会社新規')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share),
                    avatarCard,
                    avatarCard,
                    avatarCard,
                    avatarCard,
                    avatarCard,
                    avatarCard
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${likedList[index] ? '16' : '15'}"),
                        Tooltip(
                            message: "Like",
                            child: GestureDetector(
                                onTap: () => setState(() {
                                      likedList[index] = !likedList[index];
                                    }),
                                child: Icon(
                                  Icons.thumb_up,
                                  color: likedList[index]
                                      ? Colors.blue
                                      : Colors.black,
                                ))),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Branch manager's comment"),
                                content: new Text(
                                    "This is for branch-manager-comment component"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              )),
                      child: Tooltip(
                          message: "Branch manager's comment",
                          child: Icon(Icons.comment_bank)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("3"),
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                    title: new Text("Share and comment list"),
                                    content: new Text(
                                        "This is for comment component"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  )),
                          child: Tooltip(
                              message: "Note", child: Icon(Icons.comment)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                      child: RaisedButton(
                        padding: EdgeInsets.all(5),
                        onPressed: () {
                          setState(() {
                            branchJudgementList[index] =
                                branchJudgementList[index] == "OK" ? "" : "OK";
                          });
                        },
                        child: Text("OK"),
                        color: branchJudgementList[index] == "OK"
                            ? Colors.blue
                            : Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: RaisedButton(
                        padding: EdgeInsets.all(5),
                        onPressed: () {
                          setState(() {
                            branchJudgementList[index] =
                                branchJudgementList[index] == "NG" ? "" : "NG";
                          });
                        },
                        child: Text("NG"),
                        color: branchJudgementList[index] == "NG"
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                    Tooltip(
                        message: "Last change",
                        child: Text('2020/10/06  11:42',
                            style: TextStyle(fontStyle: FontStyle.italic)))
                  ],
                ),
                displayingComments[index] ? commentSection : Container()
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Total results: 4"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SORT BY",
                style: TextStyle(color: Colors.green),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Creator', 'Work date', 'Tag']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          buildCard(context, 0),
          buildCard(context, 1),
          buildCard(context, 2),
          buildCard(context, 3)
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewScreen()));
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Business detail')),
      body: Center(
        child: Text(
          'This is business detail',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
