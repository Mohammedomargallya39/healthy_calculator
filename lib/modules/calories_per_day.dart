import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class CaloriesPerDay extends StatelessWidget {
  var weightController = TextEditingController();
  var ageController = TextEditingController();
  var heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? firstGender = 'Select Gander';
  List<String> genders =
  [
    'Select Gander',
    'Male',
    'Female',
  ];
  String? firstExercise = 'Select Your Exercise Activity';
  List<String> exercises =
  [
    'Select Your Exercise Activity',
    'no exercise',
    'exercise 1–3 days/week',
    'exercise 3–5 days/week',
    'exercise 6–7 days/week',
    'hard exercise 6–7 days/week',
  ];
  CaloriesPerDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.03,
                  size.height * 0.01,
                  size.width * 0.03,
                  size.height * 0.01
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/calories.svg',
                          width: size.width,
                          height: size.height * 0.22,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: defaultFormField(
                                text: 'Age:',
                                suffix: Icons.calendar_today_outlined,
                                suffixPressed: ()
                                {

                                },
                                controller: ageController,
                                type: TextInputType.phone,
                                context: context,
                                textColor: Colors.white,
                                labelStyleColor: Colors.white,
                                fillColor: Colors.black,
                                borderColor: Colors.black,
                                cursorColor: Colors.white,
                                maxLines: 1,
                                validate: (String value)
                                {
                                  if (value.isEmpty) {
                                    return '   Age must not be empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.01),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButtonFormField(
                                value: firstGender,
                                dropdownColor: Colors.grey,
                                alignment: Alignment.center,
                                icon: const Icon(
                                  Icons.arrow_drop_down ,
                                  color: Colors.white,
                                ),
                                iconSize: size.height * 0.022,
                                style: TextStyle(
                                    color: Colors.white ,
                                    fontSize: size.width * 0.04
                                ),
                                onChanged: (String? value)
                                {
                                  firstGender =  value! ;
                                },
                                items: genders.map<DropdownMenuItem<String>>((String value)
                                {
                                  return
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                }).toList(),
                              )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.025,),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: defaultFormField(
                                text: 'Weight(KG):',
                                suffix: Icons.line_weight,
                                suffixPressed: ()
                                {

                                },
                                controller: weightController,
                                type: TextInputType.phone,
                                context: context,
                                textColor: Colors.white,
                                labelStyleColor: Colors.white,
                                fillColor: Colors.black,
                                borderColor: Colors.black,
                                cursorColor: Colors.white,
                                maxLines: 1,
                                validate: (String value)
                                {
                                  if (value.isEmpty) {
                                    return '   Weight must not be empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.01),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: defaultFormField(
                                text: 'Height(CM):',
                                suffix: Icons.height,
                                suffixPressed: ()
                                {

                                },
                                controller: heightController,
                                type: TextInputType.phone,
                                context: context,
                                textColor: Colors.white,
                                labelStyleColor: Colors.white,
                                fillColor: Colors.black,
                                borderColor: Colors.black,
                                cursorColor: Colors.white,
                                maxLines: 1,
                                validate: (String value)
                                {
                                  if (value.isEmpty) {
                                    return '   Height must not be empty';
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.025,),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonFormField(
                            value: firstExercise,
                            dropdownColor: Colors.grey,
                            alignment: Alignment.center,
                            icon: const Icon(
                              Icons.arrow_drop_down ,
                              color: Colors.white,
                            ),
                            iconSize: size.height * 0.022,
                            style: TextStyle(
                                color: Colors.white ,
                                fontSize: size.width * 0.04
                            ),
                            onChanged: (String? value)
                            {
                              firstExercise =  value! ;
                              print(firstExercise);
                            },
                            items: exercises.map<DropdownMenuItem<String>>((String value)
                            {
                              return
                                DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                            }).toList(),
                          )
                      ),
                      SizedBox(height: size.height * 0.05,),
                      defaultButton(
                          color: Colors.blueGrey,
                          function: ()
                          {
                            AppCubit.get(context).aMRGender = firstGender;
                            AppCubit.get(context).aMRExercise = firstExercise;
                            AppCubit.get(context).aMRHeight = double.parse(heightController.text);
                            AppCubit.get(context).aMRWeight = double.parse(weightController.text);
                            AppCubit.get(context).aMRAge = double.parse(ageController.text);

                            print('Gander is ${AppCubit.get(context).aMRGender}');
                            print('Exercise is ${AppCubit.get(context).aMRExercise}');
                            print('Height is ${AppCubit.get(context).aMRHeight}');
                            print('Weight is ${AppCubit.get(context).aMRWeight}');
                            print('Age is ${AppCubit.get(context).aMRAge}');
                            print('Result is ${AppCubit.get(context).aMRResult}');

                            print('Gander is ${firstGender}');
                            print('Exercise is ${firstExercise}');
                            print('Height is ${double.parse(heightController.text)}');
                            print('Weight is ${double.parse(weightController.text)}');
                            print('Age is ${double.parse(ageController.text)}');
                            print('Result is ${AppCubit.get(context).aMRResult}');
                            if(formKey.currentState!.validate())
                            {
                              if(AppCubit.get(context).aMRGender == 'Female')
                              {
                                if(AppCubit.get(context).aMRExercise == 'no exercise')
                                {
                                  AppCubit.get(context).aMRResult =
                                  (655.1 + (9.563 * AppCubit.get(context).aMRHeight!) +
                                  (1.850 * AppCubit.get(context).aMRHeight!) - (4.576 * AppCubit.get(context).aMRAge!)) * 1.2;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 1–3 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (655.1 + (9.563 * AppCubit.get(context).aMRHeight!) +
                                          (1.850 * AppCubit.get(context).aMRHeight!) - (4.576 * AppCubit.get(context).aMRAge!)) * 1.375;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 3–5 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (655.1 + (9.563 * AppCubit.get(context).aMRHeight!) +
                                          (1.850 * AppCubit.get(context).aMRHeight!) - (4.576 * AppCubit.get(context).aMRAge!)) * 1.55;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 6–7 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (655.1 + (9.563 * AppCubit.get(context).aMRHeight!) +
                                          (1.850 * AppCubit.get(context).aMRHeight!) - (4.576 * AppCubit.get(context).aMRAge!)) * 1.725;
                                }
                                if(AppCubit.get(context).aMRExercise == 'hard exercise 6–7 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (655.1 + (9.563 * AppCubit.get(context).aMRHeight!) +
                                          (1.850 * AppCubit.get(context).aMRHeight!) - (4.576 * AppCubit.get(context).aMRAge!)) * 1.9;
                                }

                              }

                              if(AppCubit.get(context).aMRGender == 'Male')
                              {
                                if(AppCubit.get(context).aMRExercise == 'no exercise')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (66.47 + (13.75 * AppCubit.get(context).aMRHeight!) +
                                          (5.003 * AppCubit.get(context).aMRHeight!) - (6.755 * AppCubit.get(context).aMRAge!)) * 1.2;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 1–3 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (66.47 + (13.75 * AppCubit.get(context).aMRHeight!) +
                                          (5.003 * AppCubit.get(context).aMRHeight!) - (6.755 * AppCubit.get(context).aMRAge!)) * 1.375;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 3–5 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (66.47 + (13.75 * AppCubit.get(context).aMRHeight!) +
                                          (5.003 * AppCubit.get(context).aMRHeight!) - (6.755 * AppCubit.get(context).aMRAge!)) * 1.55;
                                }
                                if(AppCubit.get(context).aMRExercise == 'exercise 6–7 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (66.47 + (13.75 * AppCubit.get(context).aMRHeight!) +
                                          (5.003 * AppCubit.get(context).aMRHeight!) - (6.755 * AppCubit.get(context).aMRAge!)) * 1.725;
                                }
                                if(AppCubit.get(context).aMRExercise == 'hard exercise 6–7 days/week')
                                {
                                  AppCubit.get(context).aMRResult =
                                      (66.47 + (13.75 * AppCubit.get(context).aMRHeight!) +
                                          (5.003 * AppCubit.get(context).aMRHeight!) - (6.755 * AppCubit.get(context).aMRAge!)) * 1.9;
                                }

                              }

                            }
                            AppCubit.get(context).amrResult();
                          },
                          text: 'Calculate',
                          context: context
                      ),
                      SizedBox(height: size.height * 0.05,),
                      Container(
                        width: size.width,
                        height: size.height * 0.07 ,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: size.width* 0.025,),
                            Text('Your daily calories is ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                            SizedBox(width: size.width* 0.025,),
                            Text(AppCubit.get(context).aMRResult!.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
