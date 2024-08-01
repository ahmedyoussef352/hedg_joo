import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/change_question_screen/change_question_state.dart';

class ChangeQuestionCubit extends Cubit<ChangeQuestionState> {
  ChangeQuestionCubit() : super(ChangeQuestionInitial());
  String currentQuestion = "";
  List<String> questions = [
    "What is your father's maiden name?",
    "What is your favorite food?",
    "What is your favorite color?",
    "What is your favorite movie?",
  ];

  void setCurrentQuestion(String question) {
    currentQuestion = question;
    emit(ChangedQuestionState());
  }
}
