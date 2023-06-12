BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "attendance_course" (
	"id"	integer NOT NULL,
	"name"	varchar(250) NOT NULL,
	"description"	text,
	"status"	integer NOT NULL,
	"date_added"	datetime NOT NULL,
	"date_updated"	datetime NOT NULL,
	"department_id"	integer NOT NULL,
	FOREIGN KEY("department_id") REFERENCES "attendance_department"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_department" (
	"id"	integer NOT NULL,
	"name"	varchar(250) NOT NULL,
	"description"	text,
	"status"	integer NOT NULL,
	"date_added"	datetime NOT NULL,
	"date_updated"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_userprofile" (
	"id"	integer NOT NULL,
	"contact"	varchar(250) NOT NULL,
	"dob"	date,
	"address"	text,
	"avatar"	varchar(100),
	"user_type"	integer NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	"department_id"	bigint,
	"gender"	varchar(100),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("department_id") REFERENCES "attendance_department"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_class" (
	"id"	integer NOT NULL,
	"school_year"	varchar(250) NOT NULL,
	"level"	varchar(250) NOT NULL,
	"name"	varchar(250) NOT NULL,
	"assigned_faculty_id"	bigint NOT NULL,
	FOREIGN KEY("assigned_faculty_id") REFERENCES "attendance_userprofile"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_student" (
	"id"	integer NOT NULL,
	"first_name"	varchar(250) NOT NULL,
	"middle_name"	varchar(250),
	"last_name"	varchar(250) NOT NULL,
	"date_added"	datetime NOT NULL,
	"date_updated"	datetime NOT NULL,
	"course_id"	bigint NOT NULL,
	"contact"	varchar(250),
	"dob"	date,
	"gender"	varchar(100),
	"student_code"	varchar(250),
	FOREIGN KEY("course_id") REFERENCES "attendance_course"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_classstudent" (
	"id"	integer NOT NULL,
	"classIns_id"	bigint NOT NULL,
	"student_id"	bigint NOT NULL,
	FOREIGN KEY("student_id") REFERENCES "attendance_student"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("classIns_id") REFERENCES "attendance_class"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "attendance_attendance" (
	"id"	integer NOT NULL,
	"attendance_date"	date NOT NULL,
	"type"	varchar(250) NOT NULL,
	"date_updated"	datetime NOT NULL,
	"classIns_id"	bigint NOT NULL,
	"student_id"	bigint NOT NULL,
	FOREIGN KEY("student_id") REFERENCES "attendance_student"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("classIns_id") REFERENCES "attendance_class"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-03-10 07:22:52.055778');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-03-10 07:22:52.085778');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-03-10 07:22:52.112782');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-03-10 07:22:52.134782');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-03-10 07:22:52.153784');
INSERT INTO "django_migrations" VALUES (6,'attendance','0001_initial','2022-03-10 07:22:52.195792');
INSERT INTO "django_migrations" VALUES (7,'contenttypes','0002_remove_content_type_name','2022-03-10 07:22:52.230793');
INSERT INTO "django_migrations" VALUES (8,'auth','0002_alter_permission_name_max_length','2022-03-10 07:22:52.255795');
INSERT INTO "django_migrations" VALUES (9,'auth','0003_alter_user_email_max_length','2022-03-10 07:22:52.276793');
INSERT INTO "django_migrations" VALUES (10,'auth','0004_alter_user_username_opts','2022-03-10 07:22:52.294794');
INSERT INTO "django_migrations" VALUES (11,'auth','0005_alter_user_last_login_null','2022-03-10 07:22:52.317799');
INSERT INTO "django_migrations" VALUES (12,'auth','0006_require_contenttypes_0002','2022-03-10 07:22:52.326798');
INSERT INTO "django_migrations" VALUES (13,'auth','0007_alter_validators_add_error_messages','2022-03-10 07:22:52.346798');
INSERT INTO "django_migrations" VALUES (14,'auth','0008_alter_user_username_max_length','2022-03-10 07:22:52.370800');
INSERT INTO "django_migrations" VALUES (15,'auth','0009_alter_user_last_name_max_length','2022-03-10 07:22:52.394802');
INSERT INTO "django_migrations" VALUES (16,'auth','0010_alter_group_name_max_length','2022-03-10 07:22:52.418803');
INSERT INTO "django_migrations" VALUES (17,'auth','0011_update_proxy_permissions','2022-03-10 07:22:52.438805');
INSERT INTO "django_migrations" VALUES (18,'auth','0012_alter_user_first_name_max_length','2022-03-10 07:22:52.463807');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2022-03-10 07:22:52.482809');
INSERT INTO "django_migrations" VALUES (20,'attendance','0002_userprofile_department_userprofile_gender_and_more','2022-03-11 01:53:28.734385');
INSERT INTO "django_migrations" VALUES (21,'attendance','0003_alter_userprofile_gender','2022-03-11 02:52:53.808137');
INSERT INTO "django_migrations" VALUES (22,'attendance','0004_class','2022-03-11 05:15:22.694957');
INSERT INTO "django_migrations" VALUES (23,'attendance','0005_remove_student_author_remove_student_banner_and_more','2022-03-11 05:58:06.353190');
INSERT INTO "django_migrations" VALUES (24,'attendance','0006_remove_student_student_code','2022-03-11 06:03:04.856624');
INSERT INTO "django_migrations" VALUES (25,'attendance','0007_student_student_code','2022-03-11 06:03:38.006845');
INSERT INTO "django_migrations" VALUES (26,'attendance','0008_classstudent','2022-03-11 07:22:40.502361');
INSERT INTO "django_migrations" VALUES (27,'attendance','0009_attendance','2022-03-11 08:03:47.771056');
INSERT INTO "django_admin_log" VALUES (1,'2022-03-11 02:11:59.542470','1','admin','[{"changed": {"fields": ["User type"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (2,'2022-03-11 02:53:49.183467','2','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (3,'2022-03-11 03:19:34.322029','5','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (4,'2022-03-11 03:21:36.965966','6','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2022-03-11 03:22:39.749329','7','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (6,'2022-03-11 03:25:56.658715','8','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (7,'2022-03-11 03:29:29.798674','10','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (8,'2022-03-11 03:30:18.365164','11','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (9,'2022-03-11 03:31:25.216430','12','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (10,'2022-03-11 03:31:50.593575','13','cblake','',4,1,3);
INSERT INTO "django_admin_log" VALUES (11,'2022-03-11 05:40:20.841275','1','[First Year] First Year-Class 101','',11,1,3);
INSERT INTO "django_admin_log" VALUES (12,'2022-03-12 04:05:24.846738','14','cblake','[{"changed": {"fields": ["password"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (13,'2022-03-12 04:06:41.463285','14','cblake','[{"changed": {"fields": ["password"]}}]',4,1,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'attendance','course');
INSERT INTO "django_content_type" VALUES (8,'attendance','department');
INSERT INTO "django_content_type" VALUES (9,'attendance','userprofile');
INSERT INTO "django_content_type" VALUES (10,'attendance','student');
INSERT INTO "django_content_type" VALUES (11,'attendance','class');
INSERT INTO "django_content_type" VALUES (12,'attendance','classstudent');
INSERT INTO "django_content_type" VALUES (13,'attendance','attendance');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_course','Can add course');
INSERT INTO "auth_permission" VALUES (26,7,'change_course','Can change course');
INSERT INTO "auth_permission" VALUES (27,7,'delete_course','Can delete course');
INSERT INTO "auth_permission" VALUES (28,7,'view_course','Can view course');
INSERT INTO "auth_permission" VALUES (29,8,'add_department','Can add department');
INSERT INTO "auth_permission" VALUES (30,8,'change_department','Can change department');
INSERT INTO "auth_permission" VALUES (31,8,'delete_department','Can delete department');
INSERT INTO "auth_permission" VALUES (32,8,'view_department','Can view department');
INSERT INTO "auth_permission" VALUES (33,9,'add_userprofile','Can add user profile');
INSERT INTO "auth_permission" VALUES (34,9,'change_userprofile','Can change user profile');
INSERT INTO "auth_permission" VALUES (35,9,'delete_userprofile','Can delete user profile');
INSERT INTO "auth_permission" VALUES (36,9,'view_userprofile','Can view user profile');
INSERT INTO "auth_permission" VALUES (37,10,'add_student','Can add student');
INSERT INTO "auth_permission" VALUES (38,10,'change_student','Can change student');
INSERT INTO "auth_permission" VALUES (39,10,'delete_student','Can delete student');
INSERT INTO "auth_permission" VALUES (40,10,'view_student','Can view student');
INSERT INTO "auth_permission" VALUES (41,11,'add_class','Can add class');
INSERT INTO "auth_permission" VALUES (42,11,'change_class','Can change class');
INSERT INTO "auth_permission" VALUES (43,11,'delete_class','Can delete class');
INSERT INTO "auth_permission" VALUES (44,11,'view_class','Can view class');
INSERT INTO "auth_permission" VALUES (45,12,'add_classstudent','Can add class student');
INSERT INTO "auth_permission" VALUES (46,12,'change_classstudent','Can change class student');
INSERT INTO "auth_permission" VALUES (47,12,'delete_classstudent','Can delete class student');
INSERT INTO "auth_permission" VALUES (48,12,'view_classstudent','Can view class student');
INSERT INTO "auth_permission" VALUES (49,13,'add_attendance','Can add attendance');
INSERT INTO "auth_permission" VALUES (50,13,'change_attendance','Can change attendance');
INSERT INTO "auth_permission" VALUES (51,13,'delete_attendance','Can delete attendance');
INSERT INTO "auth_permission" VALUES (52,13,'view_attendance','Can view attendance');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$hikXWY4jK8fjjZY0CrRPow$eGVbq/fBH590v5hwAlAlOda42ut1f8tO0ovLSmEUTU8=','2022-05-30 03:33:49.875181',1,'admin','Administrator','admin@gmail.com',1,1,'2022-03-10 07:23:41.968412','System');
INSERT INTO "auth_user" VALUES (16,'pbkdf2_sha256$320000$xXslW4ExWmjpziuKx5S5DD$ZSMtj4vSza3/cOxA0Yz35wOb6mb2pJj1WnY1sRoIfQ8=','2022-03-12 08:19:26.448334',0,'gwilson','Wilson','gwilson@gmail.com',0,1,'2022-03-12 08:05:20.137148','Ser George');
INSERT INTO "auth_user" VALUES (17,'pbkdf2_sha256$260000$xqCtkc1AS1F5sFjAshFUA7$kY4Zo2cjWuF/b+Suy23XhYOc/fRaHfqZ1Z2/fJKBIvo=','2022-05-29 13:40:04.056798',0,'gbcerna','Cerna','gerald.cerna@carsu.edu.ph',0,1,'2022-05-29 00:29:42.786440','Gerald');
INSERT INTO "django_session" VALUES ('daqs0ily7hsts86jst1bjm4qxim2uts2','.eJxVjEEOwiAQRe_C2hBgpmhduu8ZCMMMUjU0Ke3KeHdD0oVu_3vvv1WI-1bC3mQNM6ursur0u1FMT6kd8CPW-6LTUrd1Jt0VfdCmp4XldTvcv4MSW-l1yjafDeYE4gEyMBtHlwEJDBKRkRSNYHbi0VkLJN6NMiDm0TKAqM8X_6Y4Rw:1nSE3G:jdNDPfNpCLFZDLJPaQbtage2JjMtK6Q3RZ-nBJiL5EY','2022-03-24 08:21:38.351864');
INSERT INTO "django_session" VALUES ('b1iz69mx5d52rhgxi884s8inzrft8w0g','.eJxVjEEOwiAQRe_C2hBgpmhduu8ZCMMMUjU0Ke3KeHdD0oVu_3vvv1WI-1bC3mQNM6ursur0u1FMT6kd8CPW-6LTUrd1Jt0VfdCmp4XldTvcv4MSW-l1yjafDeYE4gEyMBtHlwEJDBKRkRSNYHbi0VkLJN6NMiDm0TKAqM8X_6Y4Rw:1nSEox:IlvFRRk-2yV15dzgfbCSkzoUs-EDuf9BE-z7zuailYg','2022-03-24 09:10:55.520556');
INSERT INTO "django_session" VALUES ('kyoq61g6fksrpgezv26p756ue6f3785q','.eJxVjDsOwjAQBe_iGln-bgwlPWew1rs2CSBbipMKcXcSKQW0b2beW0RclzGuPc9xYnER2onT75iQnrnuhB9Y701Sq8s8Jbkr8qBd3hrn1_Vw_w5G7ONWD-BJOcxgIDAlDh4HVmEgBQAhWb9BY9mEM1mtvU3BGy4FyIHjgiQ-X_X2N9k:1nStaY:VDFWL2KP94dV7el1Uy22ymYqO0mS_olxxF1u9m4yOiw','2022-03-26 04:42:46.412920');
INSERT INTO "django_session" VALUES ('kikbq4z4h4mpoa1rnzwjj2ekkiwit6rd','.eJxVjEEOwiAQRe_C2hBgpmhduu8ZCMMMUjU0Ke3KeHdD0oVu_3vvv1WI-1bC3mQNM6ursur0u1FMT6kd8CPW-6LTUrd1Jt0VfdCmp4XldTvcv4MSW-l1yjafDeYE4gEyMBtHlwEJDBKRkRSNYHbi0VkLJN6NMiDm0TKAqM8X_6Y4Rw:1nSuUi:yqLGGiDyI-dQ374oCbBmFOWG5i2r_EqSB719eWY5_5A','2022-03-26 05:40:48.244205');
INSERT INTO "django_session" VALUES ('hdm3ilz4uhasy7dd115ags4v1xkh4fvd','.eJxVjDsOwjAQBe_iGlmO_6Gk5wzWrneDA8iW4qRC3B0ipYD2zcx7iQTbWtLWeUkzibMYgjj9jgj5wXUndId6azK3ui4zyl2RB-3y2oifl8P9OyjQy7fOFFVwUVuFo9dqZHCAionsFG0OUXsGpWBCJkb26IxzmrMPAYZoTBbvDxWtOJM:1nv6oS:RvawG9RqImslOZu33xd7gNDie51R_xPkkcP9vWZaL6A','2022-06-12 00:29:44.132187');
INSERT INTO "django_session" VALUES ('lla2rv8xrwfhq5vfq978sik365nj7tpp','.eJxVjDsOwjAQBe_iGlmO_6Gk5wzWrneDA8iW4qRC3B0ipYD2zcx7iQTbWtLWeUkzibMYgjj9jgj5wXUndId6azK3ui4zyl2RB-3y2oifl8P9OyjQy7fOFFVwUVuFo9dqZHCAionsFG0OUXsGpWBCJkb26IxzmrMPAYZoTBbvDxWtOJM:1nv7TW:7stUlRchgoDX24Lmsj7piNA_I9To-UN-sZ3MlhjPOgE','2022-06-12 01:12:10.397814');
INSERT INTO "django_session" VALUES ('5lcdkb875b33nqyg6pg219a5pbuk6akb','.eJxVjDsOwyAQBe9CHSE-BuyU6X0Ga2F3g5MIJGNXUe4eIblI2jcz7y0WOPa8HI22ZUVxFVpcfrcI6UmlA3xAuVeZatm3NcquyJM2OVek1-10_w4ytNxro9E6IhvIeoQQCBkwckjEOkRQSJPTzGkgPTB5SDx6MylwVukwGvH5AiaeOSU:1nvCMt:SvwOAD0wL-EGqakWTcpSRl7d8bfV2ODYEv6whmxmnOY','2022-06-12 06:25:39.217304');
INSERT INTO "django_session" VALUES ('4cvyvtkdyyp0u6emhrll8oqv0qxen30k','.eJxVjDsOwyAQBe9CHSE-BuyU6X0Ga2F3g5MIJGNXUe4eIblI2jcz7y0WOPa8HI22ZUVxFVpcfrcI6UmlA3xAuVeZatm3NcquyJM2OVek1-10_w4ytNxro9E6IhvIeoQQCBkwckjEOkRQSJPTzGkgPTB5SDx6MylwVukwGvH5AiaeOSU:1nvJ9P:cmTjA18fEToiwB_laj0XQhvcJbiBYUnTAVgLAfuD-AM','2022-06-12 13:40:11.706656');
INSERT INTO "django_session" VALUES ('1g8rnxgjmaosfqy441jdkmjv538hmcox','.eJxVjDsOwyAQBe9CHSE-BuyU6X0Ga2F3g5MIJGNXUe4eIblI2jcz7y0WOPa8HI22ZUVxFVpcfrcI6UmlA3xAuVeZatm3NcquyJM2OVek1-10_w4ytNxro9E6IhvIeoQQCBkwckjEOkRQSJPTzGkgPTB5SDx6MylwVukwGvH5AiaeOSU:1nvWA9:pkq--Y2g241ykIMLkoIZCQT262ZMmgBBiX98GezcVVo','2022-06-13 03:33:49.937718');
INSERT INTO "attendance_course" VALUES (2,'IT 101-DG1','Human Computer Interaction',1,'2022-03-11 01:20:12.842162','2022-05-30 09:20:29.108376',1);
INSERT INTO "attendance_course" VALUES (3,'IT 120-ATUV1','Integrative Programming and Technologies 2',1,'2022-03-11 01:20:28.956388','2022-05-30 09:20:22.112150',1);
INSERT INTO "attendance_department" VALUES (1,'BSIT','Bachelor of Science in Information Technology',1,'2022-03-10 09:09:49.941414','2022-05-29 05:37:36.554445');
INSERT INTO "attendance_department" VALUES (2,'BSIS','Bachelor of Science in Information Science',1,'2022-03-11 00:35:07.614651','2022-05-29 05:38:00.237876');
INSERT INTO "attendance_department" VALUES (3,'BSCS','Bachelor of Science in Computer Science',1,'2022-03-11 00:39:21.657591','2022-05-29 05:38:12.528889');
INSERT INTO "attendance_userprofile" VALUES (1,'09123456789','1997-06-23','Sample Only','images/csu-logo.png',1,1,NULL,NULL);
INSERT INTO "attendance_userprofile" VALUES (17,'09565163824','1997-11-07','Buenavista, Agusan del Norte','images/avatar_nEKpL0x.png',2,17,1,'Male');
INSERT INTO "attendance_class" VALUES (7,'2021-2022','Third Year','IT 120-ATUV1',17);
INSERT INTO "attendance_student" VALUES (5,'Uzzhiel','None','Cebrian','2022-05-29 05:46:07.455943','2022-05-29 05:46:53.129617',3,'09123456789','2022-05-29','Female','191-01932');
INSERT INTO "attendance_student" VALUES (6,'Lynjon','None','Cogtas','2022-05-29 05:46:45.971317','2022-05-29 05:47:15.644693',3,'09123456789','2022-05-29','Male','191-02068');
INSERT INTO "attendance_student" VALUES (7,'Johnrex',NULL,'Culintas','2022-05-29 05:47:42.869749','2022-05-29 05:47:42.894728',3,'09123456789','2022-05-29','Male','191-02188');
INSERT INTO "attendance_student" VALUES (8,'Gerald',NULL,'Chavez','2022-05-29 05:48:11.085879','2022-05-29 05:48:11.101322',3,'09123456789','2022-05-29','Male','191-02231');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "attendance_course_department_id_c291d7cc" ON "attendance_course" (
	"department_id"
);
CREATE INDEX IF NOT EXISTS "attendance_userprofile_department_id_e7d64404" ON "attendance_userprofile" (
	"department_id"
);
CREATE INDEX IF NOT EXISTS "attendance_class_assigned_faculty_id_022ea304" ON "attendance_class" (
	"assigned_faculty_id"
);
CREATE INDEX IF NOT EXISTS "attendance_student_course_id_75413cf2" ON "attendance_student" (
	"course_id"
);
CREATE INDEX IF NOT EXISTS "attendance_classstudent_classIns_id_7374042f" ON "attendance_classstudent" (
	"classIns_id"
);
CREATE INDEX IF NOT EXISTS "attendance_classstudent_student_id_45808deb" ON "attendance_classstudent" (
	"student_id"
);
CREATE INDEX IF NOT EXISTS "attendance_attendance_classIns_id_f9318152" ON "attendance_attendance" (
	"classIns_id"
);
CREATE INDEX IF NOT EXISTS "attendance_attendance_student_id_94863613" ON "attendance_attendance" (
	"student_id"
);
COMMIT;
