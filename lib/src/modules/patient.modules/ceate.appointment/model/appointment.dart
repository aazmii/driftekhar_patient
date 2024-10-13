// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:flutter/material.dart';

import 'package:doc_appointment/src/models/chember/chember.dart';

class Appointment {
  PatientData? patientData;
  DateTime? apptDate;
  String? weekDay;
  TimeOfDay? apptTime;
  Chember? chember;
  bool? isFirstTime;
  NotifyMethod? notifyMethod;

  Appointment({
    this.patientData,
    this.apptDate,
    this.weekDay,
    this.apptTime,
    this.chember,
    this.isFirstTime = true,
    this.notifyMethod = NotifyMethod.sms,
  });

  Appointment copyWith({
    PatientData? patientData,
    DateTime? apptDate,
    String? weekDay,
    TimeOfDay? apptTime,
    Chember? chember,
    bool? isFirstTime,
    NotifyMethod? notifyMethod,
  }) {
    return Appointment(
      patientData: patientData ?? this.patientData,
      apptDate: apptDate ?? this.apptDate,
      weekDay: weekDay ?? this.weekDay,
      apptTime: apptTime ?? this.apptTime,
      chember: chember ?? this.chember,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notifyMethod: notifyMethod ?? this.notifyMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'patientData': patientData?.toMap(),
      // 'apptDate': apptDate?.millisecondsSinceEpoch,
      // 'weekDay': weekDay,
      // 'apptTime': apptTime?.toMap(),
      // 'chember': chember?.toMap(),
      'isFirstTime': isFirstTime,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
        // patientData: map['patientData'] != null ? PatientData.fromMap(map['patientData'] as Map<String,dynamic>) : null,
        // apptDate: map['apptDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['apptDate'] as int) : null,
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
    return 'Appointment(patientData: $patientData, apptDate: $apptDate, weekDay: $weekDay, apptTime: $apptTime, chember: $chember, isFirstTime: $isFirstTime)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.patientData == patientData &&
        other.apptDate == apptDate &&
        other.weekDay == weekDay &&
        other.apptTime == apptTime &&
        other.chember == chember &&
        other.notifyMethod == notifyMethod &&
        other.isFirstTime == isFirstTime;
  }

  @override
  int get hashCode {
    return patientData.hashCode ^
        apptDate.hashCode ^
        weekDay.hashCode ^
        apptTime.hashCode ^
        chember.hashCode ^
        notifyMethod.hashCode ^
        isFirstTime.hashCode;
  }
}

enum NotifyMethod { email, sms }
