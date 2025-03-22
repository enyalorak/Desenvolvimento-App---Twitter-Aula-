import 'package:aula0703/models/user_app.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

//variavel p guardar inf do campo

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();

  String? isAValidEmail(value) {
    if (value == null || value.isEmpty) {
      return 'O campo de e-mail não pode estar vazio';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Insira um e-mail válido';
    }
    return null;
  }

  String? isAValidUserName(value) {
    if (value.isEmpty) {
      return 'O campo de usuário não pode estar vazio';
    }
    return null;
  }

  String? isAValidPassword(value) {
    if (value == null || value.isEmpty) {
      return 'A senha não pode estar vazia';
    }

    if (value.length < 6) {
      return 'A senha deve conter pelo menos 6 caracteres';
    }

    String pattern = r'^(?=.*[0-9]).+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'A senha deve conter pelo menos 1 caractere numérico.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        //SingleChildScrollView - para não atrapalhar o teclado
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 300),

                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: usuarioController,
                    validator: isAValidUserName,
                    //keyboardType: ,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('Usuário'),
                      hintText: 'Digite seu usuario',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    validator: isAValidEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      label: Text('Email'),
                      hintText: 'Digite seu email',
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: senhaController,
                    validator: isAValidPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.password),
                      label: Text('Senha'),
                      hintText: 'Digite sua senha',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  // decoration: BoxDecoration(color: Colors.green),
                  child: ElevatedButton(
                    onPressed: () {
                      UserApp newUserApp = UserApp(
                        email: emailController.text,
                        username: usuarioController.text,
                        password: senhaController.text,
                      );

                      newUserApp.register(newUserApp);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(
                        Size(200, 50),
                      ), // Largura x Altura
                      // Cor do texto
                    ),
                    child: Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
