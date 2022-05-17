// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/profile/profile.dart';
import 'package:http/http.dart' as http;

class LayoutController extends GetxController {
  int currentIndex = 0;

  // HomeModel? homeModel;
  // CategoriesModel? categoriesModel;
  // FavoritesModel? favoritesModel;
  // ChangeFavoritesModel? changeFavoritesModel;
  Profile? userModel;

  // LayoutController() {
  //   getUserData();
  // }

  Map<int, bool>? favorites = {};

  void changeLoginModel(Profile? userModel) {
    this.userModel = userModel;
    update();
  }

  Future<void> getUserData() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.api}/me/',
        ),
        headers: await Constants.headers,
      );
      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
      userModel = Profile.fromJson(responseMap['data']);
      print('---> LayoutController.userModel: $userModel');
      update();
    } catch (error) {
      print('--> Error.LayoutController.getuserData()__ $error __');
    }
  }

  // var initUpdateUserData = false.obs;

  // void updateUserData({
  //   required String name,
  //   required String email,
  //   required String phone,
  // }) {
  //   initUpdateUserData.value = true;

  //   // emit(ShopLoadingUpdateUserState());
  //   update();
  //   // it doesn't need token you can send it or no
  //   // DioHelper.putData(
  //   DioHelper.postData(
  //     url: UPDATEUSER,
  //     token: accessToken!,
  //     data: {
  //       'name': name,
  //       'phone_number': phone,
  //       'email': email,
  //     },
  //   ).then((value) {
  //     initUpdateUserData.value = false;
  //     userModel = LoginModel.fromJson(value.data);
  //     printFullText(
  //         '---> Cubit.updateUserData().userModel!.data!.name= __${userModel!.data!.name}__');
  //     // emit(ShopSuccessUpdateUserState(userModel!));
  //     changeLoginModel(userModel);
  //     update();
  //   }).catchError((error) {
  //     print('-----> Error_cubit.getUserData(): ${error.toString()}');
  //     // emit(ShopErrorUpdateUserState());
  //     update();
  //   });
  // }

  // ------------------------------------------------------------------

  void getHomeData() {
    // // emit(ShopLoadingHomeDataState());
    // update();
    // // token variable is saved at shared/contants variable .. to see token in any place
    // DioHelper.getData(url: HOME, token: accessToken!).then((value) {
    //   homeModel = HomeModel.fromJson(value.data);
    //   // printFullText() is hand made method existed in shared/constants
    //   print('---> homeModel.status: __' + homeModel!.status.toString());
    //   // printFullText('---> homeModel.data!.banners[0].image:__ ${homeModel!.data!.banners[0].image}');
    //   homeModel!.data!.products.forEach((element) {
    //     favorites!.addAll({element.id: element.inFavorites});
    //   });
    //   print('---> favorites: ${favorites.toString()}');
    //   // emit(ShopSuccessHomeDataState());
    //   update();
    // }).catchError((error) {
    //   print('---> Error_cubit.gethomeData: ${error.toString()}');
    //   // emit(ShopErrorHomeDataState());
    //   update();
    // });
  }

  void getGategories() {
    // // it doesn't need token you can send it or no
    // DioHelper.getData(url: GET_CATEGORIES).then((value) {
    //   categoriesModel = CategoriesModel.fromJson(value.data);
    //   // emit(ShopSuccessCategoriesState());
    //   update();
    // }).catchError((error) {
    //   print('---> Error_cubit.getGategories(): ${error.toString()}');
    //   // emit(ShopErrorCategoriesState());
    //   update();
    // });
  }

  void changeFavorites(int productId) {
    // // // reverse the bool value + null check
    // favorites![productId] = !favorites![productId]!;
    // // emit(ShopChangeFavoritesState());
    // update();

    // DioHelper.postData(
    //   url: FAVORITES,
    //   data: {
    //     'product_id': productId,
    //   },
    //   token: accessToken!,
    // ).then((value) {
    //   changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
    //   print(
    //       '---> ShopCubit.changeFavorites() .. value.data= __${value.data}__');
    //   // if the (status = false) .. change _color or state_ of _favorites icon_ you changed many lines above
    //   if (!changeFavoritesModel!.status!) {
    //     favorites![productId] = !favorites![productId]!;
    //   } else {
    //     getFavorites();
    //   }
    //   // emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    //   update();
    // }).catchError((error) {
    //   favorites![productId] = !favorites![productId]!;
    //   print('---> ShopCubit.changeFavorites() .. ERROR= __${error}__');
    //   // emit(ShopErrorChangeFavoritesState());
    //   update();
    // });
  }

  void getFavorites() {
    // // emit(ShopLoadingGetFavoritesState());
    // update();
    // // it doesn't need token you can send it or no
    // DioHelper.getData(url: FAVORITES, token: accessToken!).then((value) {
    //   favoritesModel = FavoritesModel.fromJson(value.data);
    //   printFullText(value.data.toString());
    //   // emit(ShopSuccessGetFavoritesState());
    //   update();
    // }).catchError((error) {
    //   print('---> Error_cubit.getFavorites(): ${error.toString()}');
    //   // emit(ShopErrorGetFavoritesState());
    //   update();
    // });
  }
}
