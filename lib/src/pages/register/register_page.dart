import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:venta_casas/src/pages/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = new RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(children: [
        Positioned(top: -90, left: -90, child: _circle()),
        Positioned(
          child: _textRegister(),
          top: 45,
          left: 35,
        ),
        Positioned(
          child: _iconBack(),
          top: 41,
          left: 10,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 150),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _imageUser(),
                SizedBox(height: 20),
                _textfielEmail(),
                SizedBox(height: 20),
                _textfielName(),
                SizedBox(height: 20),
                _textfielLastName(),
                SizedBox(height: 20),
                _textfielPhone(),
                SizedBox(height: 20),
                _textfielPassword(),
                SizedBox(height: 20),
                _textfielConfirmPassword(),
                SizedBox(height: 30),
                _textfileButtoLogin()
              ],
            ),
          ),
        )
      ]),
    ));
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user.png'),
      radius: 60,
      backgroundColor: Colors.white,
    );
  }

  Widget _circle() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.blue),
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios, color: Colors.white));
  }

  Widget _textRegister() {
    return Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _textfielEmail() {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.email_outlined)),
      ),
    );
  }

  Widget _textfielName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textfielLastName() {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.lastnameController,
        decoration: InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.person_outline)),
      ),
    );
  }

  Widget _textfielPhone() {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Telefono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textfielPassword() {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _textfielConfirmPassword() {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.lock_outline)),
      ),
    );
  }

  Widget _textfileButtoLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: _con.register,
        child: Text('Registrarse'),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }
}
