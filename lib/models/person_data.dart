class PersonData {
  final List<Data> data;

  PersonData({required this.data});
  factory PersonData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    return PersonData(
        data: dataList
            .map((e) => Data.fromJson(e))
            .toList());
  }
}

class Data {
  final String firstName;
  final String lastName;
  final String avatar;

  Data({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      firstName: json['first_name'] ?? 'No Name',
      lastName: json['last_name'] ?? 'None',
      avatar: json['avatar'] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2SBpAupCYMudA06lLrklIKAe52BgPnMyiGk5NzhA&s',
    );
  }
}
