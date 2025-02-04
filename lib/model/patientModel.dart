// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PatientModel patientModelFromJson(String str) => PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
    final bool success;
    final String message;
    final List<Datum> data;

    PatientModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final  id;
    final DateTime consultationTime;
    final  tokenNo;
    final  consultationCharge;
    final DateTime date;
    final String patientName;
    final String doctor;
    final String departments;

    Datum({
        required this.id,
        required this.consultationTime,
        required this.tokenNo,
        required this.consultationCharge,
        required this.date,
        required this.patientName,
        required this.doctor,
        required this.departments,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        consultationTime: DateTime.parse(json["consultation_time"]),
        tokenNo: json["token_no"],
        consultationCharge: json["consultation_charge"],
        date: DateTime.parse(json["date"]),
        patientName: json["patient_name"],
        doctor: json["doctor"],
        departments: json["departments"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "consultation_time": consultationTime.toIso8601String(),
        "token_no": tokenNo,
        "consultation_charge": consultationCharge,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "patient_name": patientName,
        "doctor": doctor,
        "departments": departments,
    };
}
