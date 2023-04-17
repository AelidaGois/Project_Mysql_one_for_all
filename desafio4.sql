SELECT usuario.nome_usuario AS 'usuario', 
IF (YEAR(MAX(HIST.data_reproducao)) > 2020, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario' 
FROM SpotifyClone.usuarios AS usuario
INNER JOIN SpotifyClone.historico_reproducao AS HIST ON HIST.id_usuario = usuario.id_usuario
GROUP BY usuario.nome_usuario
ORDER BY usuario.nome_usuario;