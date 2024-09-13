import 'package:ecommerce_app/domain/entites/register_response_entity.dart';

class RegisterResponeDTO extends RegisterResponseEntity {
  RegisterResponeDTO({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  RegisterResponeDTO.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    super.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;
}
