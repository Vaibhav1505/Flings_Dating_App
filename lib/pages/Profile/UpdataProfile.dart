// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flings_flutter/Providers/UpdateProfileProviders.dart';
import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/pages/Profile/BasicInformationSection.dart';
import 'package:flings_flutter/pages/Profile/YourHabitsSection.dart';
import 'package:flings_flutter/routes/apiStrings.dart';
import 'package:flings_flutter/routes/routes.dart';
import 'package:flings_flutter/services/InterceptedHTTP.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var interceptedHttpRequest = InterceptedHTTP();

  // String? selectedEducation;
  // String? selectedReligion;
  // String? selectedDrinks;
  // String? selectedSmoke;
  // String? selectedExcercisingHabit;
  // String? selectedDiet;
  // String? selectedSocialMedia;

  Future<void> sendUpdateData(UpdateProfileProviders provider) async {
    var extra = {
      "about": provider.aboutUser,
      "job": provider.userJob,
      "company": provider.userCompany,
      "education": provider.selectedEduation,
      "religion": provider.selectedReligion,
      "drinking": provider.selectedDrink,
      "smoking": provider.selectedSmoking,
      "workout": provider.selectedWorkout,
      "diet": provider.selectedDiet,
      "socialMedia": provider.selectedSocialMedia
    };
    print(extra);

    var recievedResponse =
        await interceptedHttpRequest.postHttp(UPDATE_PROFILE, extra);
    print(recievedResponse);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UpdateProfileProviders>(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            OnPressedButton(
                horizontalPadding: 10,
                verticalPadding: 10,
                buttonTextColor: Colors.black,
                buttonText: "Done",
                onpressed: () {
                  sendUpdateData(provider);
                  print("Changes Done");
                  Navigator.pushNamed(context, MyRoutes.bottomNavigationBar);
                },
                buttonColor: Colors.white,
                buttonBorderRadius: 50,
                buttonIcon: Icon(
                  CupertinoIcons.check_mark_circled,
                  color: Colors.black,
                )),
            SizedBox(
              width: 20,
            ),
          ],
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: MyTheme.appBarMainHeading, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),

              //{BASIC INFORMAITON SECTION}

              BasicInfoSection(
                education: provider.selectedEduation,
                religion: provider.selectedReligion,
              ),

              SizedBox(
                height: 25,
              ),
              //{YOUR HABITS SECTION}

              YourHabitsSection(
                  drinking: provider.selectedDrink,
                  smoking: provider.selectedSmoking,
                  workout: provider.selectedWorkout,
                  diet: provider.selectedDiet,
                  socialMedia: provider.selectedSocialMedia)
            ],
          ),
        ),
      ),
    );
  }
}
