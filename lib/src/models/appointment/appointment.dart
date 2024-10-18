// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:flutter/material.dart';

import 'package:doc_appointment/src/models/chember/chember.dart';

class Appointment {
  PatientData? patientData;
  DateTime? dateTime;

  Chember? chember;
  bool? isFirstTime;
  NotifyMethod? notifyMethod;

  Appointment({
    this.patientData,
    this.dateTime,
    this.chember,
    this.isFirstTime = true,
    this.notifyMethod = NotifyMethod.sms,
  });

  Appointment copyWith({
    PatientData? patientData,
    DateTime? dateTime,
    String? weekDay,
    TimeOfDay? apptTime,
    Chember? chember,
    bool? isFirstTime,
    NotifyMethod? notifyMethod,
  }) {
    return Appointment(
      patientData: patientData ?? this.patientData,
      dateTime: dateTime ?? this.dateTime,
      chember: chember ?? this.chember,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notifyMethod: notifyMethod ?? this.notifyMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'patientData': patientData?.toMap(),
      // 'date': date?.millisecondsSinceEpoch,
      // 'weekDay': weekDay,
      // 'apptTime': apptTime?.toMap(),
      // 'chember': chember?.toMap(),
      'isFirstTime': isFirstTime,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
        // patientData: map['patientData'] != null ? PatientData.fromMap(map['patientData'] as Map<String,dynamic>) : null,
        // date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
        // weekDay: map['weekDay'] != null ? map['weekDay'] as String : null,
        // apptTime: map['apptTime'] != null ? TimeOfDay.fromMap(map['apptTime'] as Map<String,dynamic>) : null,
        // chember: map['chember'] != null ? Chember.fromMap(map['chember'] as Map<String,dynamic>) : null,
        // isFirstTime: map['isFirstTime'] != null ? map['isFirstTime'] as bool : null,
        );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointment(patientData: $patientData, date: $dateTime , chember: $chember, isFirstTime: $isFirstTime)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.patientData == patientData &&
        other.dateTime == dateTime &&
        other.chember == chember &&
        other.notifyMethod == notifyMethod &&
        other.isFirstTime == isFirstTime;
  }

  @override
  int get hashCode {
    return patientData.hashCode ^
        dateTime.hashCode ^
        chember.hashCode ^
        notifyMethod.hashCode ^
        isFirstTime.hashCode;
  }
}

enum NotifyMethod { email, sms }
