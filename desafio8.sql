SELECT nome_artista AS 'artista', albuns.nome_album AS 'album' FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns ON albuns.id_artista = art.id_artista
WHERE nome_artista = 'Elis Regina'
ORDER BY albuns.nome_album;