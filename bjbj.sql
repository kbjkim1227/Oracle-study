ALTER TABLE component_stock DROP COLUMN com_count;
ALTER TABLE component_stock DROP COLUMN com_place;

TRUNCATE TABLE component_stock;

INSERT INTO component_stock(component_code,classify) VALUES ('banana','바나나');
INSERT INTO component_stock(component_code,classify) VALUES ('apple','사과');
INSERT INTO component_stock(component_code,classify) VALUES ('footwear','신발');
INSERT INTO component_stock(component_code,classify) VALUES ('jacket','겉옷');
INSERT INTO component_stock(component_code,classify) VALUES ('wallet','지갑');
INSERT INTO component_stock(component_code,classify) VALUES ('mather','엄마');
INSERT INTO component_stock(component_code,classify) VALUES ('father','아빠');
INSERT INTO component_stock(component_code,classify) VALUES ('friend','친구');
INSERT INTO component_stock(component_code,classify) VALUES ('house','집');


commit;

SELECT
    *
FROM component_stock;