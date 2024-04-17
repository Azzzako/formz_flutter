import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body:BlocProvider(
        create: (context) => RegisterCubit(),
        child:  const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FlutterLogo(size: 100),
            _RegisterForm(),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String username = '';

  // String password = '';

  // String email = '';

  @override
  Widget build(BuildContext context) {
  final registerCubit = context.watch<RegisterCubit>();
  final username = registerCubit.state.username;
  final password = registerCubit.state.password;
  final email = registerCubit.state.email;
    return Form(
      // key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contrasenia',
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                // final isValid = _formKey.currentState!.validate();
                // if (!isValid) return;
                registerCubit.onSubmit()
;              },
              icon: const Icon(Icons.save),
              label: const Text('Crear user')),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
