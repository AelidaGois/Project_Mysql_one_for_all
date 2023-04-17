SELECT ART.nome_artista AS 'artista', 
ALB.nome_album AS 'album',
COUNT(SEGUI.id_artista) AS 'seguidores'
FROM SpotifyClone.artistas AS ART
INNER JOIN SpotifyClone.albuns AS ALB ON ALB.id_artista = ART.id_artista
INNER JOIN SpotifyClone.seguidores AS SEGUI ON SEGUI.id_artista = ART.id_artista
GROUP BY ART.nome_artista, ALB.id_albuns, SEGUI.id_artista
ORDER BY seguidores DESC, ART.nome_artista, ALB.nome_album;