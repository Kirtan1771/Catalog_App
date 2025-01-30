import 'package:first_app/Utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/loginimage.png',fit: BoxFit.contain),
              SizedBox(
                height: 40,
              ),
              Text("Welcome $name" ,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child:Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "UserName"
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});  // setState calls the build method again.
                      },
                    ),

                    TextFormField(
                      obscureText: true,   // For password fields
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password"
                      ),
                        validator: (value){
                          if (value!.isEmpty){
                          return "Password cannot be empty";
                          }
                          else if(value.length < 6){
                            return "Password too short! Length should be atleast 6.";
                          }
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell (
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width:changeButton?50: 150,
                        height: 50,
                        alignment: Alignment.center,

                        child:changeButton?Icon(Icons.done,color: Colors.white,):Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 18,fontWeight:FontWeight.bold) ,),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: changeButton?BoxShape.circle:BoxShape.rectangle,

                        ),
                      ),
                    )
                  ],)
              )
            ],
          ),
        ),
      ),
    );
  }
}