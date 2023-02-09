import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../palette/palette.dart';

class SignUpTemplate extends StatefulWidget {
  const SignUpTemplate({Key? key}) : super(key: key);

  @override
  State<SignUpTemplate> createState() => _SignUpTemplateState();
}

class _SignUpTemplateState extends State<SignUpTemplate> {
  var _passwordVisible;

  final formKey = GlobalKey<FormState>();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 57,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) =>
                  name != null
                      ? null
                      : "Enter full name",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Username',
                    hintText: 'John Doe',
                    // Here is key idea
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.person_outline),
                    //   color: Colors.grey,
                    //   onPressed: () {},
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              height: 57,
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: TextFormField(

                  keyboardType: TextInputType.text,
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                  email != null && EmailValidator.validate(email)
                      ? null
                      : "Enter valid Email",
                  decoration: const InputDecoration(
                    border: InputBorder.none,

                    labelText: 'Email Address',
                    // hintText: 'johndoe@gmail.com',
                    // Here is key idea
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.person_outline),
                    //   color: Colors.grey,
                    //   onPressed: () {},
                    // ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),

            Container(
                height: 57,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _confirmPasswordController,
                    obscureText: !_passwordVisible, //
                    // This will obscure text dynamically
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                    password != null && password.length > 6
                        ? null
                        : "Enter a minimum of 6 characters",
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      labelText: 'Confirm Password',
                      hintText: 'Enter your password',
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(
              height: 10,
            ),
               Container(
                height: 57,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _userPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                    password != null && password.length > 6
                        ? null
                        : "Enter a minimum of 6 characters",
                    obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      labelText: 'Password',
                      hintText: 'Min of 6 characters',
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 20,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Palette.chazonBlueLess,width: 2)
                          )
                      )
                  ),
                  onPressed: (){},
                  child: SvgPicture.asset('assets/arrow.svg')),
            )


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SizedBox(
            //       width: 100,
            //     ),
            //     // TextButton(
            //     //     onPressed: () {
            //     //     },
            //     //     child: Text("Forgot your password?",
            //     //         style: TextStyle(color: Colors.red)))
            //   ],
            // ),
            // SizedBox(height: 60),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Don't have an Account?"),
            //     TextButton(
            //         onPressed: (){},
            //         child: Text("Sign Up"))
            //   ],
            // )
          ]),
    );
  }
}
