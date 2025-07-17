import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/pages/loading_cubit.dart';
import '../functions/login_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController email = TextEditingController();
final TextEditingController pw = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoadingCubit>().showLoading();
      LoginFunctions(overLay: context.read<LoadingCubit>()).auth(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit,LoadingState>(builder: (context, state) {
      if (state is LoadingShown) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is LoadingHidden) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Login / Sign up",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: "Enter your Mail ID",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: pw,
                    decoration: InputDecoration(
                        hintText: "Type your Password",
                        border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            await LoginFunctions(overLay: context.read<LoadingCubit>()).loginuser(context);
                            await LoginFunctions(overLay: context.read<LoadingCubit>()).auth(context);
                            email.clear();
                            pw.clear();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    });
  }
}
