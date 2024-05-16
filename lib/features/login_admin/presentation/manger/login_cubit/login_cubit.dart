import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {

  emit(LoginLoading());
  var url = Uri.parse('http:/login'); // استبدل بعنوان URL الصحيح لنهاية تسجيل الدخول في الـ API الخاص بك
  var response = await http.post(url, body: {
    'email': email,
    'password': password,
  });
  if (response.statusCode == 200) {
    print('تسجيل الدخول ناجح!');
      emit(LoginSuccess());
      }
       else {
    print('فشل تسجيل الدخول!');
     emit(LoginFailure());
    }
    
    
  }
}
