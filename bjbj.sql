ALTER TABLE component_stock DROP COLUMN com_count;
ALTER TABLE component_stock DROP COLUMN com_place;

TRUNCATE TABLE component_stock;

INSERT INTO component_stock(component_code,classify) VALUES ('banana','�ٳ���');
INSERT INTO component_stock(component_code,classify) VALUES ('apple','���');
INSERT INTO component_stock(component_code,classify) VALUES ('footwear','�Ź�');
INSERT INTO component_stock(component_code,classify) VALUES ('jacket','�ѿ�');
INSERT INTO component_stock(component_code,classify) VALUES ('wallet','����');
INSERT INTO component_stock(component_code,classify) VALUES ('mather','����');
INSERT INTO component_stock(component_code,classify) VALUES ('father','�ƺ�');
INSERT INTO component_stock(component_code,classify) VALUES ('friend','ģ��');
INSERT INTO component_stock(component_code,classify) VALUES ('house','��');


commit;

SELECT
    *
FROM component_stock;