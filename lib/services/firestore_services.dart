import 'package:emart_app/consts/consts.dart';

class FirestoreServices {

  //get users data
  static getUser(uid){
    return firestore.collection(usersCollections).where('id', isEqualTo: uid).snapshots();
  }
  
  //get products according to category
   static getProducts(category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
   }
}