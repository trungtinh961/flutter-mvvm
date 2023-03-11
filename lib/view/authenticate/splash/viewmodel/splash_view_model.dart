
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constants.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/splash_service.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/viewmodel/device_and_cahe.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool isFirstInit = true;

  ISplashService? service;

  @override
  void init() {
    startAnimationOnView();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });

    // Dummy for moduler page
    Future.delayed(const Duration(seconds: 2)).then((value) {
      navigation.navigateToPageClear(path: NavigationConstants.MENU_VIEW);
    });
  }

  Future<void> controlAppState() async {
    await deviceAndCacheInit();
    _networkInit();
  }

  void _networkInit() {
    if (vexanaManager != null) {
      service = SplashService(vexanaManagerComputed.networkManager);
    }
  }

  Future<void> startAnimationOnView() async {
    await Future.delayed(viewModelContext.durationLow);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}
