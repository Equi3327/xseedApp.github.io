import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xseed_app/home/bloc/home_bloc.dart';
import 'package:xseed_app/home/repositories/home_repository.dart';
import 'package:xseed_app/home/screens/home.dart';
import 'package:xseed_app/home/widgets/my_list_view.dart';

import 'home/bloc/drawer_bloc.dart';
import 'home/screens/practice_session.dart';
import 'models/topic.dart';

final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (BuildContext context) =>
            HomeBloc(homeRepository: HomeRepository()),
      ),
      BlocProvider<DrawerBloc>(
        create: (BuildContext context) =>
            DrawerBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'XSEED App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Topic? _topic = Topic.centripetal;
  int selectedTopic = 1;

  void openPracticeSession() {
    Navigator.push(context,
            (MaterialPageRoute(builder: (context) => PracticeSession())))
        .then((value) {
      openDrawer();
    });
  }

  openDrawer() {
    globalScaffoldKey.currentState!.openDrawer();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   globalScaffoldKey.currentState!.openDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: globalScaffoldKey,
      drawerScrimColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.search),
          //   tooltip: 'Search',
          //   onPressed: () {
          //     // Do something when the search button is tapped.
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'More actions',
            onPressed: () {
              // Do something when the more actions button is tapped.
            },
          ),
        ],
      ),
      drawer: Drawer(
        // backgroundColor:Colors.white.withOpacity(0),
        shadowColor: Colors.white.withOpacity(0),
        child: MyListView(),
      ),
      body: BlocBuilder<HomeBloc, int>(
        builder: (context, state) {
          if (state == 0) {
            return Center(
              child: Text("Chapter 4 Completed"),
            );
          } else if (state == 2) {
            return Center(
              child: Text("Chapter 6 Started"),
            );
          } else if (state == 1) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(50.0),
              child: Home(),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isExtended: true,
        onPressed: () {
          openPracticeSession();
        },
        tooltip: 'Start Practice',
        icon: const Icon(Icons.psychology_outlined),
        label: const Text("Start Practice"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// SizedBox(
// width: 200,
// child: RadioListTile<Topic>(
// title: const Text('Circular Motion'),
// value: Topic.circular,
// groupValue: _topic,
// onChanged: (Topic? value) {
// setState(() {
// _topic = value;
// });
// },
// ),
// ),
// SizedBox(
// height: 24,
// width: 24,
// child: Stack(
// alignment: Alignment.center,
// children: [
// CircularProgressIndicator(
// value: 0.8,
// strokeWidth: 2.0,
// ),
// Text("80%",style: TextStyle(
// fontSize: 8.0,
// fontWeight: FontWeight.bold,
// ),),
// ],
//
// ),
// ),
// ],
// ),
