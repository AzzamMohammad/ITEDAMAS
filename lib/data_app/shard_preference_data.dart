import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/models/subject.dart';

class ShardPreferenceData{


  // token
  Future<void> SaveToken(String Token)async{
    final data = await SharedPreferences.getInstance();
    data.setString('token', Token);
  }

  Future<String> GetToken()async{
    final data = await SharedPreferences.getInstance();
    String? Token = data.getString('token');
    if(Token != null) {
      return Token;
    }
    return '';
  }

  Future<bool> RemoveToken()async{
    final data = await SharedPreferences.getInstance();
    if(await data.remove('token'))
      return true;
    return false;
  }

  // email
  Future<void> SaveEmail(String Email)async{
    final data = await SharedPreferences.getInstance();
    data.setString('email', Email);
  }

  Future<String> GetEmail()async{
    final data = await SharedPreferences.getInstance();
    String? Email = data.getString('email');
    if(Email != null)
      return Email;
    return '';
  }

  Future<bool> RemoveEmail()async{
    final data = await SharedPreferences.getInstance();
    if(await data.remove('email'))
      return true;
    return false;
  }


  // password
  Future<void> SavePassword(String Password)async{
    final data = await SharedPreferences.getInstance();
    data.setString('password', Password);
  }

  Future<String> GetPassword()async{
    final data = await SharedPreferences.getInstance();
    String? Password = data.getString('password');
    if(Password != null)
      return Password;
    return '';
  }

  Future<bool> RemovePassword()async{
    final data = await SharedPreferences.getInstance();
    if(await data.remove('password'))
      return true;
    return false;
  }

  // amount value

  Future<void> SaveAmountValue(int AmountValue)async{
    final data = await SharedPreferences.getInstance();
    data.setInt('amountValue', AmountValue);
  }

  Future<int> GetAmountValue()async{
    final data = await SharedPreferences.getInstance();
    int? AmountValue = data.getInt('amountValue');
    if(AmountValue != null){
      return AmountValue;
    }
    return 0;
  }

  Future<bool> RemoveAmountValue()async{
    final data = await SharedPreferences.getInstance();
    if(await data.remove('amountValue'))
      return true;
    return false;
  }

}