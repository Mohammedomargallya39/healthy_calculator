import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/modules/calories_per_day.dart';
import 'package:healthy_states/modules/lean_body_mass.dart';
import 'package:healthy_states/modules/water_intake.dart';

import 'body_fat.dart';
import 'body_mass_index.dart';
import 'ideal_body_weight.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.03,
                size.height * 0.01,
                size.width * 0.03,
                size.height * 0.01
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/select.svg',
                    width: size.width,
                    height: size.height * 0.2,
                  ),
                  SizedBox(height: size.height * 0.05,),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/body_mass.svg',
                                    width: size.width,
                                    height: size.height * 0.1,
                                  ),
                                  SizedBox(height: size.height * 0.01,),
                                  Text(
                                    'Body Mass Index',
                                    style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              navigateTo(context, BodyMassIndex());
                            },
                          ),
                      ),
                      SizedBox(width: size.width * 0.05,),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/calories.svg',
                                  width: size.width,
                                  height: size.height * 0.1,
                                ),
                                SizedBox(height: size.height * 0.01,),
                                Text(
                                  'Calories Per Day',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            navigateTo(context, CaloriesPerDay());
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/body_fat.svg',
                                  width: size.width,
                                  height: size.height * 0.1,
                                ),
                                SizedBox(height: size.height * 0.01,),
                                Text(
                                  'Body Fat',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            navigateTo(context, BodyFat());
                          },
                        ),
                      ),
                      SizedBox(width: size.width * 0.05,),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/water.svg',
                                  width: size.width,
                                  height: size.height * 0.1,
                                ),
                                SizedBox(height: size.height * 0.01,),
                                Text(
                                  'Water Intake',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            navigateTo(context, WaterIntake());
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/body_weight.svg',
                                  width: size.width,
                                  height: size.height * 0.1,
                                ),
                                SizedBox(height: size.height * 0.01,),
                                Text(
                                  'Ideal Body Weight',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            navigateTo(context, IdealBodyWeight());
                          },
                        ),
                      ),
                      SizedBox(width: size.width * 0.05,),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/lean_body_mass.svg',
                                  width: size.width,
                                  height: size.height * 0.1,
                                ),
                                SizedBox(height: size.height * 0.01,),
                                Text(
                                  'Lean Body Mass',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            navigateTo(context, LeanBodyMass());
                          },
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
