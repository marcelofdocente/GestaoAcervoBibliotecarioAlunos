create database livro_db_v2;
use livro_db_v2;

create table Usuarios
(
id_usuario INT primary key auto_increment,
nome varchar(100) NOT NULL,
sobrenome varchar(100) NOT NULL,
email varchar(150) NOT NULL UNIQUE,
senha varchar(255) NOT NULL
);


CREATE TABLE Livros 
( 
    id_livro  INT PRIMARY KEY AUTO_INCREMENT,  
    titulo    VARCHAR(150)  NOT NULL,  
    descricao VARCHAR(255)  NOT NULL,  
    autor     VARCHAR(255)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE Estoque 
( 
    id_estoque       INT PRIMARY KEY AUTO_INCREMENT,  
    id_livro         INT NOT NULL,  
    quantidade_atual INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_estoque_livro
      FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
      ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ATENÇÃO: agora com ON DELETE CASCADE para Livros
CREATE TABLE Log_movimentacao_estoque 
( 
    id_movimentacao   INT PRIMARY KEY AUTO_INCREMENT,  
    id_livro          INT NOT NULL,  
    id_usuario        INT NOT NULL,  
    data_movimentacao DATE NOT NULL,  
    tipo              VARCHAR(50) NOT NULL,  
    quantidade        INT NOT NULL,  
    CONSTRAINT fk_log_livro
      FOREIGN KEY (id_livro)   REFERENCES Livros(id_livro)
      ON DELETE CASCADE,
    CONSTRAINT fk_log_usuario
      FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
      -- sem CASCADE para usuários por regra de negócio (ajuste se desejar)
      ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dados de exemplo
INSERT INTO Usuarios (nome, sobrenome, email, senha) VALUES
  ('Joao', 'Carlos', 'joao@empresa.com', '1234'),
  ('Mariana',  'Oliveira',    'mariana.oliveira@empresa.com', '12345'),
  ('João',     'Santos',      'joao.santos@empresa.com', '9887');

INSERT INTO Usuarios (nome, sobrenome, email, senha) VALUES
  ('Marcelo', 'Freitas', 'marcelo@empresa.com', '1234');


INSERT INTO Livros (titulo, descricao, autor) VALUES
  ('Aprendendo SQL',        'Guia completo de SQL para iniciantes', 'Carlos Lima'),
  ('JavaScript Avançado',   'Técnicas avançadas de JS',             'Ana Souza'),
  ('PHP na Prática',        'Desenvolvendo aplicações web com PHP', 'Bruno Ferreira');

-- Estoque atual (referencia Livros)
INSERT INTO Estoque (id_livro, quantidade_atual) VALUES
  (1, 50),
  (2, 30),
  (3, 20);

-- Movimentações (referenciam Livros e Usuarios)
INSERT INTO Log_movimentacao_estoque (id_livro, id_usuario, data_movimentacao, tipo, quantidade) VALUES
  (1, 1, '2025-10-01', 'entrada', 20),
  (2, 2, '2025-10-02', 'saida',    5),
  (3, 3, '2025-10-03', 'entrada', 15);

-- Consultas úteis
-- SELECT * FROM Usuarios;
-- SELECT * FROM Livros;
-- SELECT * FROM Estoque;
-- SELECT * FROM Log_movimentacao_estoque;

SELECT id_livro, titulo, autor FROM livros;

-- ATIVIDADE PRATICA 1

-- ATIVIDADE PRATICA 2
