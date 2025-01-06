import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinewiki/domain/entities/movie.dart';

import 'package:cinewiki/presentation/delegates/search_movie_delegate.dart';
import 'package:cinewiki/presentation/providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_creation_outlined,
                color: colors.primary,
              ),
              const SizedBox(width: 5),
              Text('CineWiki', style: titleStyle),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  final searchMovies = ref.read(searchMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  // Llamar a showSearch de forma asíncrona
                  final movie = await showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      initialMovies: searchMovies,
                      searchMovies: ref.read(searchMoviesProvider.notifier).searchMoviesByQuery,
                    ),
                  );

                  // Verificar si el widget sigue montado antes de usar el contexto
                  if (movie != null && context.mounted) {
                    context.push('/home/0/movie/${movie.id}');
                  }
                },
                icon: Icon(
                  Icons.search,
                  color: colors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
