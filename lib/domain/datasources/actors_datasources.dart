import 'package:cinewiki/domain/entities/actor.dart';

abstract class ActorsDatasources {
  Future<List<Actor>> getActorsByMovie(String movieId);
}