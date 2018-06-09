INSERT INTO USER VALUES(1,'00/00/0000','1654196A','iw@admin.ucm.es',1,'manuel',0,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Manuel','Freire','ADMIN','','','42')
INSERT INTO USER VALUES(2,'00/00/0000','1654196A','bartolo@admin.ucm.es',1,'b',0,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Bartolo','Muñoz','ADMIN','','','42')

INSERT INTO USER VALUES(3,'02/07/1993','8885156G','pacosol@ucm.es',1,'p',4,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Paco','Solano','TECHNICIAN','Iphone','Reparo todo tipo de Iphone','28030')
INSERT INTO USER VALUES(4,'01/12/1997','6666666C','ceciliog@ucm.es',1,'c',0,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Cecilio','Gonzalez','USER','','','28030')
INSERT INTO USER VALUES(5,'30/01/1997','6456789C','adriancoll@ucm.es',1,'a',0,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Adrian','Collazo','USER','','','28040')
INSERT INTO USER VALUES(6,'02/07/1993','8821358G','nuriasan@ucm.es',1,'pp',3,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Nuria','Sanchez','TECHNICIAN','Laptop','Tengo mucha experiencia en reparar portatiles','28040')
INSERT INTO USER VALUES(7,'08/04/1995','6165687R','rubenalamo@ucm.es',1,'r',0,'$2a$04$NwYuA6rd/UbCs3H8mntvPuqyFuUsX8sTKI1WDYwqrXhncXWIklscW','Ruben','Alamo','USER','','','28057')


INSERT INTO OFFER VALUES(1,'04/06/2018','Pantalla IphoneX rota, no funciona tactil', 1 , 0, 'Pantalla Rota', '28031', 4 )
INSERT INTO OFFER VALUES(2,'03/06/2018','Zuckerberg lo sabe todo de mi vida', 10 , 1, 'Webcam hackeada', '28032', 5 )
INSERT INTO OFFER VALUES(3,'21/05/2018','Se me ha roto el movil, pantalla rota', 0 , 1, 'Pantalla Samsung S9', '28043', 4 )
INSERT INTO OFFER VALUES(4,'27/06/2018','creo que se me ha fundido la fuente de alimentacion, el ordenador se apagó de repente y ya no enciente', 3 , 1, 'Mi pc ha muerto', '28033', 5 )
INSERT INTO OFFER VALUES(5,'15/04/2018','No se enciende mi portatil, sale una pantalla azul', 2 , 1, 'Portatil HP estropeado', '28033', 7 )
INSERT INTO OFFER VALUES(6,'15/04/2018','nomefuncionalabarraespaciadora', 9 , 1, 'TecladoRoto', '28013', 7 )

INSERT INTO REPAIR VALUES(1,'10','04/06/2018', 99, 0, 1,4,3)

INSERT INTO MENSAJE VALUES(1,'Error al registrarme, me da error por X motivo', 'nuriasan@ucm.es', '02/07/2017', 'Nuria', 6)
INSERT INTO MENSAJE VALUES(2,'Por favor, me podeis decir mi contraseña? se me ha olvidado', 'ceciliog@ucm.es', '03/07/2017', 'Cecilio',4)
INSERT INTO MENSAJE VALUES(3,'Como puedo enviar un mensaje al equipo de soporte?', 'ceciliog@ucm.es', '04/07/2017', 'Cecilio', 4)
INSERT INTO MENSAJE VALUES(4,'No se publica mi oferta, ya lo he intentado varias veces', 'adriancoll@ucm.es', '02/08/2017', 'Adrian',5)
INSERT INTO MENSAJE VALUES(5,'El tecnico me ha robado mi movil, os voy a denunciar', 'nuriasan@ucm.es', '23/09/2017', 'Nuria', 6)
INSERT INTO MENSAJE VALUES(6,'El cliente no contacta conmigo, y tengo su dispositivo ya reparado, quiero mi dinero.', 'pacosol@ucm.es', '17/07/2017', 'Paco', 3)