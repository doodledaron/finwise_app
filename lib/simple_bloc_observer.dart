//for development purpose, track state changes in Bloc
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc ${bloc.runtimeType}, event : $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc ${bloc.runtimeType}, change : $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc ${bloc.runtimeType}, transition : $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(
        'onError -- bloc ${bloc.runtimeType}, error : $error stackTrace: $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose -- bloc ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
