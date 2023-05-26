import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polres/light_theme.dart';
import 'package:polres/main.dart';
import 'package:polres/provider/app_theme_provider.dart';
import 'package:polres/utils/app.theme.dart';

class setting extends ConsumerWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
              title: Text(
                isDarkMode ? "Dark mode" : "Light mode",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Consumer(builder: (context, ref, child) {
                return Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    activeColor: Colors.orange,
                    onChanged: (value) {
                      ref.read(appThemeProvider.notifier).state = value;
                    },
                    value: isDarkMode,
                  ),
                );
              }),
            ),
            ListTile(
              leading: Icon(
                Icons.grid_on_sharp,
                //color: colors(context).color1,
              ),
              title: Text(
                "Story",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                //color: colors(context).color2,
              ),
              title: Text("Settings and Privacy",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            ListTile(
              leading: Icon(
                Icons.chat_outlined,
                //color: colors(context).color3,
              ),
              title: Text(
                "Help Center",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
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
