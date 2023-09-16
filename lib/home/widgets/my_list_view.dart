import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xseed_app/home/bloc/home_bloc.dart';

import '../bloc/drawer_bloc.dart';

// class MyListView extends StatefulWidget with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         ListTile(
//           title: Text('Item 1'),
//         ),
//         ListTile(
//           title: Text('Item 2'),
//         ),
//       ],
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }

class MyListView extends StatefulWidget {
  MyListView({super.key});
  // int selectedTopic;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView>
    with AutomaticKeepAliveClientMixin {
  List<String> topics = [
    "Circular Motion",
    "Centripetal Force",
    "Newton's Universal Law of Gravity"
  ];
  late int _selectedTopic;
  // late bool showNavigationDrawer;

  // void handleScreenChanged(int selectedScreen) {
  //   setState(() {
  //     selectedTopic = selectedScreen;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int state = BlocProvider.of<HomeBloc>(context).state;
    _selectedTopic = state;
  }

  getIcon(int index,bool enabled) {
    if (index == 0) {
      return Icon(
        Icons.check_circle_outline_rounded,
      );
    } else if (index == 1 && !enabled) {
      return Icon(
        Icons.circle_outlined,
      );
    } else if (index == 1 && enabled) {
      return Icon(
        Icons.check_circle_outline_rounded,
      );
    }else if (index == 2 && !enabled) {
      return Icon(
        Icons.lock,
      );
    }else if (index == 2 && enabled) {
      return Icon(
        Icons.circle_outlined,
      );
    } else {}
  }

  // getSelectedTopic(int index) {
  //   if(index == 0){
  //     return Icon(Icons.check_circle_outline_rounded,color: Colors.green,);
  //   }
  //   else if(index == 1){
  //     return Icon(Icons.circle_outlined,color: Colors.black,);
  //   }
  //   else if(index == 2){
  //     return Icon(Icons.lock,color: Colors.black,);
  //   }else{
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _selectedTopic = BlocProvider.of<HomeBloc>(context).state;
    // debugPrint("fhgfhkgkhkjhjkhk");
    return ListView(
      children: [
        DrawerHeader(
          // padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text('Table of Contents')),
              Row(
                children: [
                  Image.asset(
                    "assets/images/conceptPhysics.jpg",
                    width: 100.0,
                    height: 100.0,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('Physics Class 5'),
                      ),
                      Text('Progress'),
                      Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.green,
                        //   borderRadius: BorderRadius.circular(10.0),
                        // ),
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: LinearProgressIndicator(
                            minHeight: 10.0,
                            value: _selectedTopic == 2? 1:2/3,
                          ),
                        ),
                        // LinearProgressBar(
                        //   maxSteps: 6,
                        //   progressType: LinearProgressBar.progressTypeLinear, // Use Linear progress
                        //   currentStep: 1,
                        //   progressColor: Colors.red,
                        //   backgroundColor: Colors.grey,
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // ExpansionTile(
        //   controlAffinity: ListTileControlAffinity.leading,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.zero,
        //   ),
        //   trailing: Text("0/0"),
        //   // leading: Icon(Icons.arrow_drop_down_circle_outlined),
        //   title: Text("1. Motion in Two-Dimensions"),
        //   children: [
        //     ListTile(
        //       leading: Icon(Icons.circle_outlined),
        //       title: Text('Topic 1'),
        //       onTap: () {
        //         // Do something when the home item is tapped.
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.circle_outlined),
        //       title: Text('Topic 2'),
        //       onTap: () {
        //         // Do something when the home item is tapped.
        //       },
        //     ),
        //   ],
        // ),
        ExpansionTile(
          maintainState: true,
          initiallyExpanded: true,
          controlAffinity: ListTileControlAffinity.leading,
          childrenPadding: const EdgeInsets.only(left: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          trailing: Text("2/3"),
          title: Text("2. Circular Motion and Gravity"),
          children: topics
              .map(
                (e) => BlocBuilder<DrawerBloc, bool>(
                  builder: (context, state) {
                    bool enableThirdTopic = state;
                    debugPrint("Enabled thid Topic::$enableThirdTopic");
                    if(enableThirdTopic){
                      _selectedTopic = 2;
                      BlocProvider.of<HomeBloc>(context).add(const ChangeTopic(topicIndex: 2));
                    }
                    return ListTile(
                      // autofocus : topics.indexOf(e)==_selectedTopic,
                      selected: _selectedTopic == topics.indexOf(e),
                      enabled: topics.indexOf(e) != 2 || enableThirdTopic,
                      leading: getIcon(topics.indexOf(e),enableThirdTopic),
                      trailing: SizedBox(
                        height: 24,
                        width: 24,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // CircularProgressIndicator(
                            //   value: 0.8,
                            //   strokeWidth: 2.0,
                            //   color: Colors.greenAccent,
                            // ),
                            // Text(
                            //   "80%",
                            //   style: TextStyle(
                            //     fontSize: 8.0,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      title: Text('2.${topics.indexOf(e) + 1} ${e}'),
                      onTap: () {
                        // debugPrint("+++++++++ ${selectedTopic}");
                        // setState(() {
                        //   _selectedTopic = topics.indexOf(e);
                        //   debugPrint(
                        //       "+${topics.indexOf(e)}++++++++ ${_selectedTopic}");
                        // });
                        BlocProvider.of<HomeBloc>(context)
                            .add(ChangeTopic(topicIndex: topics.indexOf(e)));

                        // Do something when the home item is tapped.
                      },
                    );
                  },
                ),
              )
              .toList(),
          // [
          //   Padding(
          //     padding: const EdgeInsets.only(left: 10.0),
          //     child:
          //     ListTile(
          //       leading: Icon(Icons.check_circle_outline_rounded,color: Colors.green,),
          //       trailing: SizedBox(
          //         height: 24,
          //         width: 24,
          //         child: Stack(
          //           alignment: Alignment.center,
          //           children: [
          //             // CircularProgressIndicator(
          //             //   value: 0.8,
          //             //   strokeWidth: 2.0,
          //             //   color: Colors.greenAccent,
          //             // ),
          //             // Text(
          //             //   "80%",
          //             //   style: TextStyle(
          //             //     fontSize: 8.0,
          //             //     fontWeight: FontWeight.bold,
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //       title: Text('2.1 Topic 1'),
          //       onTap: () {
          //         // Do something when the home item is tapped.
          //       },
          //     ),
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.only(left: 10.0),
          //     child: ListTile(
          //       leading: Icon(Icons.circle_outlined),
          //       title: Text('2.2 Topic 2'),
          //       onTap: () {
          //         // Do something when the home item is tapped.
          //       },
          //     ),
          //   ),
          //   // Container(
          //
          //   Padding(
          //     padding: const EdgeInsets.only(left: 10.0),
          //     child: ListTile(
          //       leading: Icon(Icons.lock),
          //       title: Text('2.3 Topic 3'),
          //       onTap: () {
          //         // Do something when the home item is tapped.
          //       },
          //     ),
          //   ),
          // ],
        ),
        // ExpansionTile(
        //   controlAffinity: ListTileControlAffinity.leading,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.zero,
        //   ),
        //   trailing: Text("0/10"),
        //   title: Text("3. Conservation Laws"),
        //   children: [
        //     ListTile(
        //       leading: Icon(Icons.circle_outlined),
        //       title: Text('Topic 1'),
        //       onTap: () {
        //         // Do something when the home item is tapped.
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
