CREATE INDEX "ANLP_GRP_VAL_CDKIND_IDX" ON "ANALYSIS_GROUP_VALUE" ("CODE_KIND");
CREATE INDEX "ANLP_GRP_VAL_CDORGN_IDX" ON "ANALYSIS_GROUP_VALUE" ("CODE_ORIGIN");
CREATE INDEX "ANLP_GRP_VAL_CDTYPE_IDX" ON "ANALYSIS_GROUP_VALUE" ("CODE_TYPE");
CREATE INDEX "ITX_CNTR_CNTR_STATE_IGN_IDX" ON "ITX_CONTAINER_CONTAINER_STATE" ("IGNORED");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_CDKIND_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("CODE_KIND");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_CDORGN_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("CODE_ORIGIN");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_CDTK_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("CODE_TYPE_AND_KIND");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_CDTYPE_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("CODE_TYPE");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_CODE_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("CODE_VALUE");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_IGN_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("IGNORED");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_KIND_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("LS_KIND");
CREATE INDEX "ITX_CNTR_CNTR_VALUE_TYPE_IDX" ON "ITX_CONTAINER_CONTAINER_VALUE" ("LS_TYPE");
CREATE INDEX "ITX_THNG_THNG_STATE_IGN_IDX" ON "ITX_LS_THING_LS_THING_STATE" ("IGNORED");
CREATE INDEX "ITX_THNG_THNG_STATE_TK_IDX" ON "ITX_LS_THING_LS_THING_STATE" ("LS_TYPE_AND_KIND");
CREATE INDEX "ITX_THNG_THNG_STATE_TRXN_IDX" ON "ITX_LS_THING_LS_THING_STATE" ("LS_TRANSACTION");
CREATE INDEX "ITX_THNG_THNG_VAL_CDKIND_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("CODE_KIND");
CREATE INDEX "ITX_THNG_THNG_VAL_CDORGN_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("CODE_ORIGIN");
CREATE INDEX "ITX_THNG_THNG_VAL_CDTK_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("CODE_TYPE_AND_KIND");
CREATE INDEX "ITX_THNG_THNG_VAL_CDTYPE_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("CODE_TYPE");
CREATE INDEX "ITX_THNG_THNG_VAL_CODE_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("CODE_VALUE");
CREATE INDEX "ITX_THNG_THNG_VAL_IGN_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("IGNORED");
CREATE INDEX "ITX_THNG_THNG_VAL_KIND_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("LS_KIND");
CREATE INDEX "ITX_THNG_THNG_VAL_OPTK_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("OPERATOR_TYPE_AND_KIND");
CREATE INDEX "ITX_THNG_THNG_VAL_TK_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("LS_TYPE_AND_KIND");
CREATE INDEX "ITX_THNG_THNG_VAL_TRXN_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("LS_TRANSACTION");
CREATE INDEX "ITX_THNG_THNG_VAL_TYPE_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("LS_TYPE");
CREATE INDEX "ITX_THNG_THNG_VAL_UNTK_IDX" ON "ITX_LS_THING_LS_THING_VALUE" ("UNIT_TYPE_AND_KIND");
CREATE INDEX "ITX_PRCL_PRCL_STATE_IGN_IDX" ON "ITX_PROTOCOL_PROTOCOL_STATE" ("IGNORED");
CREATE INDEX "ITX_PRCL_PRCL_STATE_TK_IDX" ON "ITX_PROTOCOL_PROTOCOL_STATE" ("LS_TYPE_AND_KIND");
CREATE INDEX "ITX_PRCL_PRCL_STATE_TRXN_IDX" ON "ITX_PROTOCOL_PROTOCOL_STATE" ("LS_TRANSACTION");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_CDKIND_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("CODE_KIND");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_CDORGN_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("CODE_ORIGIN");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_CDTK_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("CODE_TYPE_AND_KIND");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_CDTYPE_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("CODE_TYPE");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_CODE_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("CODE_VALUE");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_IGN_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("IGNORED");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_KIND_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("LS_KIND");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_OPTK_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("OPERATOR_TYPE_AND_KIND");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_TK_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("LS_TYPE_AND_KIND");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_TRXN_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("LS_TRANSACTION");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_TYPE_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("LS_TYPE");
CREATE INDEX "ITX_PRCL_PRCL_VALUE_UNTK_IDX" ON "ITX_PROTOCOL_PROTOCOL_VALUE" ("UNIT_TYPE_AND_KIND");
CREATE INDEX "ITX_SUBJ_CNTR_STATE_IGN_IDX" ON "ITX_SUBJECT_CONTAINER_STATE" ("IGNORED");
CREATE INDEX "ITX_SUBJ_CNTR_STATE_TRXN_IDX" ON "ITX_SUBJECT_CONTAINER_STATE" ("LS_TRANSACTION");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_CDKIND_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("CODE_KIND");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_CDORGN_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("CODE_ORIGIN");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_CDTK_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("CODE_TYPE_AND_KIND");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_CDTYPE_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("CODE_TYPE");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_CODE_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("CODE_VALUE");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_IGN_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("IGNORED");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_KIND_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("LS_KIND");
CREATE INDEX "ITX_SUBJ_CNTR_VALUE_TYPE_IDX" ON "ITX_SUBJECT_CONTAINER_VALUE" ("LS_TYPE");
CREATE INDEX "TRT_GRP_VALUE_CDKIND_IDX" ON "TREATMENT_GROUP_VALUE" ("CODE_KIND");
CREATE INDEX "TRT_GRP_VALUE_CDORGN_IDX" ON "TREATMENT_GROUP_VALUE" ("CODE_ORIGIN");
CREATE INDEX "TRT_GRP_VALUE_CDTYPE_IDX" ON "TREATMENT_GROUP_VALUE" ("CODE_TYPE");
