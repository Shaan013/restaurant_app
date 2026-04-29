// import 'dart:developer';
//
// import 'package:mobx/mobx.dart';
// import '../../core/locator/main_locator.dart';
// import '../models/respons/User_model.dart';
// import '../repository/user_repository.dart';
//
// part 'user_list_store.g.dart';
//
// class UserStore = _UserStore with _$UserStore;
//
// abstract class _UserStore with Store {
//   final UserRepository _userRepository = locator<UserRepository>();
//   @observable
//   ObservableFuture<List<UserModel>?> usersList = ObservableFuture.value(null);
//
//   // @observable
//   // ObservableFuture<UserModel?> user
//
//   @observable
//   String? errorMessage;
//
//   @computed
//   bool get isLoading => usersList.status == FutureStatus.pending;
//
//   @computed
//   bool get hasError => usersList.status == FutureStatus.rejected;
//
//   @computed
//   bool get isSuccess => usersList.status == FutureStatus.fulfilled;
//
//   @action
//   Future<void> fatchUserList() async {
//     try {
//       errorMessage = null;
//       usersList = ObservableFuture(_userRepository.getAllUser());
//       await usersList;
//     } catch (e) {
//       errorMessage = e.toString();
//       log("errorMassage  : ${e.toString()}");
//     }
//   }
//
//   Future<void> fatchProfilebyId(int id) async {
//     try {
//       errorMessage = null;
//       usersList = ObservableFuture(
//         _userRepository.getUserById(id).then((user) => [user]),
//       );
//       await usersList;
//       // log("User fetched: ${userProfile.value?.phone}");
//       print("userlist : ${usersList.value?.first.phone}");
//     } catch (e) {
//       errorMessage = e.toString();
//       log("errorMassage  : ${e.toString()}");
//     }
//   }
// }
