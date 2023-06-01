import 'package:flutter/material.dart';
import 'package:venta_casas/src/models/user.dart';
import 'package:venta_casas/src/provider/users_provider.dart';
import 'package:venta_casas/src/utils/my_snackbar.dart';

import '../../models/response_api.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context!, 'Debes ingresar todos los campos');
      return;
    }

    if (confirmPassword != password) {
      MySnackbar.show(context!, 'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(
          context!, 'Las contraseñas deben tener al menos 6 caracteres');
      return;
    }

    User user = new User(
        id: '',
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password,
        sessionToken: '',
        image: '');

    ResponseApi? responseApi = await usersProvider.create(user);

   // MySnackbar.show(context!, responseApi.message);

    print('Respuesta : $responseApi.toJson()');

    print(email);
    print(name);
    print(lastname);
    print(phone);
    print(password);
    print(confirmPassword);
  }
}
