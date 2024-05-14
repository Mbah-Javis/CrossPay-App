class DeviceInfo {
  String? playerId;
  String? language;
  String? deviceName;
  Map<String, dynamic>? deviceVersion;
  String? deviceModel;

  DeviceInfo({
    this.playerId,
    this.language,
    this.deviceName,
    this.deviceVersion,
    this.deviceModel,
  });

  factory DeviceInfo.fromJsonMap(Map<String, dynamic> json) {
    return DeviceInfo(
        playerId: json['player_id'],
        language: json['language'],
        deviceName: json['device_name'],
        deviceVersion: json['device_version'],
        deviceModel: json['device_model']);
  }

  Map<String, dynamic> toJsonMap() => {
        'player_id': playerId,
        'language': language,
        'device_name': deviceName,
        'device_version': deviceVersion,
        'device_model': deviceModel,
      };
}
