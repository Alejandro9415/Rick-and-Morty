enum AppErrorType { api, network, database, unauthorised, sessionDenied }

class AppError {
  const AppError(this.appErrorType);

  final AppErrorType appErrorType;
}
