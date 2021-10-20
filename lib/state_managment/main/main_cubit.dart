import 'package:behtrino_test/date_managment/main/main_repository.dart';
import 'package:behtrino_test/logical/message_repository.dart';
import 'package:behtrino_test/models/contact.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  late MainRepository mainRepository;

  MainCubit() : super(MainInitial()) {
    mainRepository = MainRepository();
  }

  Future<void> fetchContact() async {
    emit(MainLoadingState());
    try {
      var listOfContact = await mainRepository.fetchContactFromRepository();
      if (listOfContact == null) {
        emit(MainErrorState());
        return;
      }
      setMessageOfContact(listOfContact);
      listOfContact = sortContact(listOfContact);
      emit(MainLoadedState(contact: listOfContact));
    } catch (error) {
      emit(MainErrorState());
      rethrow;
    }
  }

  void setMessageOfContact(List<Contact> listOfContact) {
    for (var element in listOfContact) {
      element.setMessage(
          MessageRepository.messageRepository.getLastMessageById(element.id));
    }
  }

  void refreshLastMessage(List<Contact> contacts) {
    setMessageOfContact(contacts);

    contacts = sortContact(contacts);

    emit(MainLoadedState(contact: contacts));
  }

  List<Contact> sortContact(List<Contact> contacts) {
    contacts.sort((a, b) => a.compareTo(b));
    contacts = contacts.reversed.toList();
    return contacts;
  }
}
