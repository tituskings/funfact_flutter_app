import 'package:flutter/material.dart';
import 'package:funfact_app/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Themeswitcher extends StatefulWidget {
  const Themeswitcher({super.key});

  @override
  State<Themeswitcher> createState() => _ThemeswitcherState();
}

class _ThemeswitcherState extends State<Themeswitcher> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<Themeprovider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("theme mode"),
          Row(
            children: [
              Switch(
                  value: themeProvider.isDarkModeChecked,
                  onChanged: (value) {
                    themeProvider.updateMode(darkMode: value);
                    setState(() {});
                  }),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Text(themeProvider.isDarkModeChecked ? "Dark mode" : "light mode"),
        ],
      ),
    );
  }
}
