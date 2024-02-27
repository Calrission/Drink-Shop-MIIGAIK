import 'package:drink_shop/on_boarding/data/models/on_boarding_model.dart';
import 'package:drink_shop/on_boarding/data/repository/repository.dart';

class QueueOnBoarding {
  final List<OnBoardingModel> _data = [];


  QueueOnBoarding(List<OnBoardingModel> data){
    _data.addAll(data);
  }

  static QueueOnBoarding withLocalData(Repository repository){
    return QueueOnBoarding(repository.getOnBoarding());
  }

  void push(OnBoardingModel elem) {
    _data.add(elem);
  }

  void fill(List<OnBoardingModel> elements) {
    _data.addAll(elements);
  }

  OnBoardingModel pop() {
    var elem = _data.first;
    _data.removeAt(0);
    return elem;
  }

  int length(){
    return _data.length;
  }
}