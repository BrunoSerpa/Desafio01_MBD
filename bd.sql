CREATE DATABASE bdpratica03;

USE bdpratica03;

CREATE table DEPARTAMENTO
{
    COD_DEPART int(4) auto_increment primary key,
    NOME varchar(30),
    DATA_INICIAL date
}

CREATE table PROJETO
{
    COD_PROJ int(4) auto_increment primary key,
    COD_DEPART int(4),
    TITULO varchar(150),
    DESCRICAO varchar(252),
    DAT_CAD date
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART)
}
CREATE table FUNCIONARIO
{
    COD_FUNC int(4) auto_increment primary key,
    NOME varchar (100),
    CPF char(15),
    SALARIO decimal(4,2),
    ENDERECO varchar(252),
    SEXO char(1),
    COD_SUPER int(4),
    COD_DEPART int(4),
    foreign key(COD_SUPER) references FUNCIONARIO(COD_FUNC),
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART)
}

CREATE table DEPENDENTE
{
    COD_FUNC int(4) primary key,
    SEQ int(4) auto_increment primary key,
    NOME varchar(100),
    PARENTESCO varchar(30),
    DATA_NASC date
    foreign key (COD_FUNC) references FUNCIONARIO(COD_FUNC),
}
CREATE table LOCALIZACAO
{
    COD_DEPART int(4) primary key,
    LOCAL varchar(252) auto_increment primary key
    foreign key(COD_DEPART) references DEPARTAMENTO(COD_DEPART)
}

CREATE table PARTICIPA
{
    COD_FUNC int(4) primary key,
    COD_PROJ int(4) primary key,
    HORAS varchar(50)
    foreign key (COD_FUNC) references FUNCIONARIO(COD_FUNC),
    foreign key (COD_PROJ) references PROJETO(COD_PROJ),
}