class ApiResponse<T> {
  Status? status;
  int? code;
  T? data;
  String? message;
  String? success;
  String? header;

  ApiResponse(
      {this.status,
      this.code,
      this.data,
      this.message,
      this.header,
      this.success});

  @override
  String toString() {
    return "Success : $success \n Status : $status \n Code : $code \n Message : $message \n Data : $data";
  }
}

enum Status { success, error }
