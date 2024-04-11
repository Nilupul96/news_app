import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/helpers/app_logger.dart';
import '../widgets/change_theme_bottom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings-screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AdaptiveThemeMode? _theme = AdaptiveThemeMode.system;
  @override
  void initState() {
    setInitialThemeMode();
    super.initState();
  }

  Future<void> setInitialThemeMode() async {
    _theme = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Log.info("${AdaptiveTheme.of(context).mode}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('App Theme',
                    style: Theme.of(context).textTheme.displayMedium),
                trailing: Text(
                  AdaptiveTheme.of(context).mode.modeName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                      builder: (BuildContext context) {
                        return ChangeThemeBottomSheet();
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
