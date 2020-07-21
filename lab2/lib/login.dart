import 'package:flutter/material.dart';
import 'package:lab2/register.dart';

void main() => runApp(LoginPage());
bool rememberMe = false;
final TextEditingController _email = new TextEditingController();
String email = "";
final TextEditingController _pass = new TextEditingController();
String pass = "";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(41, 167, 199, 20),
        body: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/icon.png',
                  scale: 1.5,
                ),
                Padding(
                  padding: EdgeInsets.only(left:10,right:10,top:40),
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: "Email",
                                  
                                  icon: Icon(Icons.email)),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Padding(
                            child: TextField(
                              controller: _pass,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: "Password",
                                  icon: Icon(Icons.lock)),
                              obscureText: true,
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: rememberMe,
                                onChanged: (bool value) {
                                  _onchange(value);
                                },
                              ),
                              Text('Remember Me',
                                  style: TextStyle(fontSize: 16))
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 150,
                  height: 50,
                  child: Text('Login'),
                  color: Colors.black,
                  textColor: Colors.white,
                  elevation: 20,
                  onPressed: _onPress,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: _onRegister,
                  child: Text('Register New Account',
                      style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                ),
                SizedBox(height: 10),
                Text('Forgot Password',style: TextStyle(fontSize: 16,color: Colors.white))
              ],
            )));
  }

  void _onPress() {
    print(_email.text);
    print(_pass.text);
  }

  void _onchange(bool value) {
    setState(() {
      rememberMe = value;
      print('Check value $value');
    });
  }

  void _onRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }
}
