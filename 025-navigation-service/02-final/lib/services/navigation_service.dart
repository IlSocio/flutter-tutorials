import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future navigate(String routeName, {Object parameters}) {
    /*
     var _viewModel = createViewModel<V>(parameters);
    var routeName = Core._viewLocator.getViewFromViewModelType<V>();
    await Navigator.of(_viewContext)
        .pushNamed(routeName, arguments: _viewModel);
    _viewModel.dispose();
    */

    return navigatorKey.currentState
        .pushNamed(routeName, arguments: parameters);
  }

  bool navigateBack() {
    return navigatorKey.currentState.pop();
  }

  /// Navigates to a new viewmodel of the type specified by the generic.
  ///
  /// The [parameter] is a value that will be passed to the new viewmodel's
  /// init method. It is expexted that the ViewModel being navigated to will
  /// return an instance of type R when it is popped off the stack.
  Future<R> navigateForResult<R extends Object>(String routeName,
      {Object parameters}) {
    /*
    var _viewModel = createViewModel<V>(parameter);
    var routeName = Core._viewLocator.getViewFromViewModelType<V>();
    var returnValue = await Navigator.of(_viewContext)
        .pushNamed<R>(routeName, arguments: _viewModel);
    _viewModel.dispose();
    return returnValue;
    */
    return navigatorKey.currentState
        .pushNamed<R>(routeName, arguments: parameters);
  }

  bool navigateBackWithResult<R extends Object>([R parameter]) {
    return navigatorKey.currentState.pop(parameter);
  }
}
