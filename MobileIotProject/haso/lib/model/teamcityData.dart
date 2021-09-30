// ignore_for_file: file_names, non_constant_identifier_names
// ignore_for_file: empty_constructor_bodies

class TeamcityData {
  int? id;
  String? branch_name;
  String? branch_display_name;
  String? branch_is_default;
  String? build_start_time;
  String? timestamp;
  String? build_event;
  String? build_name;
  String? build_status_url;
  String? build_number;
  String? triggered_by;
  String? build_result;
  String? build_result_previous;
  String? build_result_delta;

  TeamcityData(
      int id,
      String branch_name,
      String branch_display_name,
      String branch_is_default,
      String build_start_time,
      String timestamp,
      String build_event,
      String build_name,
      String build_status_url,
      String build_number,
      String triggered_by,
      String build_result,
      String build_result_previous,
      String build_result_delta) {
    // ignore: prefer_initializing_formals
    this.id = id;
    this.branch_name;
    this.branch_display_name;
    this.branch_is_default;
    this.build_start_time;
    this.timestamp;
    this.build_event;
    this.build_name;
    this.build_status_url;
    this.build_number;
    this.triggered_by;
    this.build_result;
    this.build_result_previous;
    this.build_result_delta;
  }

  TeamcityData.fromJson(Map json) {
    id = json["id"];
    branch_name = json['branch_name'];
    branch_display_name = json['branch_display_name'];
    branch_is_default = json['branch_is_default'];
    build_start_time = json['build_start_time'];
    timestamp = json['timestamp'];
    build_event = json['build_event'];
    build_name = json['build_name'];
    build_status_url = json['build_status_url'];
    build_number = json['build_number'];
    triggered_by = json['triggered_by'];
    build_result = json['build_result'];
    build_result_previous = json['build_result_previous'];
    build_result_delta = json['build_result_delta'];
  }

  Map toJson() {
    return {
      "id": id,
      "branch_name": branch_name,
      "branch_display_name": branch_display_name,
      "branch_is_default": branch_is_default,
      "build_start_time": build_start_time,
      "timestamp": timestamp,
      "build_event": build_event,
      "build_name": build_name,
      "build_status_url": build_status_url,
      "build_number": build_number,
      "triggered_by": triggered_by,
      "build_result": build_result,
      "build_result_previous": build_result_previous,
      "build_result_delta": build_result_delta,
    };
  }
}
