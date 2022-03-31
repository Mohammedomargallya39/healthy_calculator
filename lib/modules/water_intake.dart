import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_states/componants/componants.dart';
import 'package:healthy_states/cubit/cubit.dart';
import 'package:healthy_states/cubit/states.dart';

class WaterIntake extends StatelessWidget {
  var weightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  WaterIntake({Key? key}) : super(key: key);

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
                          'assets/images/water.svg',
                          width: size.width,
                          height: size.height * 0.22,
                        ),
                      ),
                      SizedBox(height: size.height * 0.1,),
                      Center(
                        child: Container(
                            width: size.width * 0.5,
                            height: size.height * 0.05,
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
                      SizedBox(height: size.height * 0.05,),
                      defaultButton(
                          color: Colors.blueGrey,
                          function: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              AppCubit.get(context).waterWeight = double.parse(weightController.text);
                              AppCubit.get(context).waterIntake();
                              AppCubit.get(context).waterResult = AppCubit.get(context).waterWeight! *  0.033;
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
                            Text(
                              'You should drink ${AppCubit.get(context).waterResult!.toStringAsFixed(2)} Liters per day',
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
