create schema pandemic;

use pandemic;

create table if not exists country_entity (
id int primary key not null auto_increment,
name varchar(64) not null,
code varchar(64) not null
);

insert into
country_entity (name, code)
select
Entity, Code
from infectious_cases
group by Entity, Code;


alter table infectious_cases
add column country_entity_id int not null default 0;

set sql_safe_updates = 0;
update infectious_cases as ic
inner join country_entity as ce on ic.Code = ce.code
set ic.country_entity_id = ce.id;
set sql_safe_updates = 1;

alter table infectious_cases
drop column Entity,
drop column Code;

alter table infectious_cases
add constraint fk_country_entity_id foreign key (country_entity_id) references country_entity(id);
