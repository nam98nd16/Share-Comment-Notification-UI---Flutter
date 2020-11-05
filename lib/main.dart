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
  static final double horizontalAlignment = 15;
  static final double verticalAlignment = 10;
  static final creatorImageUrl =
      "https://scontent.fhan3-3.fna.fbcdn.net/v/t1.0-9/29243976_548192018885015_8848872616883126272_n.jpg?_nc_cat=106&ccb=2&_nc_sid=09cbfe&_nc_ohc=QkIdLIZDw8cAX_zKthG&_nc_ht=scontent.fhan3-3.fna&oh=56f986fd9c8c1f9a67268e13cf2f80fb&oe=5FC208CA";
  static final sharedToImageUrl =
      "https://scontent.fhph1-2.fna.fbcdn.net/v/t1.0-9/106373490_10223129652010988_6553563550268663777_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=C3tKjEg7lLkAX-N5Pxg&_nc_oc=AQkbXyvZUd8E4FwHSL-SSDaDsoySAOYwajrHjGYlZK7ohW16ZFOUgA3EKqAlh9joOhE&_nc_ht=scontent.fhph1-2.fna&oh=cfb7469c27701eee68660630e48d1c2a&oe=5FBDFAAD";
  List<dynamic> branchJudgementList = ["NG", "OK", "NG", "OK"];
  List<dynamic> likedList = [false, false, false, false];
  List<dynamic> starredList = [false, false, false, false];
  var sortDirection = "ASC";
  String dropdownValue = "Creator ascending";
  var _selectedStartDatecontroller = TextEditingController();
  var _selectedEndDatecontroller = TextEditingController();
  var commentSection = Text("This is for comment component");
  var avatarCard = Tooltip(
      message: "Shared to Nguyễn Văn A",
      child: CircleAvatar(
          radius: 18, backgroundImage: NetworkImage(sharedToImageUrl)));
  Widget getSharedTile(BuildContext context) => ListTile(
        leading: avatarCard,
        title: Text('Nguyễn Phi Lê'),
      );
  var creatorCard = Tooltip(
      message: "Creator: Nguyễn Văn B",
      child: CircleAvatar(
          radius: 18, backgroundImage: NetworkImage(creatorImageUrl)));

  var filteredTag;
  Widget buildTagButton(BuildContext context, tagName) => RaisedButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        setState(() {
          if (filteredTag != tagName)
            filteredTag = tagName;
          else
            filteredTag = null;
        });
      },
      child: Text(tagName),
      color: filteredTag == tagName ? Colors.blue : Colors.white,
      textColor: filteredTag == tagName ? Colors.white : Colors.blue);

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectDate(
      BuildContext context, selectedDate, textController) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        textController.text =
            picked.toString().substring(0, 10).replaceAll("-", "/");
      });
  }

  Widget buildCard(BuildContext context, int index) => GestureDetector(
        onTap: () => _navigateToNextScreen(context),
        child: Card(
          elevation: 0.3,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0, horizontal: horizontalAlignment),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        creatorCard,
                        Padding(padding: EdgeInsets.only(right: 5)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nguyễn Văn B",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                Tooltip(
                                    message: "Work date & period",
                                    child: Text(
                                      '2020/07/01  11:00 - 12:00',
                                      style:
                                          TextStyle(color: Color(0xff657786)),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tooltip(
                                    message: "Last change",
                                    child: Text(
                                        'Last change: 2020/10/06  11:42',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 10))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Tooltip(
                        message: "Star",
                        child: GestureDetector(
                            onTap: () => setState(() {
                                  starredList[index] = !starredList[index];
                                }),
                            child: Icon(
                              starredList[index]
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: starredList[index]
                                  ? Colors.yellow
                                  : Colors.black,
                              size: 30,
                            ))),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.credit_card_outlined),
                    Tooltip(
                        message: "Company", child: Text('TNHH Company FF 2')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.credit_card_outlined),
                    Tooltip(
                        message: "Person in charge/Object",
                        child: Text('An Le Ha')),
                  ],
                ),
                Tooltip(message: "Visit company type", child: Text('会社新規')),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Tooltip(
                  message: "Tag",
                  child: Text(
                    '#営業訪問',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Tooltip(
                            message: "Like",
                            child: GestureDetector(
                                onTap: () => setState(() {
                                      likedList[index] = !likedList[index];
                                    }),
                                child: Icon(
                                  likedList[index]
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                  color: likedList[index]
                                      ? Colors.blue
                                      : Colors.black,
                                ))),
                        Text("${likedList[index] ? '16' : '15'}"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              message: "Note",
                              child: Icon(Icons.mode_comment_outlined)),
                        ),
                        Text("3"),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: RaisedButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                branchJudgementList[index] =
                                    branchJudgementList[index] == "OK"
                                        ? ""
                                        : "OK";
                              });
                            },
                            child: Text("OK"),
                            color: branchJudgementList[index] == "OK"
                                ? Colors.blue
                                : Colors.white,
                            textColor: branchJudgementList[index] == "OK"
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 5)),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: RaisedButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                branchJudgementList[index] =
                                    branchJudgementList[index] == "NG"
                                        ? ""
                                        : "NG";
                              });
                            },
                            child: Text("NG"),
                            color: branchJudgementList[index] == "NG"
                                ? Colors.red
                                : Colors.white,
                            textColor: branchJudgementList[index] == "NG"
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
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
                          child: Icon(Icons.comment_bank_outlined)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () => showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                      contentPadding: EdgeInsets.all(0),
                                      title: new Text("Shared to"),
                                      content: Container(
                                        width: 300,
                                        height: 300,
                                        child: ListView(children: <Widget>[
                                          getSharedTile(context),
                                          getSharedTile(context),
                                          getSharedTile(context),
                                          getSharedTile(context),
                                          getSharedTile(context),
                                          getSharedTile(context)
                                        ]),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    )),
                            child: Icon(Icons.share_outlined)),
                        Text("6"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 10)),
              Text("Sort by"),
              Padding(padding: EdgeInsets.only(right: 10)),
              DropdownButton<String>(
                value: dropdownValue,
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
                items: <String>[
                  'Creator ascending',
                  'Work date ascending',
                  'Tag ascending',
                  'Creator descending',
                  'Work date descending',
                  'Tag descending'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 10)),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    border: OutlineInputBorder(),
                    labelText: 'Creator',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 5)),
              Container(
                width: 110,
                height: 40,
                child: TextField(
                  controller: _selectedStartDatecontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    border: OutlineInputBorder(),
                    labelText: 'StartDate',
                  ),
                  onTap: () => _selectDate(
                      context, selectedStartDate, _selectedStartDatecontroller),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 5)),
              Container(
                width: 110,
                height: 40,
                child: TextField(
                  controller: _selectedEndDatecontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    border: OutlineInputBorder(),
                    labelText: 'EndDate',
                  ),
                  onTap: () => _selectDate(
                      context, selectedEndDate, _selectedEndDatecontroller),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: buildTagButton(context, "#対面"),
              ),
              buildTagButton(context, "#TEL対応"),
              buildTagButton(context, "#TV会議"),
              Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: buildTagButton(context, "#その他")),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 10)),
              Text("Total results: 4"),
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
