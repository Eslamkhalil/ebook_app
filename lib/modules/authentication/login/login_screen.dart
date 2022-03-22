
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/shared/constants.dart';
import '../../../utils/components/shared/default_button.dart';
import '../../../utils/components/shared/default_form_field.dart';
import '../../../utils/components/shared/default_text_button.dart';
import '../../home_screen/home.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = LoginCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 48.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Center(
                          child: Column(
                            children: [
                              DefaultFormField(
                                hint: 'Email',
                                preIcon: Icons.alternate_email_sharp,
                                controller: emailController,
                                isPassword: false,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              DefaultFormField(
                                hint: 'Password',
                                preIcon: Icons.lock_outline,
                                controller: passwordController,
                                isPassword: cubit.isPasswordShown,
                                sufIcon: cubit.sufIcon,
                                suffixPressed: () =>
                                    cubit.changePasswordVisibility(),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              DefaultButton(
                                buttonTitle: 'LOGIN',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                  print('Login hasBeenTapped');
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account ?",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  DefaultTextButton(
                                    color: Colors.blue,
                                    title: 'Register',
                                    onTap: () {
                                      navigateTo(
                                          context: context,
                                          widget:  RegisterScreen());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state is LoginSuccessState){
              navigateTo(context: context, widget: Home());
            }
          }),
    );
  }
}
/*

 */
