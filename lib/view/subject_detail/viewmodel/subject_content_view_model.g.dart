// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_content_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubjectContentViewModel on _SubjectContentViewModel, Store {
  late final _$listContentAtom =
      Atom(name: '_SubjectContentViewModel.listContent', context: context);

  @override
  List<SubjectContentTypeEnum> get listContent {
    _$listContentAtom.reportRead();
    return super.listContent;
  }

  @override
  set listContent(List<SubjectContentTypeEnum> value) {
    _$listContentAtom.reportWrite(value, super.listContent, () {
      super.listContent = value;
    });
  }

  @override
  String toString() {
    return '''
listContent: ${listContent}
    ''';
  }
}
