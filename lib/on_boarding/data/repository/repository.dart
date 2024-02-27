import 'package:drink_shop/on_boarding/data/models/on_boarding_model.dart';

abstract class Repository {
  List<OnBoardingModel> getOnBoarding();
}