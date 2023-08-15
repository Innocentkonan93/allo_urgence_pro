import 'dart:convert';

import 'package:equatable/equatable.dart';

class UrgenceModel extends Equatable {
  final int? id;
  final String? idUrgentiste;
  final String? emailUrgentiste;
  final String? nameUrgentiste;
  final String? logoUrgentiste;
  final String? contacts;
  final dynamic symptomes;
  final String? adresse;
  final String? coordonnees;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const UrgenceModel({
    this.id,
    this.idUrgentiste,
    this.nameUrgentiste,
    this.emailUrgentiste,
    this.logoUrgentiste,
    this.contacts,
    this.symptomes,
    this.adresse,
    this.coordonnees,
    this.createdAt,
    this.updatedAt,
  });

  UrgenceModel copyWith({
    int? id,
    String? idUrgentiste,
    String? nameUrgentiste,
    String? emailUrgentiste,
    String? logoUrgentiste,
    String? contacts,
    dynamic symptomes,
    String? adresse,
    String? coordonnees,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UrgenceModel(
      id: id ?? this.id,
      idUrgentiste: idUrgentiste ?? this.idUrgentiste,
      nameUrgentiste: nameUrgentiste ?? this.nameUrgentiste,
      emailUrgentiste: emailUrgentiste ?? this.emailUrgentiste,
      logoUrgentiste: logoUrgentiste ?? this.logoUrgentiste,
      contacts: contacts ?? this.contacts,
      symptomes: symptomes ?? this.symptomes,
      adresse: adresse ?? this.adresse,
      coordonnees: coordonnees ?? this.coordonnees,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_urgentiste': idUrgentiste,
      'name_urgentiste': nameUrgentiste,
      'email_urgentiste': emailUrgentiste,
      'logo_urgentiste': logoUrgentiste,
      'contacts': contacts,
      'symptomes': symptomes,
      'adresse': adresse,
      'coordonnees': coordonnees,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory UrgenceModel.fromMap(Map<String, dynamic> map) {
    return UrgenceModel(
      id: map['id'],
      idUrgentiste: map['id_urgentiste'],
      nameUrgentiste: map['name_urgentiste'],
      emailUrgentiste: map['email_urgentiste'],
      logoUrgentiste: map['logo_urgentiste'],
      contacts: map['contacts'],
      symptomes: map['symptomes'],
      adresse: map['adresse'],
      coordonnees: map['coordonees'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UrgenceModel.fromJson(String source) =>
      UrgenceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UrgenceModel(id: $id, idUrgentiste: $idUrgentiste, nameUrgentiste: $nameUrgentiste, emailUrgentiste: $emailUrgentiste,  logoUrgentiste: $logoUrgentiste, contacts: $contacts, symptomes: $symptomes, adresse: $adresse, coordonees: $coordonnees, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      idUrgentiste,
      nameUrgentiste,
      emailUrgentiste,
      logoUrgentiste,
      contacts,
      symptomes,
      adresse,
      coordonnees,
      createdAt,
      updatedAt,
    ];
  }
}
