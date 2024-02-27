import 'package:drink_shop/on_boarding/data/models/on_boarding_model.dart';
import 'package:drink_shop/on_boarding/data/repository/local_repository.dart';
import 'package:drink_shop/on_boarding/domain/queue_on_boarding.dart';

abstract class OnBoardingPresenter {

  final Function onNext;
  final Function onComplete;

  OnBoardingPresenter({required this.onNext, required this.onComplete});

  void init();
  void pressButton();
}

class OnBoardingPresenterImpl extends OnBoardingPresenter{
  final LocalRepository _localRepository = LocalRepository();
  late final QueueOnBoarding _queueOnBoarding;

  late OnBoardingModel _currentOnBoardingModel;
  OnBoardingModel get currentOnBoardingModel => _currentOnBoardingModel;

  OnBoardingPresenterImpl({required super.onNext, required super.onComplete}){
    init();
  }

  @override
  void init() {
    _queueOnBoarding = QueueOnBoarding.withLocalData(_localRepository);
    _currentOnBoardingModel = _queueOnBoarding.pop();
  }

  @override
  void pressButton() {
    if (_queueOnBoarding.length() != 0) {
      _currentOnBoardingModel = _queueOnBoarding.pop();
      onNext();
    }else{
      onComplete();
    }
  }

}