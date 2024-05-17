drop database if exists fortificar;
create database Fortificar;
use Fortificar;

create table if not exists Departamentos(
ID_Departamentos int AUTO_INCREMENT Primary key,
Departamento varchar(45) not null,
Funcao varchar(100) not null);

create table if not exists Fortes(
ID_Funcionarios int AUTO_INCREMENT primary key,
ID_departamentos int not null,
constraint Dep_for foreign key (ID_Departamentos) references Departamentos(ID_Departamentos)
);

create table if not exists Horarios_disp(
Mes int,
dia_hora datetime not null,
Status enum("Livre","Ocupado") not null,
ID_departamentos int not null,
constraint Dep_Hor foreign key (ID_Departamentos) references Departamentos(ID_Departamentos)
);

create table if not exists Equipe(
Funcao varchar(100) primary key,
Formacao varchar(45)not null,
carg_hor_sem int(3) not null);

create table if not exists Instituicoes (
ID_inst int AUTO_INCREMENT primary key,
instituicao varchar(45) not null,
Apoio_necessario varchar(45) not null,
descricao varchar(100)
);

create table if not exists Periodo_Exec(
ID_periodo int AUTO_INCREMENT primary key,
Inicio date not null,
Fim date not null,
Meta varchar(45) not null,
Valor int not null,
Indicador varchar(45) not null,
Metodologia varchar(45) not null
);

create table if not exists Plano_Aplic(
Etapas int not null,
Valor int not null,
Inicio date not null,
Fim date not null,
Plano_aplicado VArchar(45) not null,
ID_periodo int not null,
constraint Plan_per foreign key (ID_periodo) references periodo_exec(ID_periodo)
);

create table if not exists Requisicao(
ID_req int AUTO_INCREMENT primary key,
Objeto varchar(45) not null,
Objetivo varchar(45) not null,
Justificativa varchar(100) not null,
ID_inst int not null,
ID_Periodo int not null,
constraint Inst_rec foreign key (ID_inst) references Instituicoes(ID_inst),
constraint Per_rec foreign key (ID_Periodo) references Periodo_Exec(ID_Periodo)
);

create table if not exists Requisicao_formacao(
ID_req int not null,
ID_Inst int not null,
funcao varchar(100) not null,
constraint Req_Form foreign key (Funcao) references Equipe(Funcao),
constraint Form_Req foreign key (ID_req) references Requisicao(ID_req),
constraint Inst_form foreign key (ID_Inst) references Requisicao(ID_Inst)
);

create table if not exists Membros(
ID_membro int AUTO_INCREMENT primary key,
ID_inst int not null,
constraint Mem_Inst foreign key (ID_inst) references Instituicoes(ID_inst)
);
create table if not exists Colaboradores(
CPF Varchar (14) primary key,
Nome varchar (45) not null,
sobrenome varchar (100) not null,
Telefone varchar(11) not null,
Email varchar(45) not null,
Senha varchar (45) not null,
ID_Funcionarios int not null,
ID_membro int not null,
constraint Funcionario foreign key (ID_Funcionarios) references Fortes(ID_Funcionarios),
constraint Membro foreign key (ID_membro) references membros(ID_membro)
);

create table if not exists Equipe_Colaboradores(
Funcao varchar(100) not null,
CPF varchar(14) not null,
constraint Equi_col foreign key (Funcao) references Equipe(Funcao),
constraint Col_Equi foreign key (CPF) references colaboradores(CPF)
);