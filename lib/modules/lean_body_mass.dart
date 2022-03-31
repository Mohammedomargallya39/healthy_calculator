import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class LeanBodyMass extends StatelessWidget {
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? firstGender = 'Select Gander';
  List<String> genders =
  [
    'Select Gander',
    'Male',
    'Female',
  ];
  LeanBodyMass({Key? key}) : super(key: key);

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
                          'assets/images/lean_body_mass.svg',
                          width: size.width,
                          height: size.height * 0.22,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05,),
                      Center(
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
                      SizedBox(height: size.height * 0.05,),
                      defaultButton(
                          color: Colors.blueGrey,
                          function: ()
                          {
                            AppCubit.get(context).leanBodyMassGander = firstGender;
                            AppCubit.get(context).leanBodyMassHeight = double.parse(heightController.text);
                            AppCubit.get(context).leanBodyMassWeight = double.parse(weightController.text);

                            if(formKey.currentState!.validate())
                            {
                              if(AppCubit.get(context).leanBodyMassGander == 'Female')
                              {
                                AppCubit.get(context).leanBodyMassResult =
                                    (0.29569 * AppCubit.get(context).leanBodyMassWeight!)
                                    + (0.41813 * AppCubit.get(context).leanBodyMassHeight!)
                                        - 43.2933;
                              }

                              if(AppCubit.get(context).leanBodyMassGander == 'Male')
                              {
                                AppCubit.get(context).leanBodyMassResult = (0.32810  * AppCubit.get(context).leanBodyMassWeight!)
                                    + (0.33929 * AppCubit.get(context).leanBodyMassHeight!)
                                    - 29.5336;
                              }

                            }
                            AppCubit.get(context).bodyFat();
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
                            Text('Your Lean Body Mass is ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                            SizedBox(width: size.width* 0.025,),
                            Text(AppCubit.get(context).leanBodyMassResult!.toStringAsFixed(2),
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
