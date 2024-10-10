import 'package:coffee_shop/common/bloc/button/button_state.dart';
import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {
          emit(
            ButtonFailureState(errorMessage: error),
          );
        },
        (data) {
          emit(
            ButtonSuccessState(),
          );
        },
      );
    } catch (e) {
      emit(
        ButtonFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
