

CREATE TABLE TransPackageContent (SN int(10) NOT NULL AUTO_INCREMENT, ExpressID char(24) NOT NULL, PackageID char(24) NOT NULL, Status int(10) NOT NULL, PRIMARY KEY (SN)) CHARACTER SET UTF8;
CREATE TABLE TransHistory (SN int(11) NOT NULL AUTO_INCREMENT, PackageID char(24) NOT NULL, ActTime datetime NOT NULL, UIDFrom int(10) NOT NULL, UIDTo int(10) NOT NULL, x float, y float, PRIMARY KEY (SN)) CHARACTER SET UTF8;
CREATE TABLE TransPackage (ID char(24) NOT NULL, SourceNode char(8), TargetNode char(8), CreateTime datetime NULL, Status int(4), PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE ExpressSheet (ID char(24) NOT NULL, Type int(4) NOT NULL, Sender int(10), Recever int(10), Weight float, TranFee float, PackageFee float, InsuFee float, Accepter varchar(16), Deliver varchar(16), AccepteTime datetime NULL, DeliveTime datetime NULL, Acc1 varchar(64), Acc2 varchar(64), Status int(4), PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE Posion (PosCode int(10) NOT NULL AUTO_INCREMENT, X float NOT NULL, Y float NOT NULL, PRIMARY KEY (PosCode)) CHARACTER SET UTF8;
CREATE TABLE TransNode (ID char(8) NOT NULL, NodeName varchar(32), NodeType int(10), RegionCode varchar(6), TelCode varchar(24), x float, y float, PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE UserInfo (UID int(10) NOT NULL AUTO_INCREMENT, PWD varchar(8), Name varchar(16), URull int(4), TelCode varchar(24), Status int(4), DptID char(16), ReceivePackageID char(24), DelivePackageID char(24), TransPackageID char(24), PRIMARY KEY (UID)) CHARACTER SET UTF8;
CREATE TABLE Region (RegionCode char(6) NOT NULL, Prv varchar(32), Cty varchar(32), Twn varchar(32), Stage int(4) NOT NULL, PRIMARY KEY (RegionCode)) CHARACTER SET UTF8;
CREATE TABLE CustomerInfo (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(16), TelCode varchar(24), Department varchar(64), RegionCode char(6), Address varchar(64), PostCode int(10), PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE UsersPackage (SN int(10) NOT NULL AUTO_INCREMENT, UserUID int(10) NOT NULL, PackageID char(24) NOT NULL, PRIMARY KEY (SN)) CHARACTER SET UTF8;
CREATE TABLE PackageRoute (SN int(10) NOT NULL AUTO_INCREMENT, PackageID char(24) NOT NULL, x float NOT NULL, y float NOT NULL, tm datetime NOT NULL, PRIMARY KEY (SN)) CHARACTER SET UTF8;

ALTER TABLE PackageRoute ADD INDEX packageroute (PackageID), ADD CONSTRAINT packageroute FOREIGN KEY (PackageID) REFERENCES TransPackage (ID);
ALTER TABLE UsersPackage ADD INDEX FKUsersPacka497996 (UserUID), ADD CONSTRAINT FKUsersPacka497996 FOREIGN KEY (UserUID) REFERENCES UserInfo (UID);
ALTER TABLE UsersPackage ADD INDEX FKUsersPacka5233 (PackageID), ADD CONSTRAINT FKUsersPacka5233 FOREIGN KEY (PackageID) REFERENCES TransPackage (ID);
ALTER TABLE TransPackageContent ADD INDEX FKTransPacka6349 (ExpressID), ADD CONSTRAINT FKTransPacka6349 FOREIGN KEY (ExpressID) REFERENCES ExpressSheet (ID);
ALTER TABLE ExpressSheet ADD INDEX FKExpressShe115006 (Sender), ADD CONSTRAINT FKExpressShe115006 FOREIGN KEY (Sender) REFERENCES CustomerInfo (ID);
ALTER TABLE ExpressSheet ADD INDEX FKExpressShe199945 (Recever), ADD CONSTRAINT FKExpressShe199945 FOREIGN KEY (Recever) REFERENCES CustomerInfo (ID);
ALTER TABLE TransPackageContent ADD INDEX packagecontent (PackageID), ADD CONSTRAINT packagecontent FOREIGN KEY (PackageID) REFERENCES TransPackage (ID);
ALTER TABLE TransHistory ADD INDEX packagehistory (PackageID), ADD CONSTRAINT packagehistory FOREIGN KEY (PackageID) REFERENCES TransPackage (ID);
