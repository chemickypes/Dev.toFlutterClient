

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

abstract class AInjecstionModule {
  Injector _injector;


  void init();

  @protected
  Injector getInjector(String scope) {
    if(_injector == null){
      _injector  =  Injector.getInjector(scope ?? "default");
    }

    return _injector;
  }
}