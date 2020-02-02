--CREATE DATABASE [MilOficios];
--USE [MilOficios];

/****** Object:  Table [dbo].[Cliente] ******/
CREATE TABLE [dbo].[Cliente](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Contratista] ******/
CREATE TABLE [dbo].[Contratista](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Contratista] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Lugar] ******/
CREATE TABLE [dbo].[Lugar](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lugar] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Servicio] ******/
CREATE TABLE [dbo].[Servicio](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[CodContratista] [int] NOT NULL,
	[CodLugar] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Contrato] ******/
CREATE TABLE [dbo].[Contrato](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Indicaciones] [varchar](50) NOT NULL,
	[Comentarios] [varchar](50) NOT NULL,
	[CodCliente] [int] NOT NULL,
	[CodServicio] [int] NOT NULL,
	[CodLugar] [int] NOT NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Llaves Foraneas - Tabla Servicio ******/
ALTER TABLE dbo.Servicio
  ADD CONSTRAINT FK_Servicio_Contratista
    FOREIGN KEY(CodContratista) REFERENCES dbo.Contratista(Codigo)

ALTER TABLE dbo.Servicio
  ADD CONSTRAINT FK_Servicio_Lugar
    FOREIGN KEY(CodLugar) REFERENCES dbo.Lugar(Codigo)

/****** Llaves Foraneas - Tabla Contrato ******/
ALTER TABLE dbo.Contrato
  ADD CONSTRAINT FK_Contrato_Cliente
    FOREIGN KEY(CodCliente) REFERENCES dbo.Cliente(Codigo)

ALTER TABLE dbo.Contrato
  ADD CONSTRAINT FK_Contrato_Servicio
    FOREIGN KEY(CodServicio) REFERENCES dbo.Servicio(Codigo)

ALTER TABLE dbo.Contrato
  ADD CONSTRAINT FK_Contrato_Lugar
    FOREIGN KEY(CodLugar) REFERENCES dbo.Lugar(Codigo)

/****** Datos de Prueba - Tabla Lugar  -  105 valores ******/
INSERT INTO Lugar VALUES ('Lima');
INSERT INTO Lugar VALUES ('Arequipa');
INSERT INTO Lugar VALUES ('Ayacucho');
INSERT INTO Lugar VALUES ('Tacna');
INSERT INTO Lugar VALUES ('Cuzco');
insert into Lugar (Ciudad) values ('Sukasirna');
insert into Lugar (Ciudad) values ('Velasco Ibarra');
insert into Lugar (Ciudad) values ('Huangpi');
insert into Lugar (Ciudad) values ('Ansan-si');
insert into Lugar (Ciudad) values ('Ventersdorp');
insert into Lugar (Ciudad) values ('Pokrovskoye');
insert into Lugar (Ciudad) values ('Ḏânan');
insert into Lugar (Ciudad) values ('Si Thep');
insert into Lugar (Ciudad) values ('Guaçuí');
insert into Lugar (Ciudad) values ('Ayabe');
insert into Lugar (Ciudad) values ('Rokitno');
insert into Lugar (Ciudad) values ('Ash Shuqayrah');
insert into Lugar (Ciudad) values ('Kalidung');
insert into Lugar (Ciudad) values ('Metulla');
insert into Lugar (Ciudad) values ('Sam Chuk');
insert into Lugar (Ciudad) values ('Wulijie');
insert into Lugar (Ciudad) values ('Bacnotan');
insert into Lugar (Ciudad) values ('Kidangbang');
insert into Lugar (Ciudad) values ('Khairiahmandah');
insert into Lugar (Ciudad) values ('Buan');
insert into Lugar (Ciudad) values ('Vallentuna');
insert into Lugar (Ciudad) values ('Lutian');
insert into Lugar (Ciudad) values ('Morales');
insert into Lugar (Ciudad) values ('Bourg-en-Bresse');
insert into Lugar (Ciudad) values ('Setúbal');
insert into Lugar (Ciudad) values ('Masinloc');
insert into Lugar (Ciudad) values ('Sabang');
insert into Lugar (Ciudad) values ('Langchuan');
insert into Lugar (Ciudad) values ('Lufang');
insert into Lugar (Ciudad) values ('Ashmūn');
insert into Lugar (Ciudad) values ('Marneuli');
insert into Lugar (Ciudad) values ('Nova Friburgo');
insert into Lugar (Ciudad) values ('Mathambgwane');
insert into Lugar (Ciudad) values ('Chicago');
insert into Lugar (Ciudad) values ('Nioro');
insert into Lugar (Ciudad) values ('Achoma');
insert into Lugar (Ciudad) values ('Junqueiro');
insert into Lugar (Ciudad) values ('Kihancha');
insert into Lugar (Ciudad) values ('Samanggen');
insert into Lugar (Ciudad) values ('Khlevnoye');
insert into Lugar (Ciudad) values ('Kedungwungu');
insert into Lugar (Ciudad) values ('Sakura');
insert into Lugar (Ciudad) values ('Kamwenge');
insert into Lugar (Ciudad) values ('Huangcai');
insert into Lugar (Ciudad) values ('Dongdu');
insert into Lugar (Ciudad) values ('Tarhuna');
insert into Lugar (Ciudad) values ('Yasugichō');
insert into Lugar (Ciudad) values ('Johanneshov');
insert into Lugar (Ciudad) values ('Capalonga');
insert into Lugar (Ciudad) values ('Si Ma Cai');
insert into Lugar (Ciudad) values ('Floreşti');
insert into Lugar (Ciudad) values ('Calvinia');
insert into Lugar (Ciudad) values ('Shanshi');
insert into Lugar (Ciudad) values ('Zhukovka');
insert into Lugar (Ciudad) values ('Stockton');
insert into Lugar (Ciudad) values ('Bélabo');
insert into Lugar (Ciudad) values ('Cangyou');
insert into Lugar (Ciudad) values ('Catriló');
insert into Lugar (Ciudad) values ('Oum Hadjer');
insert into Lugar (Ciudad) values ('Sasnovy Bor');
insert into Lugar (Ciudad) values ('Xinji');
insert into Lugar (Ciudad) values ('Pulorejo');
insert into Lugar (Ciudad) values ('Tetandara');
insert into Lugar (Ciudad) values ('Bunog');
insert into Lugar (Ciudad) values ('Buzovna');
insert into Lugar (Ciudad) values ('Mawlamyine');
insert into Lugar (Ciudad) values ('Wolanów');
insert into Lugar (Ciudad) values ('Zaña');
insert into Lugar (Ciudad) values ('Nagaoka');
insert into Lugar (Ciudad) values ('Nunleu');
insert into Lugar (Ciudad) values ('Zaječar');
insert into Lugar (Ciudad) values ('Pitomača');
insert into Lugar (Ciudad) values ('Kanashevo');
insert into Lugar (Ciudad) values ('Ustyuzhna');
insert into Lugar (Ciudad) values ('Carapicuíba');
insert into Lugar (Ciudad) values ('Matozinhos');
insert into Lugar (Ciudad) values ('Medellín');
insert into Lugar (Ciudad) values ('Albany');
insert into Lugar (Ciudad) values ('Prince Rupert');
insert into Lugar (Ciudad) values ('Ecilda Paullier');
insert into Lugar (Ciudad) values ('San Felipe');
insert into Lugar (Ciudad) values ('Gal’bshtadt');
insert into Lugar (Ciudad) values ('Željezno Polje');
insert into Lugar (Ciudad) values ('Ostojićevo');
insert into Lugar (Ciudad) values ('Palangue');
insert into Lugar (Ciudad) values ('Aramayuan');
insert into Lugar (Ciudad) values ('Dongtucheng');
insert into Lugar (Ciudad) values ('Jawornik');
insert into Lugar (Ciudad) values ('Ağdam');
insert into Lugar (Ciudad) values ('Bojong');
insert into Lugar (Ciudad) values ('Leonárisso');
insert into Lugar (Ciudad) values ('Calçada');
insert into Lugar (Ciudad) values ('Yangying');
insert into Lugar (Ciudad) values ('Leuwibuleud');
insert into Lugar (Ciudad) values ('Messina');
insert into Lugar (Ciudad) values ('Stuttgart Stuttgart-Mitte');
insert into Lugar (Ciudad) values ('Cabaiguán');
insert into Lugar (Ciudad) values ('Ōta');
insert into Lugar (Ciudad) values ('Bačka Palanka');
insert into Lugar (Ciudad) values ('Xilin');


/****** Datos de Prueba - Tabla Cliente  -  105 valores******/
INSERT INTO Cliente VALUES ('Kimberly', 'Lopez', 98765432, '999888777', 'kimberly.lopez@gmail.com');
INSERT INTO Cliente VALUES ('Eunice', 'Ibarra', 98765431, '999888666', 'eunice.ibarra@gmail.com');
INSERT INTO Cliente VALUES ('Cesar', 'Rodriguez', 98765433, '999888555', 'cesar.rodriguez@gmail.com');
INSERT INTO Cliente VALUES ('Ana', 'Acosta', 98765434, '999888444', 'ana.acosta@gmail.com');
INSERT INTO Cliente VALUES ('Roberto', 'Paredes', 98765435, '999888333', 'roberto.paredes@gmail.com');

INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Merritt','Olson','7501663','1-474-422-6321','euismod.ac.fermentum@maurisid.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ashely','Nixon','40875810','893-4598','In.scelerisque@Donecelementum.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Patience','Williams','41739762','741-5323','id.magna@ultrices.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Sebastian','Mckay','15126740','1-188-732-5857','et.magnis.dis@Donecatarcu.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Lucian','Rollins','6989951','1-439-975-1777','tortor.nibh.sit@nequeSedeget.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Jemima','Rush','17788221','1-549-464-5691','Proin@cubiliaCurae.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kaye','Boyer','14672075','1-530-707-1936','quam.a.felis@scelerisquenequesed.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Yael','Sharpe','31282236','700-9868','egestas.Fusce.aliquet@parturientmontes.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Cassandra','Morrow','45573382','325-5361','nonummy.ac@elementumategestas.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Adrian','Reynolds','40279055','708-9053','dolor@vulputate.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Barry','Vang','50511143','721-3497','diam.lorem@pedeCum.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Lesley','Petersen','28163565','285-2645','dui.Fusce@Maurisvelturpis.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Chandler','Lewis','7975086','191-7369','vitae.aliquet.nec@vulputateposuere.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Luke','Dominguez','16179090','1-648-435-5372','cursus@sagittis.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Cruz','Ayers','44079333','1-225-254-5027','enim.mi.tempor@loremlorem.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Casey','Mcgowan','49466643','627-7514','pede.ac@nisisem.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vielka','Moran','40190388','136-6343','purus.ac.tellus@Fuscemi.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Neil','Noble','5189608','1-396-461-2806','nulla.Integer.urna@magnisdisparturient.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Urielle','Mayer','41914189','591-2449','luctus@risus.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Neil','Wood','36529651','729-9806','ut.mi.Duis@Etiamvestibulummassa.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Adria','Mathews','14120196','223-0595','netus@maurisSuspendisse.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Roary','Decker','38519160','1-518-679-9021','nibh@odioNaminterdum.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Germaine','Deleon','15670656','1-607-652-3040','id@justofaucibus.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Debra','Lane','26066058','253-4975','enim.commodo@consectetuereuismodest.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Briar','Lowe','8888172','948-0309','ornare.elit.elit@nonquamPellentesque.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Stacey','Swanson','16607974','1-806-682-4076','eget@nisi.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Alma','Mccoy','33015762','1-269-870-0875','lectus@euplacerat.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Danielle','Mclaughlin','15825598','822-5026','Nunc@vehicula.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vladimir','Frank','8682921','116-7103','pellentesque@egestas.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nita','Stephenson','8738912','1-733-437-2033','sagittis@egestasnunc.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kai','Torres','30273000','723-5971','Lorem@dignissimpharetraNam.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Baxter','Bryant','46639954','486-2036','Cras.dolor.dolor@eratSednunc.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ria','Shelton','7739799','1-772-835-5334','fames.ac.turpis@mauris.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Forrest','Watts','40932377','736-5402','ut@feugiatnonlobortis.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vincent','Barrera','42707761','519-0244','arcu.Morbi@euismodenimEtiam.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Harper','Dale','30814186','1-863-106-2729','adipiscing.fringilla@sitamet.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Amethyst','Howard','39965276','269-8746','tellus@Sed.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kirestin','Whitaker','32005971','230-1491','Cum.sociis.natoque@a.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Danielle','Dejesus','48888634','1-189-738-7569','magna.sed@dictummi.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Griffin','Henson','14315026','905-9444','eu.eleifend@parturientmontesnascetur.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Aladdin','Shepherd','22270619','792-4288','sagittis.semper.Nam@necmalesuadaut.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ginger','Riddle','42172004','502-7236','convallis.ante.lectus@orciDonec.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ora','Yates','41600079','585-3952','Proin.vel.nisl@enim.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Georgia','Mays','30067777','880-2825','magnis@vehiculaetrutrum.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Mariko','Perry','27094881','958-2131','amet.ornare.lectus@amet.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Alec','Rodriguez','5434603','1-797-418-3252','convallis.ligula.Donec@adipiscingenim.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Pandora','Lang','20947783','537-8479','congue.turpis@Inmipede.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Claudia','Chavez','33963088','516-3130','leo.Vivamus.nibh@tinciduntnibhPhasellus.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kendall','Osborne','11544893','106-9467','at.augue@Donec.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Selma','Miranda','41535184','1-350-820-6564','sed.pede.Cum@odiovel.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Cora','Holland','29979899','947-7182','vel.mauris.Integer@sitametnulla.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Julian','Vega','33979586','1-248-110-6124','ipsum@vellectus.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Upton','Dudley','18277646','509-0667','neque@tempusloremfringilla.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Sade','Farrell','32677822','1-551-449-4537','sem@non.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nigel','Shannon','13636977','1-896-139-5119','et.ultrices.posuere@Lorem.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Wendy','Bright','11116118','458-2482','facilisi@rutrumFuscedolor.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Stephanie','Davenport','35685967','411-7356','diam@volutpat.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Colin','Finley','13526949','1-112-700-3298','erat.volutpat@montesnascetur.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Allegra','Pena','5933926','1-468-177-8565','Morbi.accumsan.laoreet@Morbimetus.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Fulton','Buck','25607069','696-4821','blandit.at.nisi@fermentum.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Malcolm','Leonard','9000074','1-453-909-2031','Aliquam.fringilla.cursus@mauris.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Anjolie','Rowland','39320184','1-708-835-9827','nulla.In@atarcu.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Isaiah','Ray','24428171','1-835-645-7721','Fusce.diam.nunc@nonsollicitudin.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Claudia','Gill','46331728','1-436-663-1936','eget@diamPellentesquehabitant.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ingrid','Orr','33718921','1-357-451-9179','erat.neque@nonsollicitudin.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Asher','Hartman','21164876','1-278-809-6765','Nullam@infelisNulla.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Scarlet','Stafford','44114881','960-8383','diam.dictum@Aliquam.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Robin','Kline','6034445','1-485-936-6771','risus.a.ultricies@enimNuncut.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Reuben','Rice','32279618','1-172-141-9006','non@Nunclectuspede.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Maggy','Hendrix','43361178','1-814-386-6357','mi.pede.nonummy@mattisIntegereu.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Donna','Allison','46727448','473-5902','tempor.augue@Nuncsollicitudincommodo.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Iliana','King','31542207','1-364-403-5426','Nulla.dignissim.Maecenas@enimEtiam.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Hannah','Greene','10066029','419-9016','posuere@et.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nero','Kane','49150867','487-0960','pharetra@facilisis.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Marah','Leonard','32995011','1-536-402-8798','est@egetmagna.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Dora','Lawrence','37716047','851-6689','ipsum@euultricessit.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Philip','Justice','5296625','895-6269','pharetra@massalobortis.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Richard','Mcintosh','15531109','875-4357','justo@Craseget.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Scarlet','Wagner','9864428','1-880-231-2515','velit.in.aliquet@acfacilisisfacilisis.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Gillian','English','5199103','1-717-273-3288','sed.consequat@turpisAliquamadipiscing.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Len','Garrison','50043000','1-531-766-0155','Lorem.ipsum@euligula.com');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Imelda','Odonnell','7138573','1-375-120-6030','dapibus.id.blandit@sed.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Skyler','Beard','43649073','730-4169','montes@ipsumleo.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kamal','Hansen','22092038','1-330-702-1446','quis.lectus.Nullam@diamDuismi.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Derek','Foreman','21448057','1-355-320-2272','Cras.dictum@nibh.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Dakota','William','29084488','1-722-712-6187','in@estconguea.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Meredith','Watson','39161485','1-508-241-5066','Donec.vitae.erat@Sedet.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Aquila','Fisher','5052183','1-408-728-6998','libero@Etiamlaoreet.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Riley','Cole','17177836','1-131-467-7047','nibh.dolor.nonummy@lobortisClass.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Jorden','Frederick','40600698','118-9792','Maecenas.iaculis@cursusin.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ivy','Anthony','24807570','853-6557','fermentum@elementumpurus.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Rama','Morton','23056923','1-460-211-3279','volutpat.nunc.sit@nulla.org');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Scarlet','Perry','31406742','1-811-372-7621','magna.tellus.faucibus@consectetuereuismod.edu');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Conan','Rice','43208344','257-4512','dui.Cras.pellentesque@ligula.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Anne','Oconnor','27150220','287-1647','eleifend.non@natoquepenatibus.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Elton','Yang','30603322','1-937-803-4220','ornare@duilectus.net');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Charity','Mendoza','39026901','366-8139','nisi.magna.sed@imperdiet.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kyra','Guthrie','11709879','950-1766','metus@dictum.co.uk');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Anika','Beard','5519650','339-9796','cursus.a.enim@Donec.ca');
INSERT INTO Cliente([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Sade','Garcia','15468375','886-3422','Integer.tincidunt@lacusQuisque.co.uk');

/****** Datos de Prueba - Tabla Contratista  -  100 valores ******/
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Lois','Manning','30604839','1-625-931-4265','Etiam.laoreet@eteuismod.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Christopher','Mooney','21518546','1-765-775-4878','risus.Quisque.libero@bibendumsedest.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Meghan','Hamilton','31258998','1-395-775-4509','quis.pede.Praesent@Maurisvelturpis.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nola','Nguyen','27551876','1-201-321-5810','Suspendisse.commodo.tincidunt@a.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vielka','Neal','45711249','600-9150','nibh.Aliquam.ornare@dictumcursusNunc.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Blythe','Travis','33181163','772-0173','lacus.varius.et@dapibusrutrumjusto.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Tana','Hernandez','23283604','414-5966','velit@ipsumsodales.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Brittany','Dalton','11854884','835-6487','pellentesque.massa.lobortis@SuspendisseeleifendCras.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Barrett','Lyons','34821620','814-2000','tellus.sem.mollis@eueuismod.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Price','Mckee','41050758','1-356-845-1814','molestie@esttemporbibendum.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Hilary','Rush','19811893','1-569-240-0628','dui@dignissimpharetra.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('April','Mueller','19514424','1-908-978-2071','sed.dolor@malesuada.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Griffith','Garcia','19991289','999-8022','eleifend.egestas.Sed@sitamet.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Minerva','Benson','36901129','439-4083','auctor.velit@egetlacus.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Brenda','Wiley','8336209','281-8686','elit.elit.fermentum@luctusCurabituregestas.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kristen','Turner','17707917','821-5429','eu@feugiatSednec.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ebony','Diaz','19890935','1-986-990-2516','ut.sem@Donectemporest.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Yoshi','Tyler','11574200','234-7040','id.enim.Curabitur@penatibus.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Madonna','Hall','47783100','928-5180','malesuada.ut@magna.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Deanna','Hanson','25857754','1-228-442-5750','lacus.Etiam@auctor.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Aurelia','Mcgee','20408434','899-9694','Donec@ornarefacilisis.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Dylan','Hamilton','30577656','805-8581','elit@nulla.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Libby','Nguyen','13279447','465-5738','pharetra.Quisque@euerat.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ocean','Roach','18216514','373-8437','quam@dolorsitamet.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Graham','Lang','5232043','1-893-131-2962','eros@Namligula.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Lucius','Patton','11581831','1-604-774-2109','Donec@ullamcorpernislarcu.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Stuart','Duke','26330022','1-230-971-4241','sed@non.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Xantha','Burke','42684982','426-5833','rhoncus.id.mollis@a.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Fleur','Schwartz','9945539','1-291-533-4591','sapien@pharetraNam.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Martena','Chambers','33401261','1-324-597-2168','rutrum.non.hendrerit@Nullam.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nash','Head','41582292','1-534-286-9009','euismod.et@nec.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Priscilla','Tyler','46726576','592-9666','pede@quis.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ali','Wilkinson','13202448','1-670-255-1947','blandit.viverra@estcongue.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Henry','Ayers','41719763','1-653-910-4324','risus@malesuadavel.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Len','Sutton','17641281','1-427-162-3105','Quisque@lacinia.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Jemima','Bridges','15849511','1-309-642-7803','nunc.interdum@tempordiamdictum.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Juliet','Sargent','27104614','477-1836','augue.eu.tempor@elementumpurusaccumsan.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Noel','Wynn','15495282','905-4136','cursus.in@loremDonecelementum.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ginger','Shepard','12021101','1-554-186-8159','mauris@quamdignissim.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Dennis','Byers','38199443','1-475-789-0531','lacinia.vitae.sodales@ullamcorpermagnaSed.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nadine','Fox','30736569','1-631-988-5974','Phasellus.dolor@Suspendisse.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Emily','Garrison','47055505','1-453-132-9475','adipiscing.lacus@Aliquamerat.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Adrienne','Benjamin','23779758','195-2339','in@loremsitamet.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kirby','Burch','9209275','1-143-433-3792','malesuada.id@feugiat.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Hope','Singleton','13857351','1-574-363-5863','semper.auctor@mitemporlorem.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Maile','Mcpherson','44673423','666-2053','tellus@Integereulacus.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Brandon','Lynch','19032990','1-972-591-1086','tempus.eu@enimconsequat.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Mohammad','Hurst','29664074','920-6667','Cras.sed.leo@necmetus.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Sarah','Galloway','6980440','398-6213','nascetur.ridiculus@ipsumportaelit.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('James','Norton','10012000','1-461-762-6352','nibh@sapien.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Cecilia','Jennings','12078777','1-132-114-2552','nascetur.ridiculus@libero.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Marah','Turner','21393375','1-471-102-1174','rhoncus.Donec@dictum.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Cruz','Smith','48342041','195-0446','pede.malesuada.vel@cursus.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Slade','Dodson','16225918','1-470-988-7022','sagittis@mollisDuissit.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Lyle','Mcgowan','6341696','610-2797','ante@semutcursus.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kamal','Gallagher','31409306','616-2315','semper.Nam.tempor@Fusce.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Martena','Hooper','28926760','192-0018','libero@amagnaLorem.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Alice','Adkins','34636193','1-792-921-7568','nibh@Fuscemollis.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Portia','Chan','26803550','698-1344','Nulla.semper.tellus@Phasellusdapibus.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Shelby','Pierce','21236034','1-764-245-3379','ornare.tortor@egestashendrerit.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Michael','Bell','36143467','1-170-349-2896','amet@Sednullaante.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Hadley','Booth','7423577','764-2654','urna.justo.faucibus@magnisdis.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Dustin','Cruz','13234959','607-6529','luctus@sem.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Reece','Guy','10611128','225-4797','eu.erat@nequeSedeget.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Jennifer','Lyons','13401597','1-195-304-1491','neque.In.ornare@Curabiturvel.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Michael','Buckley','28979306','1-157-820-7522','sagittis@odiotristique.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('George','Fernandez','31746046','679-3458','amet.risus.Donec@orci.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Perry','Malone','28668692','349-3449','nascetur.ridiculus.mus@afelis.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Solomon','Murray','36228200','305-3556','dapibus@cursus.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Adele','Bartlett','29525159','856-9514','vulputate@enimdiam.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Xenos','Lester','16015743','1-259-248-9336','aliquet.diam.Sed@Praesent.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Derek','Vega','48598892','1-570-771-0688','iaculis.enim@lobortistellusjusto.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Callie','Odom','13114765','1-907-233-0683','enim@eratnequenon.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Clark','Shields','39269814','1-317-870-1607','lacus@disparturientmontes.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Thaddeus','Dawson','39736798','810-5569','tellus@scelerisqueneque.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Griffin','Burt','24139997','763-9950','neque.non@velitQuisquevarius.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Damon','Riggs','33142762','670-1753','ullamcorper@estac.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Janna','Wilkins','6361722','650-1663','faucibus.lectus.a@Loremipsum.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Brandon','Becker','9395654','1-991-638-1671','in@ut.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vera','Bauer','49629081','1-948-442-9564','risus.odio@aliquetlibero.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Howard','Vaughan','16891964','169-7054','Maecenas.libero.est@amet.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Denton','Walker','26090196','1-368-682-5208','hendrerit.neque@eratnonummyultricies.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Paul','Miranda','47875220','778-9525','dictum.eleifend.nunc@diamnunc.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Kaitlin','Buckley','41322537','1-907-636-1535','nulla@nullaCras.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Daria','Monroe','16353619','1-918-767-9607','orci.Donec@ornare.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Stacy','Cox','24595626','169-4606','et.commodo@dictum.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nissim','Gonzalez','44156433','927-2130','ipsum.porta.elit@necorciDonec.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('David','Carroll','17304872','878-1478','egestas.ligula.Nullam@Sed.net');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Inez','Perry','20825731','1-547-985-4143','Curabitur.ut@pedesagittis.org');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Travis','Mcfadden','5733447','1-787-291-9653','ornare.tortor.at@magna.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Igor','Evans','30282018','1-935-368-6517','consequat@egetvenenatisa.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Talon','Spencer','49364199','1-791-623-0514','a.purus.Duis@nibhQuisquenonummy.co.uk');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Odette','Gutierrez','26265132','943-0790','vulputate.eu.odio@lobortisnisi.com');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Nita','Carey','6205896','1-769-204-1538','eros.Proin@sodales.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Noelani','Haynes','13934580','1-862-223-9776','semper@aliquetnec.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Skyler','Villarreal','34258545','210-4542','augue.porttitor.interdum@risusNuncac.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Ronan','Singleton','20583580','292-9336','Duis.volutpat.nunc@tortornibh.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Griffith','Slater','22218817','435-9350','lacinia.at.iaculis@tortorat.edu');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Alfreda','Copeland','18204624','1-132-475-2934','gravida.Aliquam@euismodmauriseu.ca');
INSERT INTO Contratista([Nombre],[Apellido],[Dni],[Telefono],[Correo]) VALUES('Vance','Hewitt','31575600','1-525-973-1291','posuere@mifringillami.ca');

/****** Datos de Prueba - Tabla Servicio  -  100 valores ******/
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Chief Design Engineer', 296, 98, 68);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Recruiting Manager', 244, 45, 23);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Research Nurse', 778, 58, 26);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Help Desk Technician', 196, 35, 50);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Senior Cost Accountant', 656, 56, 92);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Safety Technician I', 173, 38, 94);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Environmental Specialist', 858, 9, 85);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Mechanical Systems Engineer', 486, 30, 79);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Pharmacist', 619, 12, 68);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('General Manager', 544, 52, 40);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Business Systems Development Analyst', 901, 75, 29);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Professor', 413, 81, 7);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Administrative Officer', 637, 41, 12);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Human Resources Manager', 729, 19, 87);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Operator', 294, 71, 58);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Analog Circuit Design manager', 398, 15, 11);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Quality Engineer', 809, 69, 89);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Research Associate', 705, 70, 75);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Junior Executive', 190, 7, 45);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Dental Hygienist', 690, 55, 73);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Tax Accountant', 666, 94, 19);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Teacher', 485, 50, 46);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Assistant Media Planner', 742, 9, 34);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Environmental Tech', 942, 7, 15);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Teacher', 476, 85, 1);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Senior Sales Associate', 572, 98, 10);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Tax Accountant', 408, 66, 55);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Nuclear Power Engineer', 491, 71, 87);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Engineer IV', 175, 56, 70);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Legal Assistant', 623, 57, 20);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Information Systems Manager', 526, 19, 76);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('VP Quality Control', 175, 56, 27);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Cost Accountant', 977, 26, 60);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Cost Accountant', 541, 57, 90);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Web Designer III', 199, 9, 97);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Project Manager', 500, 97, 40);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Systems Administrator III', 193, 11, 18);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Chemical Engineer', 286, 8, 17);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('VP Marketing', 334, 89, 70);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Systems Administrator IV', 542, 29, 65);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Cost Accountant', 292, 23, 80);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Analog Circuit Design manager', 822, 2, 61);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Software Test Engineer II', 522, 9, 5);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Financial Analyst', 515, 72, 46);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Nurse', 314, 45, 38);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Product Engineer', 965, 90, 48);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Systems Administrator I', 551, 7, 93);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Business Systems Development Analyst', 299, 1, 8);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Staff Scientist', 320, 83, 95);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Associate Professor', 614, 9, 83);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Marketing Manager', 795, 87, 16);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Senior Sales Associate', 949, 11, 19);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Physical Therapy Assistant', 986, 45, 36);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Software Engineer IV', 414, 25, 87);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Structural Engineer', 313, 22, 15);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Staff Scientist', 161, 95, 62);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Quality Control Specialist', 979, 88, 5);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Chief Design Engineer', 412, 96, 10);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('VP Accounting', 647, 74, 30);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Legal Assistant', 449, 58, 74);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Civil Engineer', 608, 29, 41);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Statistician IV', 558, 66, 8);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Associate Professor', 379, 29, 49);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Payment Adjustment Coordinator', 877, 49, 30);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Nurse', 630, 59, 66);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Business Systems Development Analyst', 474, 50, 52);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Physical Therapy Assistant', 224, 30, 78);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Teacher', 743, 47, 82);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Geological Engineer', 905, 96, 53);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Graphic Designer', 673, 28, 28);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Internal Auditor', 199, 32, 41);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Biostatistician II', 977, 51, 2);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('VP Accounting', 163, 42, 93);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Registered Nurse', 955, 83, 44);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Chemical Engineer', 738, 44, 54);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Compensation Analyst', 972, 82, 18);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Geologist IV', 807, 78, 1);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Analog Circuit Design manager', 200, 38, 37);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Geologist III', 973, 96, 98);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Senior Financial Analyst', 550, 3, 13);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Accountant I', 979, 47, 74);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Computer Systems Analyst IV', 904, 33, 50);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Graphic Designer', 193, 38, 46);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Analyst Programmer', 534, 31, 20);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Financial Advisor', 360, 86, 76);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Account Coordinator', 688, 51, 72);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Social Worker', 606, 16, 69);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Chemical Engineer', 476, 30, 67);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Analyst Programmer', 401, 33, 67);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Sales Associate', 307, 3, 46);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Account Representative IV', 929, 37, 45);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Engineer I', 987, 23, 97);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Quality Control Specialist', 843, 77, 30);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Recruiter', 793, 21, 93);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Software Engineer IV', 522, 29, 18);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Administrative Officer', 155, 40, 46);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Editor', 883, 76, 50);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Biostatistician II', 401, 90, 54);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Database Administrator III', 524, 41, 31);
insert into Servicio (Descripcion, Precio, CodContratista, CodLugar) values ('Registered Nurse', 919, 62, 81);

/****** Datos de Prueba - Tabla Contrato  -  100 valores ******/
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-24 09:28:12', '45085 Messerschmidt Court', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Focused', 41, 39, 13);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-04 17:19:03', '5 Westport Crossing', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'toolset', 17, 86, 96);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-16 07:59:17', '07 South Circle', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'task-force', 90, 68, 16);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-31 11:24:16', '696 Oakridge Parkway', 'Pellentesque at nulla.', 'uniform', 97, 17, 19);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-09-27 08:09:37', '349 Mccormick Park', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'Networked', 51, 12, 12);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-30 07:28:03', '2200 Fulton Circle', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 'definition', 30, 29, 16);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-11 18:33:44', '70846 Norway Maple Street', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'framework', 83, 50, 66);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-21 21:14:40', '1 Commercial Pass', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'forecast', 64, 20, 2);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-23 06:37:41', '1 Blue Bill Park Circle', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'initiative', 18, 73, 53);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-29 18:45:48', '37 Washington Circle', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'adapter', 66, 56, 75);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-03 03:39:36', '9 Pepper Wood Lane', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'process improvement', 49, 90, 63);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-17 10:27:22', '024 Towne Pass', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'core', 10, 46, 42);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-16 16:01:52', '19865 Shopko Park', 'Nunc purus.', 'grid-enabled', 8, 49, 16);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-01 18:58:33', '8346 Roth Point', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'interface', 80, 91, 7);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-27 02:26:25', '271 Dahle Trail', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 'Cross-platform', 95, 84, 55);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-11 09:41:12', '877 Hoard Trail', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Business-focused', 80, 45, 44);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-06-26 04:00:22', '471 Stoughton Terrace', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'portal', 47, 60, 98);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-09-08 04:51:42', '1 Sauthoff Parkway', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'flexibility', 32, 1, 30);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-17 13:32:00', '6377 Duke Pass', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'Cross-platform', 53, 38, 90);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-23 02:15:10', '34 Mayer Court', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'dedicated', 29, 80, 79);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-09 20:22:37', '5668 Debra Lane', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'leading edge', 94, 58, 60);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-01 07:53:40', '9238 Cottonwood Street', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'incremental', 48, 45, 53);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-09-06 12:39:01', '6557 American Ash Trail', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'system engine', 69, 33, 50);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-04 01:39:46', '56439 Thompson Street', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'analyzer', 58, 93, 97);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-01 07:16:50', '5 Anhalt Point', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'conglomeration', 45, 23, 49);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-28 00:47:08', '08538 Monica Pass', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Synergistic', 23, 18, 67);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-09 21:43:33', '8 Montana Crossing', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Visionary', 80, 76, 11);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-29 17:19:23', '7697 Vernon Way', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Profit-focused', 84, 6, 99);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-18 11:21:17', '30 Golden Leaf Terrace', 'Nam nulla.', 'Total', 73, 40, 31);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-31 12:15:27', '51 Porter Circle', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'matrix', 22, 64, 37);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-11 21:53:01', '1 Jenifer Pass', 'Nulla mollis molestie lorem. Quisque ut erat.', 'Reverse-engineered', 98, 58, 87);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-10 12:29:16', '2 Manitowish Pass', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Down-sized', 53, 100, 68);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-23 21:16:36', '60057 Carberry Lane', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'systematic', 5, 10, 27);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-23 10:00:36', '7802 Schiller Road', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'local', 68, 81, 7);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-12 04:24:36', '02376 Anzinger Road', 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'static', 19, 89, 4);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-16 05:18:47', '366 Cody Road', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'coherent', 23, 2, 42);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-31 07:36:12', '35758 Lindbergh Way', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 'local area network', 68, 11, 43);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-02 14:24:37', '80 Brentwood Road', 'Aenean auctor gravida sem.', 'project', 44, 71, 12);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-24 16:18:54', '96996 Dottie Trail', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Assimilated', 43, 20, 45);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-18 06:26:30', '0708 Meadow Vale Terrace', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'Compatible', 63, 34, 27);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-31 15:09:30', '215 1st Lane', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'human-resource', 24, 16, 49);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-01 09:31:14', '17 Delladonna Way', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'multimedia', 2, 53, 29);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-07 13:20:37', '2649 Springs Terrace', 'Nulla tempus.', 'composite', 94, 38, 100);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-11 10:14:05', '913 Sloan Point', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'asynchronous', 2, 18, 29);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-04 09:22:28', '917 Lerdahl Alley', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'motivating', 42, 23, 22);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-25 17:16:50', '917 Schlimgen Trail', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'attitude', 86, 37, 67);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-09-29 17:46:20', '7 Bellgrove Center', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 'Robust', 25, 16, 73);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-19 20:26:39', '62 Reinke Alley', 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'artificial intelligence', 33, 11, 39);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-07 00:04:22', '5 Esch Center', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 'throughput', 19, 41, 17);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-06-17 16:26:59', '77 Nevada Trail', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Grass-roots', 98, 88, 57);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-21 08:47:47', '796 Starling Junction', 'Proin risus.', 'regional', 11, 84, 40);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-28 23:56:44', '13 Eggendart Place', 'Sed accumsan felis.', 'Polarised', 34, 83, 15);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-13 02:13:58', '69 Homewood Street', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 'Total', 93, 81, 4);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-19 17:54:17', '9333 Doe Crossing Hill', 'Proin interdum mauris non ligula pellentesque ultrices.', 'projection', 67, 55, 94);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-08 11:35:40', '2 Schmedeman Park', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 'attitude', 34, 21, 85);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-22 16:28:18', '21 Monica Alley', 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 'global', 89, 87, 70);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-19 11:46:00', '7 Southridge Terrace', 'Nullam molestie nibh in lectus.', 'User-friendly', 26, 79, 24);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-30 09:46:13', '9 Everett Lane', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 'Pre-emptive', 80, 9, 30);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-27 15:03:23', '9 Jay Terrace', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'Implemented', 96, 1, 83);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-02 02:12:36', '158 South Point', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'encryption', 36, 39, 82);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-13 11:59:25', '6 Forest Place', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'regional', 17, 34, 38);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-19 11:47:23', '4 Vera Crossing', 'Etiam vel augue.', 'Ergonomic', 23, 61, 57);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-31 01:50:57', '700 Westport Hill', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Synchronised', 53, 6, 40);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-02 01:29:22', '86 Fairview Road', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'radical', 79, 37, 88);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-10 10:08:50', '9 American Ash Avenue', 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'implementation', 31, 33, 22);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-15 18:31:42', '15 Laurel Circle', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'multimedia', 76, 87, 47);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-04 01:14:07', '80 Hanover Park', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'Expanded', 23, 71, 9);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-04 04:12:51', '0603 Lyons Avenue', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'Customer-focused', 17, 82, 87);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-05 00:30:40', '45 Gale Parkway', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'standardization', 70, 47, 44);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-31 00:35:33', '379 Stephen Parkway', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'alliance', 16, 23, 94);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-23 12:26:38', '80117 Northfield Center', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'help-desk', 96, 52, 1);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-12 08:36:41', '46417 Mallory Lane', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'Down-sized', 19, 92, 15);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-06 08:06:04', '985 Arrowood Pass', 'In sagittis dui vel nisl.', 'Horizontal', 94, 89, 93);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-02 18:51:57', '7 Valley Edge Hill', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'interactive', 69, 52, 84);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-11 01:03:19', '1 Fairview Way', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Realigned', 97, 82, 84);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-17 15:31:20', '14 Pleasure Court', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'system engine', 66, 44, 8);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-21 17:22:56', '234 Glendale Point', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'user-facing', 33, 40, 22);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-21 23:54:59', '3315 Pawling Trail', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'archive', 52, 55, 51);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-10 03:41:48', '787 Kings Point', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'full-range', 89, 47, 17);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-31 08:32:02', '840 Jackson Parkway', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'access', 24, 16, 19);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-30 13:08:17', '0 Eggendart Point', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'leverage', 100, 56, 51);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-07-16 23:52:09', '0949 Mcbride Park', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 'toolset', 54, 78, 29);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-06-05 08:49:47', '26244 Sundown Plaza', 'Praesent blandit.', 'systemic', 74, 52, 67);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-06 08:48:05', '76 Elka Trail', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'application', 91, 88, 73);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-26 08:23:17', '18 Crescent Oaks Plaza', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'paradigm', 89, 17, 16);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-03-20 14:05:15', '963 Bluejay Trail', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 'Synergized', 26, 58, 20);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-10-08 08:31:07', '92 Calypso Trail', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'Implemented', 31, 88, 59);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-05-23 15:40:33', '946 Garrison Junction', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'regional', 20, 76, 8);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-25 17:12:31', '22 Logan Parkway', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'Customer-focused', 63, 34, 57);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-27 14:05:58', '33188 Buhler Plaza', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'superstructure', 59, 83, 42);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2020-01-07 11:34:55', '2 Marquette Hill', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'challenge', 100, 46, 86);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-04 14:44:37', '97 Pearson Drive', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'exuding', 69, 64, 29);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-04-17 08:11:06', '2 New Castle Point', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'disintermediate', 23, 65, 55);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-08-10 23:19:01', '003 Vidon Parkway', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'analyzing', 80, 11, 60);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-21 05:29:47', '940 Kingsford Place', 'Vestibulum rutrum rutrum neque.', 'heuristic', 85, 39, 75);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-06-25 23:39:29', '11392 Loftsgordon Circle', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'conglomeration', 52, 91, 72);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-12-30 18:23:15', '5 Spenser Lane', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Team-oriented', 70, 69, 35);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-06-19 22:15:05', '59 Lighthouse Bay Place', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'extranet', 5, 25, 19);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-11-16 18:00:13', '97 Meadow Ridge Lane', 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 'national', 62, 80, 35);
insert into Contrato (Fecha, Direccion, Indicaciones, Comentarios, CodCliente, CodServicio, CodLugar) values ('2019-02-04 13:26:56', '21 Center Court', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'Intuitive', 61, 72, 49);

﻿/****** Object:  StoredProcedure [dbo].[uspServicioPagedList]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspServicioPagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH ServicioResult AS 
	(
		SELECT [Codigo]
		  ,[Descripcion]
		  ,[Precio]
		  ,[CodContratista]
		  ,[CodLugar]
		  ,ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNum
	  FROM [MilOficios].[dbo].[Servicio]
	)
	SELECT [Codigo]
		  ,[Descripcion]
		  ,[Precio]
		  ,[CodContratista]
		  ,[CodLugar]
	FROM ServicioResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END

﻿/****** Object:  StoredProcedure [dbo].[uspClientePagedList]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspClientePagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH ClienteResult AS 
	(
		SELECT [Codigo]
		  ,[Nombre]
		  ,[Apellido]
		  ,[Dni]
		  ,[Telefono]
		  ,[Correo]
		  ,ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNum
	  FROM [MilOficios].[dbo].[Cliente]
	)
	SELECT [Codigo]
		  ,[Nombre]
		  ,[Apellido]
		  ,[Dni]
		  ,[Telefono]
		  ,[Correo]
	FROM ClienteResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END

/****** Object:  StoredProcedure [dbo].[uspLugarPagedList]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspLugarPagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH LugarResult AS 
	(
		SELECT [Codigo]
		  ,[Ciudad]
		  ,ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNum
	  FROM [MilOficios].[dbo].[Lugar]
	)
	SELECT [Codigo]
		  ,[Ciudad]
	FROM LugarResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END


CREATE TABLE [dbo].[User](
	[Email] [varchar](250) NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[LastName] [varchar](250) NULL,
	[Password] [varbinary](250) NOT NULL,
	[Roles] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  StoredProcedure [dbo].[uspCreateUser] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspCreateUser]
(
@EMAIL varchar(50),
@PASSWORD varchar(50),
@FIRSTNAME varchar(50),
@LASTNAME VARCHAR(50),
@OV_MESSAGE_ERROR VARCHAR(255) OUTPUT
)
as
BEGIN TRY    
   
 BEGIN TRAN 
 
 Insert into [dbo].[User](EMAIL, FIRSTNAME, LASTNAME, [PASSWORD])
 values(@EMAIL,@FIRSTNAME,@LASTNAME,PwdEncrypt(@PASSWORD))
  
 COMMIT TRAN
   
 --SELECT @OV_MESSAGE_ERROR = ''    
   
 SELECT /*[Id]       ,*/[Email]       
	,[FirstName]       
	,[LastName]             
	,[Roles]  
	FROM [dbo].[User]  
	WHERE [Email]=@email 
	--AND [Password]=@password 
	AND PwdCompare(@password,[Password]) = 1  
	--PwdEncrypt(@COD_USUARIO)    
END TRY    
BEGIN CATCH    
 SELECT @OV_MESSAGE_ERROR = 'Error en el Procedimiento: '+ ERROR_PROCEDURE()+ ', Mensaje: '+ERROR_MESSAGE()+'En la linea: '+convert(varchar(20),ERROR_LINE())   
 ROLLBACK TRAN      
END CATCH


/****** Object:  StoredProcedure [dbo].[uspValidateUser]    Script Date: 12/22/2019 10:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspValidateUser]  
	@email varchar(100),  
	@password varchar(20) 
AS 
BEGIN  
	SELECT /*[Id]       ,*/[Email]       
	,[FirstName]       
	,[LastName]             
	,[Roles]  
	FROM [dbo].[User]  
	WHERE [Email]=@email 
	--AND [Password]=@password 
	AND PwdCompare(@password,[Password]) = 1  
	--PwdEncrypt(@COD_USUARIO)         
END
