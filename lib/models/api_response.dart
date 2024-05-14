class ApiResponse {
  final bool successful;
  final int statusCode;
  final String message;
  final dynamic data;
  final dynamic? error;

  ApiResponse({
    required this.successful,
    required this.statusCode,
    required this.message,
    this.data,
    this.error,
  });
}
