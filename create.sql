CREATE TABLE IF NOT EXISTS contatos(
id_contato INT NOT NULL PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
cel VARCHAR(255) NOT NULL,
pizza VARCHAR(255) NOT NULL,
cadastro date NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE contatos;


CREATE TABLE IF NOT EXISTS entregas(
id_entregas INT NOT NULL PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
cel VARCHAR(255) NOT NULL,
pizza VARCHAR(255) NOT NULL,
cadastro date NOT NULL DEFAULT CURRENT_TIMESTAMP,
situacao VARCHAR(30)

);

DROP TABLE entregas;

--Inserir dados na tabela entregas

--Criar a tabela pedido
CREATE TABLE IF NOT EXISTS pedido(
id_pedido SERIAL PRIMARY KEY,
id_entregas INT NOT NULL,
id_contato INT NOT NULL,
id_pizza INT NOT NULL,
data_pedido DATE NOT NULL,
CONSTRAINT fk_id_entregas FOREIGN KEY (id_entregas) REFERENCES entregas (id_entregas),
CONSTRAINT fk_id_pizza FOREIGN KEY (id_pizza) REFERENCES pizzas (id_pizza),
CONSTRAINT fk_id_contato FOREIGN KEY (id_contato) REFERENCES contatos (id_contato)
);

DROP TABLE pedido;


CREATE TABLE IF NOT EXISTS pizzas(
id_pizza SERIAL PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
preco DECIMAL(10, 2) NOT NULL,
ingredientes TEXT NOT NULL
);


DROP TABLE pizzas;

--Inserir dados na tabela pizzas
INSERT INTO pizzas (nome, preco, ingredientes)
VALUES
( 'Calabresa', 25.99, 'Calabresa, cebola, molho de tomate, queijo'),
( 'Marguerita', 22.50, 'Molho de tomate, mussarela, manjericão, tomate'),
( 'Quatro queijos', 28.75, 'Mussarela, parmesão, gorgonzola, catupiry'),
( 'Frango com catupiry', 30.00, 'Frango desfiado, catupiry, molho de tomate, cebola'),
( 'Portuguesa', 27.50, 'Presunto, mussarela, ovo, cebola, azeitona, ervilha, molho de tomate'),
( 'Pepperoni', 26.50, 'Mussarela, pepperoni, molho de tomate, orégano'),
( 'Vegetariana', 29.99, 'Pimentão, cebola, milho, azeitona, champignon, molho de tomate'),
( 'Mussarela', 21.00, 'Mussarela, molho de tomate, orégano'),
( 'Atum', 30.50, 'Atum, cebola, azeitona, molho de tomate'),
( 'Bacon', 26.75, 'Bacon, mussarela, molho de tomate');


--insetir dados na tabela contatos
INSERT INTO contatos (id_contato, nome, email, cel, pizza, cadastro)
VALUES
(1, 'João Silva', 'joao@example.com', '123456789', 'Calabresa', CURRENT_DATE),
(2, 'Maria Souza', 'maria@example.com', '987654321', 'Marguerita', CURRENT_DATE),
(3, 'Pedro Oliveira', 'pedro@example.com', '456789123', 'Quatro queijos', CURRENT_DATE),
(4, 'Ana Santos', 'ana@example.com', '321654987', 'Frango com catupiry', CURRENT_DATE),
(5, 'Carlos Lima', 'carlos@example.com', '789123456', 'Portuguesa', CURRENT_DATE),
(6, 'Mariana Costa', 'mariana@example.com', '456123789', 'Pepperoni', CURRENT_DATE),
(7, 'Lucas Pereira', 'lucas@example.com', '159753468', 'Vegetariana', CURRENT_DATE),
(8, 'Juliana Fernandes', 'juliana@example.com', '357951246', 'Calabresa', CURRENT_DATE),
(9, 'Fernando Almeida', 'fernando@example.com', '852369741', 'Marguerita', CURRENT_DATE),
(10, 'Camila Santos', 'camila@example.com', '369852147', 'Quatro queijos', CURRENT_DATE);



--Inserir dados na tabela pedidos
INSERT INTO pedido (id_entregas, id_contato, id_pizza, data_pedido)
VALUES
(1, 1, 1, CURRENT_DATE),
(2, 2, 2, CURRENT_DATE),
(3, 3, 3, CURRENT_DATE),
(4, 4, 4, CURRENT_DATE),
(5, 5, 5, CURRENT_DATE),
(6, 6, 6, CURRENT_DATE),
(7, 7, 7, CURRENT_DATE),
(8, 8, 8, CURRENT_DATE),
(9, 9, 9, CURRENT_DATE),
(10, 10, 10, CURRENT_DATE);


INSERT INTO entregas (id_entregas, nome, email, cel, pizza, cadastro, situacao)
VALUES
(1, 'João Silva', 'joao@example.com', '123456789', 'Calabresa', CURRENT_DATE, 'Em andamento'),
(2, 'Maria Souza', 'maria@example.com', '987654321', 'Marguerita', CURRENT_DATE, 'Pendente'),
(3, 'Pedro Oliveira', 'pedro@example.com', '456789123', 'Quatro queijos', CURRENT_DATE, 'Entregue'),
(4, 'Ana Santos', 'ana@example.com', '321654987', 'Frango com catupiry', CURRENT_DATE, 'Em andamento'),
(5, 'Carlos Lima', 'carlos@example.com', '789123456', 'Portuguesa', CURRENT_DATE, 'Pendente'),
(6, 'Mariana Costa', 'mariana@example.com', '456123789', 'Pepperoni', CURRENT_DATE, 'Entregue'),
(7, 'Lucas Pereira', 'lucas@example.com', '159753468', 'Vegetariana', CURRENT_DATE, 'Em andamento'),
(8, 'Juliana Fernandes', 'juliana@example.com', '357951246', 'Calabresa', CURRENT_DATE, 'Pendente'),
(9, 'Fernando Almeida', 'fernando@example.com', '852369741', 'Marguerita', CURRENT_DATE, 'Entregue'),
(10, 'Camila Santos', 'camila@example.com', '369852147', 'Quatro queijos', CURRENT_DATE, 'Em andamento');


SELECT * FROM entregas;

SELECT * FROM pedido;

SELECT * FROM contatos;

SELECT * FROM pizzas;

SELECT * FROM clientes;

-- Criar a tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cel VARCHAR(255) NOT NULL
);

DROP TABLE clientes;

INSERT INTO clientes (id_cliente, nome, email, cel)
VALUES
(1, 'João Silva', 'joao@example.com', '123456789'),
(2, 'Maria Souza', 'maria@example.com', '987654321'),
(3, 'Pedro Oliveira', 'pedro@example.com', '456789123'),
(4, 'Ana Santos', 'ana@example.com', '321654987'),
(5, 'Carlos Lima', 'carlos@example.com', '789123456'),
(6, 'Mariana Costa', 'mariana@example.com', '456123789'),
(7, 'Lucas Pereira', 'lucas@example.com', '159753468'),
(8, 'Juliana Fernandes', 'juliana@example.com', '357951246'),
(9, 'Fernando Almeida', 'fernando@example.com', '852369741'),
(10, 'Camila Santos', 'camila@example.com', '369852147');



-- Alterar a tabela de entregas para incluir a referência ao cliente
ALTER TABLE entregas
ADD COLUMN id_cliente INT,
ADD CONSTRAINT fk_id_cliente_entregas FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

-- Alterar a tabela de contatos para incluir a referência ao cliente
ALTER TABLE contatos
ADD COLUMN id_cliente INT,
ADD CONSTRAINT fk_id_cliente_contatos FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

;


--exerc 1
SELECT 
    pedido.id_pedido,
    clientes.nome AS nome_cliente,
    clientes.email AS email_cliente,
    clientes.cel AS celular_cliente,
    pedido.id_entregas,
    pedido.id_contato,
    pedido.id_pizza,
    pedido.data_pedido
FROM 
    pedido
JOIN 
    contatos ON pedido.id_contato = contatos.id_contato
JOIN 
    clientes ON contatos.id_cliente = clientes.id_cliente;



--exerc 2 
SELECT 
    pedido.id_pedido,
    pedido.id_entregas,
    pedido.id_contato,
    pedido.id_pizza,
    pedido.data_pedido,
    pizzas.nome AS nome_pizza,
    pizzas.preco AS preco_pizza,
    pizzas.ingredientes AS ingredientes_pizza
FROM 
    pedido
JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza;

CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL
);


-- Adicionar alguns funcionários
INSERT INTO funcionarios (id_funcionario, nome, cargo)
VALUES
('João Silva', 'Entregador'),
('Maria Souza', 'Atendente'),
('Pedro Oliveira', 'Cozinheiro'),
('Ana Santos', 'Gerente'),
('Carlos Lima', 'Atendente'),
('Mariana Costa', 'Cozinheiro'),
('Lucas Pereira', 'Entregador'),
('Juliana Fernandes', 'Atendente'),
('Fernando Almeida', 'Cozinheiro'),
('Camila Santos', 'Entregador');



SELECT 
    funcionarios.nome AS nome_funcionario,
    funcionarios.cargo AS cargo_funcionario
FROM 
    funcionarios;

CREATE TABLE IF NOT EXISTS funcionarios_pedido (
    id_funcionario_pedido SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);



--exercicio 5 
SELECT 
    clientes.nome AS nome_cliente,
    clientes.email AS email_cliente,
    clientes.cel AS celular_cliente,
    pedido.id_pedido,
    pedido.id_entregas,
    pedido.id_pizza,
    pedido.data_pedido
FROM 
    clientes
JOIN 
    contatos ON clientes.id_cliente = contatos.id_cliente
JOIN 
    pedido ON contatos.id_contato = pedido.id_contato;


--exerc 6 

SELECT nome, ingredientes
FROM pizzas;


--exerc 7 
SELECT 
    pedido.id_pedido,
    entregas.nome AS nome_cliente,
    entregas.email AS email_cliente,
    entregas.cel AS celular_cliente,
    entregas.pizza AS pizza_pedido,
    entregas.cadastro AS data_entrega,
    entregas.situacao AS situacao_entrega
FROM 
    pedido
JOIN 
    entregas ON pedido.id_entregas = entregas.id_entregas;


    --exerc 8
    CREATE TABLE IF NOT EXISTS supervisor (
    id_supervisor SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL
);


INSERT INTO supervisor (id_supervisor, nome, cargo)
VALUES
(1,'Supervisor 1', 'Gerente'),
(2,'Supervisor 2', 'Coordenador'),
(3,'Supervisor 3', 'Líder de Equipe'),
(4,'Supervisor 4', 'Supervisor de Vendas'),
(5,'Supervisor 5', 'Supervisor de Produção'),
(6,'Supervisor 6', 'Supervisor de Logística'),
(7,'Supervisor 7', 'Supervisor de Qualidade'),
(8,'Supervisor 8', 'Supervisor de RH'),
(9,'Supervisor 9', 'Supervisor Financeiro'),
(10,'Supervisor 10', 'Supervisor de TI');


SELECT 
    f.nome AS nome_funcionario,
    f.cargo AS cargo_funcionario,
    s.nome AS nome_supervisor,
    s.cargo AS cargo_supervisor
FROM 
    funcionarios AS f
LEFT JOIN 
    funcionarios AS s ON f.id_supervisor = s.id_funcionario;


--exerci 9 

SELECT 
    pedido.id_pedido,
    pizzas.nome AS nome_pizza,
    tamanhos_pizza.tamanho AS tamanho_pizza
FROM 
    pedido
JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza
LEFT JOIN 
    tamanhos_pizza ON pedido.id_tamanho_pizza = tamanhos_pizza.id_tamanho_pizza;
