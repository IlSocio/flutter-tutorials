import 'package:nav_service/constants/route_paths.dart' as routes;
import 'package:nav_service/locator.dart';
import 'package:nav_service/services/navigation_service.dart';
import 'package:nav_service/viewmodels/basemodel.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future login() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    bool success = true;
    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      var result = await _navigationService.navigateForResult<String>(
          routes.HomeRoute,
          parameters: "testUsername");
      setErrorMessage(null);
    }

    setBusy(false);
  }
}
