import 'package:equatable/equatable.dart';

/// [ApiResponse] is a simple wrapper around the http client response.
/// This decouples the code from the http client in use.
class ApiResponse extends Equatable {
  final bool isSuccessful;
  final dynamic data;
  final String msg;
  final String? errorMsg;

  const ApiResponse(
      {required this.isSuccessful,
      required this.data,
      required this.msg,
      this.errorMsg});

  ApiResponse.from(Map<String, dynamic> response)
      : data = response.containsKey("data") ? response["data"] : null,
        isSuccessful =
            response.containsKey("status") ? response["status"] : false,
        errorMsg = response.containsKey("error")
            ? response["errror"] != null
                ? ApiResponse.getErrorMsg(response["error"]["name"])
                : null
            : null,
        msg = response.containsKey("message") ? response["message"] : "";

  ApiResponse modifyErrorMsg(String message) => ApiResponse(
      data: data, isSuccessful: isSuccessful, msg: msg, errorMsg: message);

  static String getErrorMsg(List<dynamic> responsePart) {
    StringBuffer msg = StringBuffer();
    responsePart.forEach((message) {
      msg.write("$message ");
    });
    return msg.toString();
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isSuccessful, errorMsg, data, msg];
}
