import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_states/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(UserInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  double? bMIResult = 0;
  double? bMIHeight;
  double? bMIWeight;
  void bmiResult()
  {
    bMIResult;
    emit(CalculateBMI());
  }
  double? aMRResult =0;
  double? aMRAge ;
  double? aMRHeight ;
  double? aMRWeight ;
  dynamic aMRGender ;
  dynamic aMRExercise ;
  void amrResult()
  {
    bMIResult;
    emit(CalculateAMR());
  }
  double? bodyFatResult = 0;
  double? bodyFatHeight;
  double? bodyFatWeight;
  double? bodyFatAge;
  dynamic bodyFatGender;
  void bodyFat()
  {
    bodyFatResult;
    emit(BodyFat());
  }
  double? waterWeight;
  double? waterResult = 2;
  void waterIntake()
  {
    waterResult;
    emit(WaterIntake());
  }
  double? idealBodyWeightResult = 0;
  double? idealBodyWeightHeight;
  dynamic idealBodyWeightGender;
  void idealBodyWeight()
  {
    idealBodyWeightResult;
    emit(IdealBodyWeight());
  }
  double? leanBodyMassResult = 0;
  double? leanBodyMassHeight;
  dynamic leanBodyMassGander;
  double? leanBodyMassWeight;
  void leanBodyMass()
  {
    idealBodyWeightResult;
    emit(LeanBodyMass());
  }
}