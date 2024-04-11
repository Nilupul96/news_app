import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/const/app_const.dart';
import 'package:news_app/core/helpers/extentions.dart';
import 'package:news_app/core/helpers/local_storage.dart';
import 'package:news_app/core/widgets/main_btn.dart';

import '../../../../core/helpers/app_logger.dart';

class SelectCountryScreen extends StatefulWidget {
  static const routeName = "/select-country-screen";
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String selectedCountryCode = 'us';
  Future<void> setUserCounty() async {
    await LocalStorage().setCountryCode(selectedCountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Select your\ncountry',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 32.sp),
                  ).animate(effects: [FadeEffect(duration: 500.ms)]),
                  const RSizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CountryCodePicker(
                      onChanged: (CountryCode? country) {
                        if (country != null) {
                          setState(() {
                            selectedCountryCode = country.code ?? 'us';
                            Log.debug(
                                'select country- ${country.code} ${country.name}');
                          });
                        }
                      },
                      dialogBackgroundColor:
                          context.isDark ? Colors.black : Colors.white,
                      initialSelection: 'us',
                      countryFilter: AppConst.Country_code_LIST,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      builder: (p0) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 100.w,
                                height: 60.h,
                                child: Image.asset(
                                  p0!.flagUri!,
                                  package: 'country_code_picker',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text('${p0.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 20.sp)),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: MainBtn(
                    onClick: () {},
                    lbl: "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
