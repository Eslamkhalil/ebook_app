
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/loacal/cache_helper.dart';
import '../../../utils/components/shared/constants.dart';
import '../../../utils/components/shared/default_button.dart';
import '../../../utils/components/shared/default_form_field.dart';
import '../../../utils/components/shared/default_text_button.dart';
import '../../home_screen/home.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Singup',
                              style: TextStyle(
                                fontSize: 48.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            DefaultFormField(
                              controller: nameController,
                              hint: 'Name',
                              preIcon: Icons.person_outline,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            DefaultFormField(
                              hint: 'Email',
                              controller: emailController,
                              preIcon: Icons.alternate_email_sharp,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            DefaultFormField(
                              hint: 'Phone',
                              controller: phoneController,
                              preIcon: Icons.phone_iphone_outlined,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            DefaultFormField(
                              hint: 'Password',
                              isPassword: cubit.isPasswordShown,
                              controller: passwordController,
                              preIcon: Icons.lock_outline,
                              sufIcon: cubit.sufIcon,
                              suffixPressed: () =>
                                  cubit.changePasswordVisibility(),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.platform,
                              title: const Text(
                                  'by checking you agree to the terms and conditions'),
                              value: cubit.rememberMe,
                              onChanged: (newValue) =>
                                  cubit.checkBoxState(newValue!),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                           state is !RegisterLoadingState ? DefaultButton(
                              buttonTitle: 'SING UP',
                              onTap: () {
                                if (formKey.currentState!.validate() &&
                                    cubit.rememberMe) {
                                  cubit.userRegister(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      name: nameController.text.trim(),
                                      phone: phoneController.text.trim());
                                }else{
                                  debugPrint('check box is not selected');
                                }
                              },
                            ) : const Center(child: CircularProgressIndicator(),),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Center(
                              child: DefaultTextButton(
                                color: Colors.blue,
                                onTap: () {
                                  navigateTo(context: context, widget: Login());
                                },
                                title: 'Back To Login',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state is RegisterSuccessState){
              CacheHelper.saveData(key: 'uId', value: state.uId,);
              navigateTo(context: context, widget: Home());
            }

          }),
    );
  }
}
