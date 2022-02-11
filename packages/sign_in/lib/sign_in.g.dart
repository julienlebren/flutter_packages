// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      isComplete: json['isComplete'] as bool? ?? false,
      emailVerified: json['emailVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('emailAddress', instance.emailAddress);
  val['isComplete'] = instance.isComplete;
  val['emailVerified'] = instance.emailVerified;
  return val;
}
