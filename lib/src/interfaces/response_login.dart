// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));
UsuerLogin userLoginFromJson(String str) => UsuerLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
    final bool? success;
    final String? message;
    final UsuerLogin? userLogin;

    ResponseLogin({
        this.success,
        this.message,
        this.userLogin,
    });

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        success: json["success"],
        message: json["message"],
        userLogin: json["data"] == null ? null : UsuerLogin.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": userLogin?.toJson(),
    };
}

class UsuerLogin {
    final int? id;
    final String? nombre;
    final String? apellido;
    final String? ci;
    final String? direccion;
    final String? telefono;
    final dynamic avatar;
    final String? email;
    final DateTime? emailVerifiedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<RoleElement>? roles;

    UsuerLogin({
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
        this.roles,
    });

    factory UsuerLogin.fromJson(Map<String, dynamic> json) => UsuerLogin(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        avatar: json["avatar"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        roles: json["roles"] == null ? [] : List<RoleElement>.from(json["roles"]!.map((x) => RoleElement.fromJson(x))),
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
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    };
}

class RoleElement {
    final int? id;
    final int? userId;
    final int? rolId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final RoleRole? role;

    RoleElement({
        this.id,
        this.userId,
        this.rolId,
        this.createdAt,
        this.updatedAt,
        this.role,
    });

    factory RoleElement.fromJson(Map<String, dynamic> json) => RoleElement(
        id: json["id"],
        userId: json["user_id"],
        rolId: json["rol_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        role: json["role"] == null ? null : RoleRole.fromJson(json["role"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "rol_id": rolId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role?.toJson(),
    };
}

class RoleRole {
    final int? id;
    final String? rol;
    final dynamic createdAt;
    final dynamic updatedAt;

    RoleRole({
        this.id,
        this.rol,
        this.createdAt,
        this.updatedAt,
    });

    factory RoleRole.fromJson(Map<String, dynamic> json) => RoleRole(
        id: json["id"],
        rol: json["rol"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rol": rol,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
