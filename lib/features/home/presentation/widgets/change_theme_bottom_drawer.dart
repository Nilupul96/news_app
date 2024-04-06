import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeThemeBottomSheet extends StatefulWidget {
  const ChangeThemeBottomSheet({super.key});

  @override
  State<ChangeThemeBottomSheet> createState() => _ChangeThemeBottomSheetState();
}

class _ChangeThemeBottomSheetState extends State<ChangeThemeBottomSheet> {
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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      )),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Choose Theme',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          ListTile(
            title: Text(
              'Default',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            // contentPadding: EdgeInsets.zero,
            leading: Radio<AdaptiveThemeMode>(
              value: AdaptiveThemeMode.system,
              groupValue: _theme,
              onChanged: (AdaptiveThemeMode? value) {
                setState(() {
                  _theme = value;
                  AdaptiveTheme.of(context).setSystem();
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Light',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading: Radio<AdaptiveThemeMode>(
              value: AdaptiveThemeMode.light,
              groupValue: _theme,
              onChanged: (AdaptiveThemeMode? value) {
                setState(() {
                  _theme = value;
                  AdaptiveTheme.of(context).setLight();
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Dark',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading: Radio<AdaptiveThemeMode>(
              value: AdaptiveThemeMode.dark,
              groupValue: _theme,
              onChanged: (AdaptiveThemeMode? value) {
                setState(() {
                  _theme = value;
                  AdaptiveTheme.of(context).setDark();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
