SELECT usuarios.nome_usuario AS usuario,
COUNT(DISTINCT(historico_reproducao.id_musica)) AS qt_de_musicas_ouvidas,
ROUND(SUM(musicas.duracao_segundos/60), 2) AS total_minutos

FROM SpotifyClone.usuarios
INNER JOIN SpotifyClone.historico_reproducao ON usuarios.id_usuario = historico_reproducao.id_usuario
INNER JOIN SpotifyClone.musicas ON historico_reproducao.id_musica = musicas.id_musica
GROUP BY usuarios.nome_usuario ORDER BY nome_usuario ASC;