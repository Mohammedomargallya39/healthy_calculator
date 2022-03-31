import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class BodyFat extends StatelessWidget {
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
  BodyFat({Key? key}) : super(key: key);

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
                          'assets/images/body_fat.svg',
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
                      SizedBox(height: size.height * 0.05,),
                      defaultButton(
                          color: Colors.blueGrey,
                          function: ()
                          {
                            AppCubit.get(context).bodyFatGender = firstGender;
                            AppCubit.get(context).bodyFatHeight = double.parse(heightController.text);
                            AppCubit.get(context).bodyFatWeight = double.parse(weightController.text);
                            AppCubit.get(context).bodyFatAge = double.parse(ageController.text);

                            if(formKey.currentState!.validate())
                            {
                              if(AppCubit.get(context).bodyFatGender == 'Female')
                              {
                                AppCubit.get(context).bodyFatResult =
                                (1.20 * AppCubit.get(context).bodyFatWeight! /
                                    (
                                        (AppCubit.get(context).bodyFatHeight!/100) * (AppCubit.get(context).bodyFatHeight!/100)
                                    )
                                ) + (0.23 * AppCubit.get(context).bodyFatAge!) - 5.4 ;
                              }

                              if(AppCubit.get(context).bodyFatGender == 'Male')
                              {
                                AppCubit.get(context).bodyFatResult =
                                    (1.20 * AppCubit.get(context).bodyFatWeight! /
                                        (
                                            (AppCubit.get(context).bodyFatHeight!/100) * (AppCubit.get(context).bodyFatHeight!/100)
                                        )
                                    ) + (0.23 * AppCubit.get(context).bodyFatAge!) - 16.2 ;
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
                            Text('Your Body Fat is ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                            SizedBox(width: size.width* 0.025,),
                            Text(AppCubit.get(context).bodyFatResult!.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width* 0.05
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height* 0.05,),
                      Text(
                          'Status For Men(20-40 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 8',
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
                                      'Under Fat',
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
                                      '8 to 19',
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
                                      'Healthy',
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
                                      '20 to 25',
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
                                      'Over Fat',
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
                                      '26.0 and Above',
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
                      SizedBox(height: size.height* 0.015,),
                      Text(
                        'Status For Women(20-40 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 21',
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
                                      'Under Fat',
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
                                      '22 to 33',
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
                                      'Healthy',
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
                                      '34 to 39',
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
                                      'Over Fat',
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
                                      '40 and Above',
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
                      SizedBox(height: size.height* 0.015,),
                      Text(
                        'Status For Men(41-60 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 11',
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
                                      'Under Fat',
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
                                      '12 to 22',
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
                                      'Healthy',
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
                                      '23 to 27',
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
                                      'Over Fat',
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
                                      '28 and Above',
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
                      SizedBox(height: size.height* 0.015,),
                      Text(
                        'Status For Women(41-60 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 23',
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
                                      'Under Fat',
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
                                      '23 to 35',
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
                                      'Healthy',
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
                                      '36 to 40',
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
                                      'Over Fat',
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
                                      '41 and Above',
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
                      SizedBox(height: size.height* 0.015,),
                      Text(
                        'Status For Men(61-79 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 13',
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
                                      'Under Fat',
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
                                      '13 to 25',
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
                                      'Healthy',
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
                                      '26 to 30',
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
                                      'Over Fat',
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
                                      '31 and Above',
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
                      SizedBox(height: size.height* 0.015,),
                      Text(
                        'Status For Women(61-79 yrs old):',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: size.height* 0.015,),
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
                                      'Body Fat Result',
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
                                      'Body Fat Status',
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
                                      'Below 24',
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
                                      'Under Fat',
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
                                      '25 to 36',
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
                                      'Healthy',
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
                                      '37 to 42',
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
                                      'Over Fat',
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
                                      '43 and Above',
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
