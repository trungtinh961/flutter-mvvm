import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/menu/model/menu_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/image/image_constant.dart';

part 'menu_view_model.g.dart'; // This is the generated file.

class MenuViewModel = _MenuViewModel with _$MenuViewModel;

abstract class _MenuViewModel with Store, BaseViewModel {
  @observable
  List<MenuModel> listMenu = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    getListMenu();
  }

  void getListMenu() {
    listMenu = [
      MenuModel(
        name: "Văn học",
        image: ImageConstants.instance.booksIcon,
        subjectType: SubjectType.literature,
      ),
      MenuModel(
        name: "Toán",
        image: ImageConstants.instance.booksIcon,
        subjectType: SubjectType.mathematics,
      ),
      MenuModel(
        name: "Hoá học",
        image: ImageConstants.instance.booksIcon,
        subjectType: SubjectType.chemistry,
      ),
      MenuModel(
        name: "Vật lí",
        image: ImageConstants.instance.booksIcon,
        subjectType: SubjectType.physics,
      ),
      MenuModel(
        name: "Anh văn",
        image: ImageConstants.instance.booksIcon,
        subjectType: SubjectType.english,
      ),
      MenuModel(
        name: "Góp ý xây dựng",
        image: ImageConstants.instance.feedbackIcon,
        feedbackType: FeedbackType.suggestions,
      ),
      MenuModel(
        name: "Tư vấn tâm lí",
        image: ImageConstants.instance.feedbackIcon,
        feedbackType: FeedbackType.psychologicalCounseling,
      ),
    ];
  }
}
