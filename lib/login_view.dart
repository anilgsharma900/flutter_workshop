import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workshopt/dashboard_view.dart';
import 'package:flutter_workshopt/storage/app_store.dart';

/// Created by Anil Sharma on 12/02/23.
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.indigoAccent,
          child: Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1), borderRadius: BorderRadius.circular(18.0)),
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Flutter Workshop"),
                    TextField(
                      controller: _controllerUserName,
                      decoration: InputDecoration(
                        labelText: "user name",
                        hintText: "Enter user name",
                        errorText: isSubmitted ? _notEmpty() : null,
                      ),
                      onChanged: (text) => setState(() {}),
                      textInputAction: TextInputAction.next,
                    ),
                    TextField(
                      controller: _controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "password",
                          errorText: isSubmitted ? _notEmptyPassword() : null),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (text) => setState(() {}),
                      onSubmitted: (text) {
                        signIn();
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          signIn();
                        },
                        child: const Text("Sign In")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Are you new user?"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(color: Colors.indigoAccent, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerUserName.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void signIn() {
    FocusScope.of(context).unfocus();
    if (_controllerUserName.value.text.isEmpty || _controllerPassword.value.text.isEmpty) {
      setState(() {
        isSubmitted = true;
      });
      return;
    }
    if (_controllerUserName.value.text != "123" && _controllerPassword.value.text != "123") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid credentials"),
        backgroundColor: Colors.lightBlue,
      ));
      return;
    }
    AppStore.setAuthentication(true);
    Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardView()));
  }

  String? _notEmpty() {
    return _controllerUserName.value.text.isEmpty ? "Empty field is not allowed" : null;
  }

  String? _notEmptyPassword() {
    return _controllerPassword.value.text.isEmpty ? "Empty field is not allowed" : null;
  }
}
