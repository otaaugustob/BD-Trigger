use master

drop database Recursos_Humanos

create database Recursos_Humanos
go

use Recursos_Humanos;
go

create table funcionario

(cod_func				int				not null	primary key,
nomefunc				varchar(30)		not null,
emailfunc				varchar(40)		not null,
telefonefunc			numeric(9)		not null)
go

create table funcionariobackupinsert

(cod_func				int				not null	primary key,
nomefunc				varchar(30)		not null,
emailfunc				varchar(40)		not null,
telefonefunc			numeric(9)		not null)
go

create table funcionariobackupdelete

(cod_func				int				not null	primary key,
nomefunc				varchar(30)		not null,
emailfunc				varchar(40)		not null,
telefonefunc			numeric(9)		not null)
go

select * from funcionario
select * from funcionariobackupinsert
select * from  funcionariobackupdelete

create table professor_bk_insert

(id_prof				int				not null	primary key,
id_cur					int				not null,
nm_prof					varchar(50)		not null,
tt_hs_prof				int				not null,
vl_hora_prof			numeric(7,2)	not null)
go

create table professor_bk_delete

(id_prof				int				not null	primary key,
id_cur					int				not null,
nm_prof					varchar(50)		not null,
tt_hs_prof				int				not null,
vl_hora_prof			numeric(7,2)	not null)
go

/* fazendo a trigger para o insert*/

create trigger trg_insertfuncionario on funcionario
	after insert
	as begin
		insert into funcionariobackupinsert
		select * from inserted
	end
go

/* fazendo a trigger para o delete*/

create trigger trg_deletefuncionario on funcionario
	after delete
	as begin
		insert into funcionariobackupdelete
		select * from deleted
	end
go

/*fazendo inserção de dados na tabela funcionario*/

insert into funcionario(cod_func,nomefunc,emailfunc,telefonefunc)
values(5, 'Edson Dionísio', 'edson.dionisio@gmail.com', 997402801),
	  (8, 'Maitê Silva' , 'maite.silva@gmail.com', 997402801),
	  (12, 'Maliria Késsia' , 'testekessia@gmail.com', 997402801);

/*verificando os conteudos da tabelas*/

select * from funcionario
select * from funcionariobackupinsert
select * from  funcionariobackupdelete

/*fazendo delete de dados na tabela funcionario*/

delete from funcionario
where cod_func = 8;
go

/* verificando o conteúdo das tabelas */

select * from funcionario
select * from funcionariobackupinsert
select * from  funcionariobackupdelete

select * from sysobjects where type = 'TR';



