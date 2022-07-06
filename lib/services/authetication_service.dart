import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifeplus/services/user/database.dart';
import 'package:lifeplus/services/user/users.dart';



class AutheticationServices{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Users _userfromfirebase(User) {
    return Users(uid: User.uid);
  }




  Stream<Users> get user {
    return _auth.authStateChanges().map(_userfromfirebase);
  }
  Future singnAnno() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin({required String email,required String password})async{
    try{
             email=email.trim();
             password=password.trim();
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password.toString());
      User? user=credential.user;
      return _userfromfirebase(user);
    }
    on FirebaseAuthException catch(e){
             return e.message;
    }
  }


  Future signup({required String email,required String password,required String name,required String phone_no})async{
    try{
      email=email.trim();
      password=password.trim();
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=credential.user;
      await Database(uid: user!.uid).updateuser(name, email, phone_no, '0');
      return _userfromfirebase(user);
    }
    on FirebaseAuthException catch(e){
      return e.message;
      print(e.message.toString());
    }
  }

  Future<void> signout() async{
    await _auth.signOut();
  }
}