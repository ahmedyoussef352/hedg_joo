import 'package:get/get.dart';
import 'package:hedg/servies/constants.dart';

class Failure {
  String? code;
  String message;
  String? error;
  String? next;
  Object? overallStatus;
  int? result;
  bool? shouldTerminate;
  String? token;

  Failure({
    this.code,
    this.message = AppConstants.UNKNOWN_ERROR,
    this.error,
    this.next,
    this.overallStatus,
    this.result,
    this.shouldTerminate,
    this.token,
  });

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        error: json["Error"],
        code: json["code"] is List ? json["code"].first : json["code"],
        message: json["msg"],
        next: json["next"],
        overallStatus: json["overall_status"],
        result: json["result"],
        shouldTerminate: json["should_terminate"],
      );

  Map<String, dynamic> toJson() => {
        "Error": error,
        "code": code,
        "msg": message,
        "next": next,
        "overall_status": overallStatus,
        "result": result,
        "should_terminate": shouldTerminate
      };

  static Map<String, dynamic> exampleError = {
    "Error": "Error",
    "code": "code",
    "msg": AppConstants.UNKNOWN_ERROR.tr,
    "next": "nothing",
    "overall_status": false,
    "result": -1,
    "should_terminate": true
  };

  @override
  String toString() => toJson().toString();
}
