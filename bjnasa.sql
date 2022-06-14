create table  component_stock (
    component_code VARCHAR2(30),
    classify varchar2(20),
    com_count NUMBER(20),
    com_place varchar2(20),
    CONSTRAINT pk_component PRIMARY KEY (component_code)
);

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('BT-01','���͸�',5,'B17');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('BT-02','���͸�',4,'B17');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('BT-03','���͸�',4,'B17');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('CS-01','���Ͻ�����',6,'C6');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('CS-02','���Ͻ�����',3,'C6');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('CS-03','���Ͻ�����',7,'C7');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('CS-04','���Ͻ�����',7,'C7');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('EP-01','����',5,'E3');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('EP-02','����',4,'E3');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('EP-03','����',4,'E3');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('NS-01','����',85,'N21');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('NS-02','����',1100,'N21');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('NS-03','����',135,'N22');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('NS-04','����',273,'N22');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('NS-05','����',285,'N22');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('SW-01','������',6,'S11');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('SW-02','������',7,'S11');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('SW-03','������',5,'S11');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('TI-01','Ÿ�̾�',7,'T7');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('TI-02','Ÿ�̾�',8,'T7');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('TI-03','Ÿ�̾�',12,'T8');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('TI-04','Ÿ�̾�',10,'T8');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WH-01','��',3,'W13');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WH-02','��',7,'W13');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WH-03','��',2,'W14');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WH-04','��',5,'W14');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WH-05','��',6,'W15');

INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WP-01','������',35,'W19');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WP-02','������',8,'W19');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WP-03','������',15,'W19');
INSERT INTO component_stock(component_code,classify,com_count,com_place) VALUES ('WP-04','������',20,'W19');

commit;

select * from component_stock;