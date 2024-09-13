import 'package:ecommerce_app/domain/entites/register_response_entity.dart';

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}
