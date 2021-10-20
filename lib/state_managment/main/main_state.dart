part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingState extends MainState{}

class MainLoadedState extends MainState{
  List<Contact> contact;
  MainLoadedState({required this.contact});
}

class MainErrorState extends MainState{}