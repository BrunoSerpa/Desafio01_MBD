create DATABASE bdpratica05;
USE bdpratica05;

CREATE table DEPARTAMENTO
(
    COD_DEPART int auto_increment primary key,
    NOME varchar(30) not null,
    DATA_INICIAL date
);
CREATE table PROJETO
(
    COD_PROJ int auto_increment primary key,
    COD_DEPART int,
    TITULO varchar(150) not null,
    DESCRICAO varchar(252),
    DAT_CAD date default(curdate()),
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART)
);
alter table PROJETO add STATUS_PROJ int check(STATUS_PROJ="1" or STATUS_PROJ="0") not null, modify TITULO varchar(155) not null, rename column DAT_CAD to DATA_CADASTRO;
create table ENDERECO
(
	COD_ENDE int auto_increment primary key,
    BAIRRO varchar(200) not null,
    CIDADE varchar(200) not null,
    CEP char(8) not null,
    ESTADO char(2) not null,
    RUA varchar(200) not null,
    COMPLEMENTO varchar(100)
);
CREATE table FUNCIONARIO
(
    COD_FUNC int auto_increment primary key,
    NOME varchar (100) not null,
    CPF char(15) unique,
    SALARIO decimal(8,2),
    ENDERECO varchar(252),
    SEXO char(1),
    COD_SUPER int,
    COD_DEPART int,
    foreign key(COD_SUPER) references FUNCIONARIO(COD_FUNC),
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART),
    CONSTRAINT salMinimo CHECK(SALARIO > 1000.00),
    CONSTRAINT mf CHECK(Sexo = "M" or Sexo = "F")
);
alter table FUNCIONARIO modify ENDERECO int, add foreign key(ENDERECO) references ENDERECO(COD_ENDE), drop constraint salMinimo;
CREATE table DEPENDENTE
(
    COD_FUNC int,
    SEQ int auto_increment primary key,
    NOME varchar(100) not null,
    PARENTESCO varchar(30) not null,
    DATA_NASC date,
    foreign key (COD_FUNC) references FUNCIONARIO(COD_FUNC),
    CONSTRAINT familia CHECK(PARENTESCO = "PAI" or PARENTESCO = "MÃE" or PARENTESCO = "IRMAOS" or PARENTESCO = "FILHO")
);
alter table DEPENDENTE drop column PARENTESCO, drop constraint familia;
CREATE table PARENTESCO(
	COD_PARE int auto_increment primary key,
    DESCRICAO varchar(30) not null,
    COD_DEPE int,
    foreign key (COD_DEPE) references DEPENDENTE(SEQ) ON DELETE CASCADE,
    CONSTRAINT familia CHECK(DESCRICAO = "PAI" or DESCRICAO = "MÃE" or DESCRICAO = "IRMAOS" or DESCRICAO = "FILHO")
);
CREATE table LOCALIZACAO
(
    COD_DEPART int,
    LOCAL varchar(252),
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART),
    primary key(COD_DEPART, LOCAL)
);
CREATE table PARTICIPA
(
	COD_FUNC int,
    COD_PROJ int,
    HORAS varchar(50),
    foreign key (COD_FUNC) references FUNCIONARIO(COD_FUNC),
    foreign key (COD_PROJ) references PROJETO(COD_PROJ),
    primary key(COD_FUNC, COD_PROJ)
);
rename table PARTICIPA to FUNC_PROJETO;