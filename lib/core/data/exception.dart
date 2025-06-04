class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() {
    return 'Error: $message (Status Code: $statusCode)';
  }

  //handle specific error types if needed
  static ApiException fromError(dynamic error) {
    if (error is ApiException) {
      return error;
    } else if (error is Exception) {
      return ApiException(error.toString());
    } else {
      return ApiException('An unknown error occurred');
    }
  }
  
}