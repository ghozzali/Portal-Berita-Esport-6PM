import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
              titleSmall: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 11),
            )
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.grey,
            ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black54, size: 25)),
      ),
      home: const setting(),
    );
  }
}

// Color(0xFFA394C2)
class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text(
                "Light/Dark Theme",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.grid_on_sharp),
              title: Text(
                "Story",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text(
                "Group",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text(
                "Media and Photo",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings and Privacy",
                style: Theme.of(context).textTheme.titleSmall ?? TextStyle(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined),
              title: Text(
                "Help Center",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                "Notification",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
