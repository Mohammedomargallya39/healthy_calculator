import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class IdealBodyWeight extends StatelessWidget {
  var heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? firstGender = 'Select Gander';
  List<String> genders =
  [
    'Select Gander',
    'Male',
    'Female',
  ];
  IdealBodyWeight({Key? key}) : super(key: key);

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
                          'assets/images/body_weight.svg',
                          width: size.width,
                          height: size.height * 0.22,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05,),
                      Container(
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
                      SizedBox(height: size.height * 0.025,),
                      Container(
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
                      SizedBox(height: size.height * 0.05,),
                      defaultButton(
                          color: Colors.blueGrey,
                          function: ()
                          {
                            AppCubit.get(context).idealBodyWeightGender = firstGender;
                            AppCubit.get(context).idealBodyWeightHeight = double.parse(heightController.text);

                            if(formKey.currentState!.validate())
                            {
                              if(AppCubit.get(context).idealBodyWeightGender == 'Female')
                              {
                                AppCubit.get(context).idealBodyWeightResult = 45.5 + (0.91 *
                                    (AppCubit.get(context).idealBodyWeightHeight!-152.4)
                                );
                              }

                              if(AppCubit.get(context).idealBodyWeightGender == 'Male')
                              {
                                AppCubit.get(context).idealBodyWeightResult = 50 + (0.91 *
                                    (AppCubit.get(context).idealBodyWeightHeight!-152.4)
                                );
                              }

                            }
                            AppCubit.get(context).idealBodyWeight();
                            print(firstGender);
                            print(double.parse(heightController.text));
                            print(AppCubit.get(context).idealBodyWeightGender);
                            print(AppCubit.get(context).idealBodyWeightHeight);
                            print(AppCubit.get(context).idealBodyWeightResult);
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
                            Text('Your Ideal Body Weight is ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                            SizedBox(width: size.width* 0.025,),
                            Text(AppCubit.get(context).idealBodyWeightResult!.toStringAsFixed(2),
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
