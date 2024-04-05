import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors.dart';

class MainBtn extends StatefulWidget {
  final String lbl;
  final Function onClick;
  final bool isLoading;
  final bool isEnabled;
  final Color? bgColor;
  final String? icon;
  final bool disableSplash;
  final double? borderRadius;

  const MainBtn(
      {Key? key,
      this.lbl = "",
      this.bgColor,
      required this.onClick,
      this.isLoading = false,
      this.isEnabled = true,
      this.disableSplash = false,
      this.icon,
      this.borderRadius = 12.0})
      : super(key: key);

  @override
  State<MainBtn> createState() => _MainBtnState();
}

class _MainBtnState extends State<MainBtn> {
  bool showAnim = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.bgColor ?? AppColors.primaryRed,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
          ),
          onPressed: widget.isEnabled
              ? !widget.isLoading
                  ? () async {
                      await widget.onClick();
                    }
                  : null
              : null,
          child: widget.isLoading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(widget.lbl,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.white))),
    );
  }
}
