DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
  CREATE TABLE SpotifyClone.planos(
    id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(45) NOT NULL,
    valor DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_usuario VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      data_assinatura DATE NOT NULL,
      id_plano INTEGER NOT NULL,
        FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
    id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(45) NOT NULL
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
    id_usuario INT NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.albuns(
	id_albuns INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(50) NOT NULL,
    id_artista INT NOT NULL,
    data_lancamento YEAR NOT NULL,
    FOREIGN KEY(id_artista) REFERENCES artistas(id_artista)
)ENGINE=InnoDB;

  CREATE TABLE SpotifyClone.musicas(
    id_musica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_musica VARCHAR(45) NOT NULL,
    id_albuns INT NOT NULL,
    id_artista INT NOT NULL,
    duracao_segundos INT NOT NULL,
      FOREIGN KEY (id_albuns) REFERENCES albuns(id_albuns),
      FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
  ) engine = InnoDB;

   
  CREATE TABLE SpotifyClone.historico_reproducao(
	id_usuario INT NOT NULL,  
    id_musica INT NOT NULL , 
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (id_usuario, id_musica),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_musica) REFERENCES musicas(id_musica)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (nome_plano, valor)
  VALUES 
	('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.usuarios (nome_usuario, idade, id_plano, data_assinatura) VALUES 
  ('Barbara Liskov', 82, 1,'2019-10-20'),
  ('Robert Cecil Martin',58,1,'2017-01-06'),
  ('Ada Lovelace',37,4,'2017-12-30'),
  ('Martin Fowler',46,4,'2017-01-17'),
  ('Sandi Metz',58,4,'2018-04-29'),
  ('Paulo Freire',19,2,'2018-02-14'),
  ('Bell Hooks',26,2,'2018-01-05'),
  ('Christopher Alexander',85,3,'2019-06-05'),
  ('Judith Butler',45,3,'2020-05-13'),
  ('Jorge Amado',58,3,'2017-02-17');

INSERT INTO SpotifyClone.artistas (nome_artista) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.seguidores (id_usuario, id_artista) VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,2),
(4,4),
(5,5),
(5,6),
(6,6),
(6,1),
(7,6),
(9,3),
(10,2);

INSERT INTO SpotifyClone.albuns (nome_album, id_artista, data_lancamento) 
VALUES 
('Renaissance', 1, 2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.musicas (nome_musica, id_albuns, id_artista, duracao_segundos) VALUES 
('BREAK MY SOUL', 1, 1, 279),
('VIRGO’S GROOVE', 1, 1, 369),
('ALIEN SUPERSTAR', 1, 1, 116),
('Don’t Stop Me Now', 2, 2, 203),
('Under Pressure', 3, 2, 152),
('Como Nossos Pais', 4, 3, 105),
('O Medo de Amar é o Medo de Ser Livre', 5, 3, 207),
('Samba em Paris', 6, 4, 267),
('The Bard’s Song', 7, 5, 244),
('Feeling Good', 8, 6, 100);

INSERT INTO SpotifyClone.historico_reproducao (data_reproducao, id_usuario, id_musica) VALUES 
('2022-02-28 10:45:55', 1, 8),
('2020-05-02 05:30:35', 1, 2),
('2020-03-06 11:22:33', 1, 10),
('2022-08-05 08:05:17', 2, 10),
('2020-01-02 07:40:33', 2, 7),
('2020-11-13 16:55:13', 3, 10),
('2020-12-05 18:38:30', 3, 2),
('2021-08-15 17:10:10', 4, 8),
('2022-01-09 01:44:33', 5, 8),
('2020-08-06 15:23:43', 5, 5),
('2017-01-24 00:31:17', 6, 7),
('2017-10-12 12:35:20', 6, 1),
('2011-12-15 22:30:49', 7, 4),
('2012-03-17 14:56:41', 8, 4),
('2022-02-24 21:14:22', 9, 9),
('2015-12-13 08:30:22', 10, 3); 