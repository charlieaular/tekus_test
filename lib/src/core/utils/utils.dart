import 'package:tekus_test/src/core/error/failures.dart';
import 'package:tekus_test/src/core/utils/custom_snackbar.dart';

showEitherError(
  failure, {
  String title = "Ha ocurrido un problema",
}) {
  String error = _mapFailureToMessage(failure);
  showCustomSnackbar(
    title,
    error,
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    default:
      return 'Unexpected error';
  }
}
