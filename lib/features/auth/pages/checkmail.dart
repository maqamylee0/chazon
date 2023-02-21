import 'package:chazon/services/auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';


class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(


              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    SizedBox(

                      height: 150,
                      width: 150,
                      child:Image.asset("assets/logo_black.png",height: 200,width: 300,),

                      //Image.asset("assets/img.png")
                    ),
                    Text("Check your mail",style:TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.fromLTRB(60, 10, 40, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("We sent a password link to \n"
                              "      ${FirebaseAuth.instance.currentUser?.email}", style: TextStyle(fontSize: 12.5)),

                        ],

                      ),
                    ),


                    SizedBox(height:60),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () {onPressed();},
                        child: const Text('Open Email App',style: TextStyle(color: Colors.white),)
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive mail?"),
                        TextButton(onPressed: (){onPressed2(context);}, child: Text("Click to Resend"))
                      ],
                    )
                  ]
              ),

            )

        )
    );
  }
  void onPressed2(context) {
    AuthService auth = AuthService();
    String? email = FirebaseAuth.instance.currentUser?.email;
    auth.passwordReset(email, context);
  }
  void onPressed() {
    checkmail();
  }

  void checkmail()async {
    await OpenMailApp.openMailApp();
  }
}
