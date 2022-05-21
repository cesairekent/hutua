class ApiResponse
{
  final Object? data;
  final int status;
  final String message;

  const ApiResponse(
    {
      required this.data,
      required this.status,
      required this.message,
    }
  );

  factory ApiResponse.fromJson(Map<String, dynamic> json)
  {
    final data = json['data'];
    final status = json['status'];
    final message = json['message'];

    return ApiResponse(
      data: data,
      status: status,
      message: message,
    );
  }
}