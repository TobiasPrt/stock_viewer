import 'package:equatable/equatable.dart';

// Interface for usecases, to enforce call()
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

// Helper class for when the usecase does not need any params
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}