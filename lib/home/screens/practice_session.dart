import 'package:flutter/material.dart';
import 'package:tex_markdown/tex_markdown.dart';

import 'question.dart';

class PracticeSession extends StatefulWidget {
  const PracticeSession({super.key});

  @override
  State<PracticeSession> createState() => _PracticeSessionState();
}

class _PracticeSessionState extends State<PracticeSession> {
  PageController controller = PageController();
  String formula = r'$a_c =\frac{v^2}{r}$';
  final List<Widget> _list = [];
  // [
  //   new Center(child:new Pages(text: "Page 1",)),
  //   new Center(child:new Pages(text: "Page 2",)),
  //   new Center(child:new Pages(text: "Page 3",)),
  //   new Center(child:new Pages(text: "Page 4",))
  // ];
  int _curr = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      _list.add(Question(controller: controller));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text("Gravitational Force"),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.info_rounded),
            onPressed: () {
              // Do something when the search button is tapped.
            },
            label: Text("Tour"),
          ),
          TextButton.icon(
            icon: Icon(Icons.pause_circle_filled),
            onPressed: () {
              // Do something when the search button is tapped.
            },
            label: Text("Stop for now"),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(100),
        width: width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.green,
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  width: 600,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: LinearProgressIndicator(
                      minHeight: 50.0,
                      value: _curr / _list.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${_curr}/${_list.length}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purpleAccent,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 400,
              child: PageView(
                scrollDirection: Axis.horizontal,

                // reverse: true,
                // physics: BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (num) {
                  setState(() {
                    _curr = num + 1;
                  });
                },
                children: _list,
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Centripetal Acceleration Formula::"),
            Center(
              child: TexMarkdown(formula,style: const TextStyle(
                color: Colors.red,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final text;
  Pages({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}
