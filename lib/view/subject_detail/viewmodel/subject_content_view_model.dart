import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../model/subject_content_type.dart';

part 'subject_content_view_model.g.dart'; // This is the generated file.

class SubjectContentViewModel = _SubjectContentViewModel with _$SubjectContentViewModel;

abstract class _SubjectContentViewModel with Store, BaseViewModel {
  @observable
  List<SubjectContentTypeEnum> listContent = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    getListContent();
  }

  void getListContent() {
    listContent = [
      SubjectContentTypeEnum.theory,
      SubjectContentTypeEnum.exercises,
      SubjectContentTypeEnum.videos,
      SubjectContentTypeEnum.sampleTests,
      SubjectContentTypeEnum.answers,
    ];
  }
}