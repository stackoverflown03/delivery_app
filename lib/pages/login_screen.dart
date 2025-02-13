import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/pages/screen2.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  FirebaseAuth _auth=FirebaseAuth.instance;
  User? _user;
  String status=" ";
  UserCredential? usercred;

  void login(){
    User? cur=FirebaseAuth.instance.currentUser;
    _auth.authStateChanges().listen((cur) async {
      if(cur==null)
      {
        await createuser();
      }
      else{
       await loginuser();
      };
    });
  }
    final TextEditingController email=TextEditingController();
    final TextEditingController pw=TextEditingController();

    Future<void> createuser() async{
    try{
      String mail=email.text.trim();
      String pwd=pw.text.trim();
       usercred= await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail,
          password: pwd);
    }on FirebaseException catch(e)
    {setState(() {
      if(e.code=="weak-password")
      {status="Weak password";
      }else if(e.code=="email-already-in-use")
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else if(e.code=="invalid-email")
      {status="Inavlid Mail";}
    });
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> loginuser() async{
    try {
      String mail=email.text.trim();
      String pwd=pw.text.trim();
       usercred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mail,
          password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          status='No user found for that email.';
        } else if (e.code == 'wrong-password') {
          status='Wrong password provided for that user.';
        }
      });
    }
  }
  Future<void> logout() async {
      await FirebaseAuth.instance.signOut();
  }

  Future<void> persitence() async{
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  Future<void> auth() async{
    User? currentuser = FirebaseAuth.instance.currentUser;
    if(currentuser!=null) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      auth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login / Sign up"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome !',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter your Mail ID",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pw,
                decoration: InputDecoration(
                  hintText: "Type your Password",
                  border: OutlineInputBorder()
                ),
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: (){
                    login();
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),
                      child: Text("Submit",
                  style: TextStyle(
                    color: Colors.black
                  ),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: (){
                    logout();
                    persitence();
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber
                      ),
                      child: Text("Sign out",
                        style: TextStyle(
                            color: Colors.black
                        ),)),
                )
              ],
            ),
            Text("$status"),
          ],
        ),
      ),
    );

  }
}
