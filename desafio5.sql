SELECT SpotifyClone.musicas.nome_musica AS 'cancao', COUNT(REP.id_musica) AS 'reproducoes' FROM SpotifyClone.musicas
INNER JOIN SpotifyClone.historico_reproducao AS REP ON REP.id_musica = SpotifyClone.musicas.id_musica
GROUP BY SpotifyClone.musicas.nome_musica
ORDER BY reproducoes DESC, SpotifyClone.musicas.nome_musica
LIMIT 2;