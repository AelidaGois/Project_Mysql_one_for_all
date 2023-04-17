SELECT nome_musica AS 'nome', COUNT(REP.id_musica) AS 'reproducoes' FROM SpotifyClone.musicas AS MUSI
INNER JOIN SpotifyClone.historico_reproducao AS REP ON REP.id_musica = MUSI.id_musica
INNER JOIN SpotifyClone.usuarios ON usuarios.id_usuario = REP.id_usuario
INNER JOIN SpotifyClone.planos ON usuarios.id_plano = planos.id_plano
WHERE planos.nome_plano IN('pessoal', 'gratuito')
GROUP BY nome_musica
ORDER BY nome_musica;