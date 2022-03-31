import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class BodyMassIndex extends StatelessWidget {
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  BodyMassIndex({Key? key}) : super(key: key);

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
                          'assets/images/body_mass.svg',
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
                            if(formKey.currentState!.validate())
                            {
                              AppCubit.get(context).bMIHeight = double.parse(heightController.text);
                              AppCubit.get(context).bMIWeight = double.parse(weightController.text);
                              AppCubit.get(context).bmiResult();
                              AppCubit.get(context).bMIResult = AppCubit.get(context).bMIWeight! /
                                  ((AppCubit.get(context).bMIHeight!/100) * (AppCubit.get(context).bMIHeight!/100));
                            }
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
                            Text('Result is ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                            SizedBox(width: size.width* 0.025,),
                              Text(AppCubit.get(context).bMIResult!.toStringAsFixed(2),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width* 0.05
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height* 0.05,),
                      Container(
                        width: size.width,
                        height: size.height * 0.3 ,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              size.width * 0.05,
                              size.width * 0.05,
                              size.width * 0.05,
                              size.width * 0.05
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'BMI Result',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width* 0.05,),
                                  Expanded(
                                    child: Text(
                                      'Weight Status',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height* 0.04,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Below 18.5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width* 0.05,),
                                  Expanded(
                                    child: Text(
                                      'Under Weight',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height* 0.03,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '18.5 to 24.9',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width* 0.05,),
                                  Expanded(
                                    child: Text(
                                      'Health Weight',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height* 0.03,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '25 to 29.9',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width* 0.05,),
                                  Expanded(
                                    child: Text(
                                      'Over Weight',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height* 0.03,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '30.0 and Above',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width* 0.05,),
                                  Expanded(
                                    child: Text(
                                      'Obesity',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.05,
                                          //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
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
