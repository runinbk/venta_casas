import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:venta_casas/src/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('METODO BUILD');
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: -90, left: -100, child: _circlelogin()),
          Positioned(
            child: _textLogin(),
            top: 45,
            left: 35,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                _imageBanner(),
                _textfielEmail(),
                SizedBox(height: 15),
                _textfilePassword(),
                SizedBox(height: 15),
                _textfileButtonLogin(),
                SizedBox(height: 15),
                _textDontHaveAccount(),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _textLogin() {
    return Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _circlelogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.blue),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.20),
      child: Image.asset(
        'assets/img/casa.png',
        width: 200,
        height: 200,
      ),
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

  Widget _textfilePassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 191, 221, 247),
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.lock_outline)),
      ),
    );
  }

  Widget _textfileButtonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed:_con.login,
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: const Color.fromARGB(255, 94, 16, 230)),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(33, 150, 243, 1)),
          ),
        )
      ],
    );
  }
}
