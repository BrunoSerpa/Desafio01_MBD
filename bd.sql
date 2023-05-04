drop database bdpratica03;
CREATE DATABASE bdpratica03;

USE bdpratica03;

CREATE table DEPARTAMENTO
(
    COD_DEPART int auto_increment primary key,
    NOME varchar(30),
    DATA_INICIAL date
);
CREATE table PROJETO
(
    COD_PROJ int auto_increment primary key,
    COD_DEPART int,
    TITULO varchar(150),
    DESCRICAO varchar(252),
    DAT_CAD date,
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART)
);

CREATE table FUNCIONARIO
(
    COD_FUNC int auto_increment,
    NOME varchar (100) not null,
    CPF char(15),
    SALARIO decimal(4,2),
    ENDERECO varchar(252),
    SEXO char(1),
    COD_SUPER int,
    COD_DEPART int,
    foreign key(COD_SUPER) references FUNCIONARIO(COD_FUNC),
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART),
    primary key(CPF, COD_FUNC)
);

CREATE table DEPENDENTE
(
    COD_FUNC int,
    SEQ int auto_increment primary key,
    NOME varchar(100),
    PARENTESCO varchar(30),
    DATA_NASC date,
    foreign key (COD_FUNC) references FUNCIONARIO(COD_FUNC)
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
    foreign key (COD_PROJ) references PROJETO(COD_PROJ)
);

/* select * from Participa, Localizacao, dependente, funcionario, projeto, departamento */