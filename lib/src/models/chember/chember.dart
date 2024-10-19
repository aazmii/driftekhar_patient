// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:doc_appointment/src/models/visiting.hour/visiting.hour.dart';

class Chember {
  final String? name;
  final String? address;
  final String? description;
  final String? chemberEmail;
  final VisitingSchedule? visitingHour;
  final String? hotline;
  final String? tel;
  final List<String>? cell;
  final String? web;
  final double? lat;
  final double? long;

  const Chember({
    this.name,
    this.address,
    this.description,
    this.chemberEmail,
    this.visitingHour,
    this.hotline,
    this.tel,
    this.cell,
    this.web,
    this.lat,
    this.long,
  });

  Chember copyWith({
    String? name,
    String? address,
    String? description,
    String? chemberEmail,
    VisitingSchedule? visitingHour,
    String? hotline,
    String? tel,
    List<String>? cell,
    String? web,
    double? lat,
    double? long,
  }) {
    return Chember(
      name: name ?? this.name,
      address: address ?? this.address,
      description: description ?? this.description,
      chemberEmail: chemberEmail ?? this.chemberEmail,
      visitingHour: visitingHour ?? this.visitingHour,
      hotline: hotline ?? this.hotline,
      tel: tel ?? this.tel,
      cell: cell ?? this.cell,
      web: web ?? this.web,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'description': description,
      'chemberEmail': chemberEmail,
      // 'visitingHour': visitingHour?.toMap(),
      'hotline': hotline,
      'tel': tel,
      'cell': cell,
      'web': web,
      'lat': lat,
      'long': long,
    };
  }

  factory Chember.fromMap(Map<String, dynamic> map) {
    return const Chember(
        //   name: map['name'] != null ? map['name'] as String : null,
        //   address: map['address'] != null ? map['address'] as String : null,
        //   description: map['description'] != null ? map['description'] as String : null,
        //   chemberEmail: map['chemberEmail'] != null ? map['chemberEmail'] as String : null,
        //   visitingHour: map['visitingHour'] != null ? VisitingSchedule.fromMap(map['visitingHour'] as Map<String,dynamic>) : null,
        //   hotline: map['hotline'] != null ? map['hotline'] as String : null,
        //   tel: map['tel'] != null ? map['tel'] as String : null,
        //   cell: map['cell'] != null ? List<String>.from((map['cell'] as List<String>) : null,
        //   web: map['web'] != null ? map['web'] as String : null,
        //   lat: map['lat'] != null ? map['lat'] as double : null,
        //   long: map['long'] != null ? map['long'] as double : null,
        );
  }

  String toJson() => json.encode(toMap());

  factory Chember.fromJson(String source) =>
      Chember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chember(name: $name, address: $address, description: $description, chemberEmail: $chemberEmail, visitingHour: $visitingHour, hotline: $hotline, tel: $tel, cell: $cell, web: $web, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(covariant Chember other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.address == address &&
        other.description == description &&
        other.chemberEmail == chemberEmail &&
        other.visitingHour == visitingHour &&
        other.hotline == hotline &&
        other.tel == tel &&
        other.web == web &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        description.hashCode ^
        chemberEmail.hashCode ^
        visitingHour.hashCode ^
        hotline.hashCode ^
        tel.hashCode ^
        web.hashCode ^
        lat.hashCode ^
        long.hashCode;
  }
}
