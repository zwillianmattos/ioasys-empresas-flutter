class ApiResponse {
  bool? success;
  List<String>? errors;
  dynamic? data;
  dynamic? headers;

  ApiResponse({
    this.success,
    this.errors,
    this.data,
    this.headers
  });

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    if (json['errors'] != null) {
      errors = <String>[];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    return data;
  }

  @override
  String toString() {
    return 'ApiResponse{success: $success, errors: $errors}';
  }
}
