PRAGMA foreign_keys = ON;

CREATE TABLE Participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE Evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE Inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT CHECK (status IN ('confirmada','cancelada')),
    FOREIGN KEY (id_evento) REFERENCES Evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES Participante(id) ON DELETE CASCADE
);

CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE,
    valor REAL CHECK (valor >= 0),
    data_pagamento TEXT,
    status TEXT CHECK (status IN ('pago','pendente')),
    FOREIGN KEY (id_inscricao) REFERENCES Inscricao(id) ON DELETE CASCADE
);

INSERT INTO Participante (nome, email, telefone) VALUES
('Carloss', 'carlos@unipam.edu.br', '34999999991'),
('Joao machado', 'joaomachado@unipam.edu.br', '34999999992'),
('Arthur', 'arthur@unipam.edu.br', '34999999993');


INSERT INTO Evento (nome, descricao, local, data) VALUES
('Evento de Moto', 'Evento oficial dos 244', 'Estacionamento Unipam', '2025-12-10'),
('Andar sobre 1 roda', 'Aula de treinamento para andar sobre 1 roda de moto', 'Estacionamento Unipam', '2025-12-10');


INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmada'), 
(1, 2, '2025-09-01', 'confirmada'), 
(2, 2, '2025-09-02', 'confirmada'), 
(2, 3, '2025-09-02', 'cancelada');  


INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 100.00, '2025-09-03', 'pago'),
(2, 100.00, '2025-09-03', 'pago'),
(3, 150.00, '2025-09-04', 'pendente'),
(4, 150.00, '2025-09-04', 'pago');