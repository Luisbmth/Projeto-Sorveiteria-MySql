create database ProjetoFornecedor; 
use ProjetoFornecedor;


create table Produtora(
cnpj bigint(15),
id int (12),
nome_fantasia varchar(200)default 'não tao bom demais',
nome varchar(200) default 'Associação Chatuba ltda',
funcionarios int ,
catalogo varchar(170),
data_fabricacao date,
modelos_de_maquinas varchar(80),
cep varchar(8) default "26587700",
endereço varchar(200) default "Travessa Particular",
Complemento varchar(100) default "lote 12"
);



	alter table Produtora     
		add constraint PK_Produtora primary key (cnpj),
		modify cnpj bigint(15) not null,
        modify id int(15) not null,
		modify funcionarios int not null,
		modify catalogo varchar(170) not null,
		modify data_fabricacao date not null,
		modify modelos_de_maquinas varchar(80);
    
    
create table Fornecedor(
cnpj bigint(15),
id int(12),
nome_fantasia varchar(200)default 'não tao bom demais',
nome varchar(200) default 'Associação Chatuba ltda',
fabrica varchar(50) default 'fabrica 1',
funcionarios int ,				
produtos varchar(200),
data_validade date,
cep varchar(8) default "26554370",
endereço varchar(200)default 'Rua Guarata',
produtora_cnpj bigint
);    


	alter table Fornecedor     
		add constraint PK_Fornecedor primary key (cnpj),
		modify cnpj bigint(15) not null,
        modify id int(15) not null,
		modify funcionarios int not null,
		modify produtos varchar(200),
		modify data_validade date not null,
		add foreign key (produtora_cnpj) references Produtora(cnpj);


create table Sorveteria(
cnpj bigint(15),
id int (12),
nome_fantasia varchar(200)default 'não tao bom demais',
nome varchar(200)default 'Associação Chatuba ltda',
funcionarios int, 
produtos varchar(70)default 'Sorvete',
cep int(8)default "26574680",
endereço varchar(200)default 'Rua Bela',
pedidos int,
estoque int,
fornecedor_cnpj bigint
);


	alter table Sorveteria     
			add constraint PK_Sorveteria primary key (cnpj),
            modify id int(15) not null,
			modify funcionarios int not null,
			modify pedidos int not null,
            modify estoque int not null,
			add foreign key (fornecedor_cnpj) references Fornecedor(cnpj);
            
create table Funcionario(
cpf bigint (11),
id int(12)default "01",
nome varchar (150),
cargo varchar (35)default "Estoquista",
salario decimal (8) default "1300",
idade int(3)default "18",
email varchar(100) , 
celular varchar (11) default "não possui",
cep int(8),
endereco varchar (100) ,
data_contratacao date,
sorveteria_cnpj bigint
);


	alter table Funcionario     
		add constraint PK_Funcionario primary key (cpf),
		modify cpf bigint(15) not null,
		modify nome varchar(150) not null,
		modify email varchar(100) not null,
		modify data_contratacao date not null,
		modify cep int(8) not null,
        modify endereco varchar (100) not null,
		add foreign key (sorveteria_cnpj) references Sorveteria(cnpj);
           

create table Mercadoria(
id bigint(12)default "0001", 
descricao varchar (80)default "Sorvete mais saboroso da região",
validade int (9),
sabor varchar (30)default "Chocolate",
tipo varchar (30)default "Sorvete",
preco decimal (5),
marca varchar(100)default "nestlé",
peso decimal (5),
igredientes varchar(100),
taxa_calorica float(4),
fornecedor_cnpj bigint
);


	alter table Mercadoria     
		add constraint PK_Mercadoria primary key (id),
        modify validade int(9) not null,
        modify preco decimal(5) not null,
        modify peso decimal(5) not null,
		modify igredientes varchar(100) not null,
		modify taxa_calorica float(4) not null,
		add foreign key (fornecedor_cnpj) references Fornecedor(cnpj);
   

create table Cliente(
    cpf bigint (11),
    nome varchar (60),
    sobrenome varchar (60),
    celular bigint (11) default "21973030216",  
    endereco varchar (100),
    avaliacao varchar (50) default "boa",
    pagamento decimal (5),
    genero varchar (9) default "feminino",
    data_de_nascimento varchar(10) default "21022022",
    estado_civil varchar (20) default "Solteiro",
    funcionario_cpf bigint
);


alter table Cliente  
		add constraint PK_Cliente primary key (cpf),
        modify cpf bigint(11) not null,
		modify nome varchar (60) not null,
		modify sobrenome varchar (100) not null,
        modify endereco varchar (100) not null,
		modify pagamento decimal (5) not null,
		add foreign key (funcionario_cpf) references Funcionario(cpf) on delete cascade,
        alter column avaliacao set default "ótima";


INSERT INTO Produtora (cnpj, id, nome_fantasia, nome, funcionarios, catalogo, data_fabricacao, modelos_de_maquinas, cep, endereço, Complemento) 
VALUES 
    (12345678901230, 1, 'Produtora XYZ', 'Associação Chatuba ltda', 10, 'Catálogo XYZ', '2023-01-01', 'Modelo A, Modelo B', '26587700', 'Travessa Particular', 'lote 12'),
    (23456789012345, 2, DEFAULT, DEFAULT, 8, 'Catálogo ABC','2023-01-01' , 'Modelo C', DEFAULT, DEFAULT, DEFAULT),
    (34567890123456, 3, DEFAULT, 'Produtora Delta', 12, 'Catálogo Delta', '2022-06-15', DEFAULT, '26500000', DEFAULT, DEFAULT),
    (45678901234567, 4, 'Produtora XYZ', DEFAULT, 23, 'Catálogo XYZ', '2023-01-01', 'Modelo B', DEFAULT, 'Rua Principal', 'bloco A'),
    (56789012345678, 5, DEFAULT, 'Produtora Ômega', 2, 'Catálogo Ômega','2023-01-01', DEFAULT, '26500000', 'Rua Principal', DEFAULT),
    (67890123456789, 6, 'Produtora Zeta', DEFAULT, 15,'Catálogo Ômega' , '2023-12-31', 'Modelo D', '26500000', 'Rua Principal', DEFAULT),
    (78901234567890, 7, DEFAULT, 'Produtora Epsilon', 12, 'Catálogo Ômega', '2022-10-01', DEFAULT, DEFAULT, DEFAULT, 'lote 10'),
    (89012345678901, 8, DEFAULT, DEFAULT, 20, 'Catálogo Alpha','2023-01-01', DEFAULT, '26554321', DEFAULT, DEFAULT),
    (90123456789012, 9, 'Produtora Omega', 'Associação Chatuba ltda',14 ,'Catálogo Alpha' , '2023-01-01', DEFAULT, DEFAULT, 'Rua Principal', DEFAULT),
    (12345678901234, 10, 'Produtora Alpha', DEFAULT, 8, 'Catálogo Alpha', '2023-01-01', 'Modelo A, Modelo B', DEFAULT, 'Rua Principal', DEFAULT);
    
    
INSERT INTO Fornecedor (cnpj, id, nome_fantasia, nome, fabrica, funcionarios, produtos, data_validade, cep, endereço, produtora_cnpj)
VALUES 
    (98765432109876, 1, 'Fornecedor ABC', DEFAULT, 'Fabrica ABC', 5, 'Produto ABC', '2023-01-01', '26554370', 'Rua Guarata', 12345678901230),
    (87654321098765, 2, DEFAULT, 'Fornecedor alta', DEFAULT, 8, 'Produto XYZ', '2022-01-01', DEFAULT, DEFAULT, 23456789012345),
    (76543210987654, 3, DEFAULT, 'Fornecedor Delta', 'Produto Delta', 10, '2022-08-15','2023-02-11', '26500000', 'Rua Principal', 34567890123456),
    (65432109876543, 4, 'Fornecedor Zeta', DEFAULT, DEFAULT, 9,'Produto Zeta', '2023-11-30', DEFAULT, 'Rua Principal', 45678901234567),
    (54321098765432, 5, DEFAULT, 'Fornecedor Epsilon', DEFAULT,  11, "produto agua", '2023-12-01', DEFAULT, DEFAULT, 56789012345678),
    (43210987654321, 6, 'Fornecedor Omega', DEFAULT,  'Fabrica AB', 15, "produto arroz", '2024-12-31', '26554321', DEFAULT, 67890123456789),
    (32109876543210, 7, DEFAULT, DEFAULT, DEFAULT,7, 'Fabrica yut', '2024-01-04', DEFAULT, '26554321', 78901234567890),
    (21098765432109, 8, 'Fornecedor Alpha', 'Associação Chatuba ltda', DEFAULT, 9, "icecream", '2023-01-01', '26500000', DEFAULT, 89012345678901),
    (10987654321098, 9, DEFAULT, DEFAULT, "fabrica r", 9, "produto menta", '2023-08-05', DEFAULT, 'Rua Principal', 90123456789012),
    (12345678901234, 10, 'Fornecedor Beta', 'Associação Chatuba ltda', DEFAULT, 9, 'uva','2022-05-01', '26500000', DEFAULT,12345678901234);


INSERT INTO Sorveteria (cnpj, id, nome_fantasia, nome, funcionarios, produtos, cep, endereço, pedidos, estoque, fornecedor_cnpj)
VALUES 
    (55555555555555, 1, 'Sorveteria da Praça', DEFAULT, 8, 'Sorvete de morango', '26574680', 'Rua Bela', 50, 100, 98765432109876),
    (66666666666666, 2, DEFAULT, DEFAULT, 9, DEFAULT, '26500000', 'Rua Principal', 10, 70, 87654321098765),
    (77777777777777, 3, 'Sorveteria Alpha', 'Associação Chatuba ltda', 8, DEFAULT, DEFAULT, DEFAULT, 57, 109,76543210987654),
    (88888888888888, 4, DEFAULT, 'Sorveteria Zeta', 10, 'Sorvete de baunilha', DEFAULT, 'Rua Principal', 5, 50, 65432109876543),
    (99999999999999, 5, 'Sorveteria Delta', DEFAULT, 5, DEFAULT, '26554370', DEFAULT, 34, 89, 54321098765432),
    (12345098765432, 6, 'Sorveteria Omega', 'Associação Chatuba ltda', 15, DEFAULT, DEFAULT, '2023-12-31', 23, 96, 43210987654321),
    (23456109876543, 7, DEFAULT, DEFAULT, 10, 'Sorvete de pistache', DEFAULT, DEFAULT, 23, 70, 32109876543210),
    (34567210987654, 8, 'Sorveteria Beta', DEFAULT, 7, 'Sorvete de creme', DEFAULT, '26554321', 34, 59, 21098765432109),
    (45678321098765, 9, DEFAULT, 'Sorveteria Epsilon', 23, 'Sorvete de chocolate', DEFAULT, DEFAULT, 12, 93, 10987654321098),
    (56789432109876, 10, 'Sorveteria Gamma', DEFAULT, 20, DEFAULT, DEFAULT, DEFAULT, 21, 98, 12345678901234);


INSERT INTO Funcionario (cpf, id, nome, cargo, salario, idade, email, celular, cep, endereco, data_contratacao, sorveteria_cnpj)
VALUES 
    (12345678900, 1, 'João', 'Gerente', 3000.00, 30, 'joao@example.com', '21987654321', '26500000', 'Rua Principal', '2022-01-01', 55555555555555),
    (23456789012, 2, 'Marco', DEFAULT, DEFAULT, 20, 'marco@example.com', DEFAULT, '24129032', 'Rua das Flores', '2022-01-01', 66666666666666),
    (34567890123, 3, 'Maria', 'Vendedor', DEFAULT, 20, 'maria@example.com', DEFAULT, '24129234', 'Rua Principal', '2022-01-01', 77777777777777),
    (45678901234, 4, 'Bruno', DEFAULT, 1500.00, DEFAULT, 'bruno@example.com', DEFAULT, '26554321', 'Rua Principal', '2022-01-01', 12345098765432),
    (56789012345, 5, 'José', DEFAULT, 1600.00, DEFAULT, 'jose@example.com', '21976543210', '24129876', 'Rua Principal', '2022-01-01', 99999999999999),
    (67890123456, 6, 'Luis', 'Caixa', DEFAULT, DEFAULT, 'luis@example.com', DEFAULT, '26554321', 'Rua Principal', '2022-06-15', 12345098765432),
    (78901234567, 7, 'Ana', DEFAULT, 1400.00, 25, 'ana@example.com', DEFAULT, '24585852', 'Rua Principal', '2022-01-01', 34567210987654),
    (89012345678, 8, 'Marcelo', 'Caixa', DEFAULT, DEFAULT, 'marcelo@example.com', DEFAULT, '24165432', 'Rua Principal', '2022-01-01',34567210987654),
    (90123456789, 9, 'Carlos', 'Atendente', DEFAULT, 34, 'carlos@example.com', '21987654321', '9382432', 'Rua Principal', '2023-01-01', 45678321098765),
    (12345678901, 10,'Yuri', 'Vendedor', 2000.00, DEFAULT, 'yuri@example.com', DEFAULT, '248329032', 'Rua Principal', '2022-01-01', 56789432109876);


INSERT INTO Mercadoria (id, descricao, validade, sabor, tipo, preco, marca, peso, igredientes, taxa_calorica, fornecedor_cnpj)
VALUES 
    (1, 'Sorvete de chocolate', 30, DEFAULT, DEFAULT, 5.99, 'Kibom', 100, 'Leite, cacau, açúcar', 150.5, 98765432109876),
    (2, DEFAULT, 345, 'Uva', 'Picole', 5.99, 'Kibom', 100, 'Leite, uva, açúcar', 150.5, 87654321098765),
    (3, 'Sorvete de morango', 30, 'Morango', 'Sorvete', 5.99, 'Kibom', 100, 'Leite, morango, açúcar', 150.5, 76543210987654),
    (4, DEFAULT, 45, 'Baunilha', DEFAULT, 4.99, 'Kibom', 100, 'Leite, essencia de baunilha', 150.5, 65432109876543),
    (5, DEFAULT, 12, 'Creme', DEFAULT, 5.99, 'Kibom', 100, 'Leite, ovo, açúcar', 150.5, 54321098765432),
    (6, 'Sorvete de pistache', 30, 'Pistache', DEFAULT, 8.99, DEFAULT, 100, 'Pistache, açúcar', 50.5, 43210987654321),
    (7, DEFAULT, 235, 'Passas ao Rum', DEFAULT, 7.99, 'Kibom', 100, 'Leite, passas, açúcar, saborizaçao de rum', 100.5, 32109876543210),
    (8, DEFAULT, 37, DEFAULT, 'Picole', 2.99, DEFAULT, 100, 'Leite, cacau, açúcar', 134.5, 21098765432109),
    (9, DEFAULT, 36, 'Chocolate Branco', DEFAULT, 12.99, 'Kibom', 100, 'Leite, cacau, açúcar', 106.5, 10987654321098),
    (10,DEFAULT, 23, 'Chocolate Branco','Picole', 5.99, 'Kibom', 100, 'Leite, cacau, açúcar', 156.5, 32109876543210);


INSERT INTO Cliente (cpf, nome, sobrenome, celular, endereco, avaliacao, pagamento, genero, data_de_nascimento, estado_civil, funcionario_cpf)
VALUES 
    (11111111111, 'Ana', 'Silva', 21987654321, 'Rua das Flores, 123', 'ruim', 50.00, DEFAULT, '04112005', 'Casada', 12345678900),
    (22222222222, 'Silvio', 'Santos', DEFAULT, 'Rua das Flores, 153', 'amei', 999.00, 'masculino', '01011999', 'Casado', 23456789012),
    (33333333333, 'Pedro', 'Santos', DEFAULT, 'Avenida Principal, 456', DEFAULT, 56.00, 'masculino', DEFAULT, 'Solteiro',67890123456 ),
    (44444444444, 'Mariana', 'Oliveira', DEFAULT, 'Rua das Flores, 123', 'ótima', 80.00, DEFAULT, '01011999', 'Casada', 45678901234),
    (55555555555, 'Gustavo', 'Pereira', DEFAULT, 'Rua das Flores, 123', DEFAULT, 12.00, 'masculino', DEFAULT, 'Solteiro', 56789012345),
    (66666666666, 'Lucas', 'Silva', 219873454321, 'Rua das Flores, 123', DEFAULT, 20.00, 'masculino', '04112005', 'Casado', 56789012345),
    (77777777777, 'Samuel', 'Dias', 2198734568990, 'Rua das Árvores, 23', DEFAULT, 5.00, 'masculino', DEFAULT, DEFAULT, 78901234567),
    (88888888888, 'Juliana', 'Pereira', 2198734937578, 'Rua das Árvores, 123', 'ruim', 50.00, DEFAULT, '04112005', DEFAULT, 90123456789),
    (99999999999, 'Rafael', 'Martins', 219873409375, 'Rua das Árvores, 789', DEFAULT, 50.00, 'masculino', DEFAULT, 'Solteiro', 78901234567),
    (99999999995, 'Rafael', 'Martins', 219873409375, 'Rua das Árvores, 789', DEFAULT, 50.00, 'masculino', DEFAULT, 'Solteiro', 78901234567);
