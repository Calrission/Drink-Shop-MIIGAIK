import 'package:drink_shop/on_boarding/data/models/on_boarding_model.dart';
import 'package:drink_shop/on_boarding/data/repository/repository.dart';

class LocalRepository extends Repository {
  @override
  List<OnBoardingModel> getOnBoarding() {
    return [
      OnBoardingModel(
          cover: "assets/on_boarding/on_boarding_1.png",
          title: "Кофе, которое ты\nзаслуживаешь",
          text: "Лучшее зерно, лучшая обжарка,мощный\nвкус",
          textButton: "Дальше"
      ),
      OnBoardingModel(
          cover: "assets/on_boarding/on_boarding_2.png",
          title: "Коктейль,\nкоторый ты\nзаслуживаешь",
          text: "Лучшие ингредиенты, лучший баланс,\nмощный вкус",
          textButton: "Дальше"
      ),
      OnBoardingModel(
          cover: "assets/on_boarding/on_boarding_3.png",
          title: "Газировка,\nкоторую ты\nзаслуживаешь",
          text: "Лучший вкус, леденящий лёд, мощная\nшипучесть",
          textButton: "Дальше"
      ),
    ];
  }
}