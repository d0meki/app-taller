// To parse this JSON data, do
//
//     final responseTaller = responseTallerFromJson(jsonString);

/* import 'dart:convert';

ResponseTaller responseTallerFromJson(String str) => ResponseTaller.fromJson(json.decode(str));

String responseTallerToJson(ResponseTaller data) => json.encode(data.toJson());

class ResponseTaller {
    final bool? success;
    final TallerResponse? tallerResponse;

    ResponseTaller({
        this.success,
        this.tallerResponse,
    });

    factory ResponseTaller.fromJson(Map<String, dynamic> json) => ResponseTaller(
        success: json["success"],
        tallerResponse: json["data"] == null ? null : TallerResponse.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": tallerResponse?.toJson(),
    };
}

class TallerResponse {
    final int? id;
    final String? nombre;
    final String? nit;
    final String? direccion;
    final String? telefono;
    final dynamic foto;
    final int? userId;
    final dynamic createdAt;
    final dynamic updatedAt;

    TallerResponse({
        this.id,
        this.nombre,
        this.nit,
        this.direccion,
        this.telefono,
        this.foto,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    factory TallerResponse.fromJson(Map<String, dynamic> json) => TallerResponse(
        id: json["id"],
        nombre: json["nombre"],
        nit: json["nit"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        foto: json["foto"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "nit": nit,
        "direccion": direccion,
        "telefono": telefono,
        "foto": foto,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
} */


// To parse this JSON data, do
//
//     final responseTaller = responseTallerFromJson(jsonString);

import 'dart:convert';

ResponseTaller responseTallerFromJson(String str) => ResponseTaller.fromJson(json.decode(str));

String responseTallerToJson(ResponseTaller data) => json.encode(data.toJson());

class ResponseTaller {
    final bool? success;
    final TallerResponse? tallerResponse;

    ResponseTaller({
        this.success,
        this.tallerResponse,
    });

    factory ResponseTaller.fromJson(Map<String, dynamic> json) => ResponseTaller(
        success: json["success"],
        tallerResponse: json["data"] == null ? null : TallerResponse.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": tallerResponse?.toJson(),
    };
}

class TallerResponse {
    final int? id;
    final String? nombre;
    final String? nit;
    final String? direccion;
    final String? telefono;
    final dynamic foto;
    final int? userId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<Tecnico>? tecnicos;

    TallerResponse({
        this.id,
        this.nombre,
        this.nit,
        this.direccion,
        this.telefono,
        this.foto,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.tecnicos,
    });

    factory TallerResponse.fromJson(Map<String, dynamic> json) => TallerResponse(
        id: json["id"],
        nombre: json["nombre"],
        nit: json["nit"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        foto: json["foto"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        tecnicos: json["tecnicos"] == null ? [] : List<Tecnico>.from(json["tecnicos"]!.map((x) => Tecnico.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "nit": nit,
        "direccion": direccion,
        "telefono": telefono,
        "foto": foto,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tecnicos": tecnicos == null ? [] : List<dynamic>.from(tecnicos!.map((x) => x.toJson())),
    };
}

class Tecnico {
    final int? id;
    final dynamic latitud;
    final dynamic longitud;
    final int? userId;
    final int? talleresMecanicosId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final User? user;

    Tecnico({
        this.id,
        this.latitud,
        this.longitud,
        this.userId,
        this.talleresMecanicosId,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory Tecnico.fromJson(Map<String, dynamic> json) => Tecnico(
        id: json["id"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        userId: json["user_id"],
        talleresMecanicosId: json["talleres_mecanicos_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitud": latitud,
        "longitud": longitud,
        "user_id": userId,
        "talleres_mecanicos_id": talleresMecanicosId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? nombre;
    final String? apellido;
    final String? ci;
    final String? direccion;
    final String? telefono;
    final dynamic avatar;
    final String? email;
    final dynamic emailVerifiedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    User({
        this.id,
        this.nombre,
        this.apellido,
        this.ci,
        this.direccion,
        this.telefono,
        this.avatar,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        avatar: json["avatar"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "direccion": direccion,
        "telefono": telefono,
        "avatar": avatar,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
