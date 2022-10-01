import 'package:travel_app/Helper/Dialog/dialog_helper.dart';
import 'package:travel_app/Services/app_exeptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
