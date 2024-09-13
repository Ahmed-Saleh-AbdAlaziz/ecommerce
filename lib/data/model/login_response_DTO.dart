import 'package:ecommerce_app/data/model/register_respone_DTO.dart';
import 'package:ecommerce_app/domain/entites/login_response_entity.dart';
import 'package:ecommerce_app/domain/entites/register_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({super.message, super.user, super.token, this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? statusMsg;
}
