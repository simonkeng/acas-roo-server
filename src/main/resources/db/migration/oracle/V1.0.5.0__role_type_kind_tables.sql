CREATE TABLE role_type
(    "ID" NUMBER(19,0),
     "TYPE_NAME" VARCHAR2(64 CHAR),
     "VERSION" NUMBER(10,0)
);

CREATE UNIQUE INDEX "ROLE_TYPE_ID_IDX" ON "ROLE_TYPE" ("ID");
CREATE UNIQUE INDEX "ROLE_TYPE_NAME_IDX" ON "ROLE_TYPE" ("TYPE_NAME");
ALTER TABLE "ROLE_TYPE" ADD UNIQUE ("TYPE_NAME");
ALTER TABLE "ROLE_TYPE" ADD PRIMARY KEY ("ID");
ALTER TABLE "ROLE_TYPE" MODIFY ("TYPE_NAME" NOT NULL ENABLE);
ALTER TABLE "ROLE_TYPE" MODIFY ("ID" NOT NULL ENABLE);

CREATE TABLE role_kind
(    "ID" NUMBER(19,0),
     "KIND_NAME" VARCHAR2(64 CHAR),
     "LS_TYPE_AND_KIND" VARCHAR2(255 CHAR),
     "VERSION" NUMBER(10,0),
     "LS_TYPE" NUMBER(19,0)
);

CREATE UNIQUE INDEX "ROLE_KIND_ID_IDX" ON "ROLE_KIND" ("ID");
CREATE UNIQUE INDEX "ROLE_KIND_TK_IDX" ON "ROLE_KIND" ("LS_TYPE_AND_KIND");
ALTER TABLE "ROLE_KIND" ADD UNIQUE ("LS_TYPE_AND_KIND");
ALTER TABLE "ROLE_KIND" ADD PRIMARY KEY ("ID");
ALTER TABLE "ROLE_KIND" MODIFY ("LS_TYPE" NOT NULL ENABLE);
ALTER TABLE "ROLE_KIND" MODIFY ("KIND_NAME" NOT NULL ENABLE);
ALTER TABLE "ROLE_KIND" MODIFY ("ID" NOT NULL ENABLE);
ALTER TABLE "ROLE_KIND" ADD CONSTRAINT "ROLE_KIND_TYPE_FK" FOREIGN KEY ("LS_TYPE") REFERENCES "ROLE_TYPE" ("ID") ENABLE;
