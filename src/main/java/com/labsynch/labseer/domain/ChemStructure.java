package com.labsynch.labseer.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(sequenceName = "CHEM_STRUCTURE_PKSEQ", finders = { "findChemStructureByCodeNameEquals", "findChemStructuresByCodeNameEquals" })
public class ChemStructure {

    private static final Logger logger = LoggerFactory.getLogger(ChemStructure.class);

    @Id
    @SequenceGenerator(name = "structureGen", sequenceName = "CHEM_STRUCTURE_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "structureGen")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(unique = true)
    private String codeName;

    @Version
    @Column(name = "version")
    private Integer version;

    @NotNull
    @Column(columnDefinition = "text")
    private String molStructure;

    @Size(max = 1000)
    private String smiles;

    @Size(max = 255)
    private String lsType;

    @Size(max = 255)
    private String lsKind;

    @Size(max = 255)
    private String lsTypeAndKind;

    @NotNull
    private boolean ignored;

    @NotNull
    private boolean deleted;

    @NotNull
    private String recordedBy;

    @NotNull
    private Date recordedDate;

    private String modifiedBy;

    private Date modifiedDate;

    private Long lsTransaction;

    public ChemStructure(com.labsynch.labseer.domain.ChemStructure structure) {
        this.setCodeName(structure.getCodeName());
        this.setLsType(structure.getLsType());
        this.setLsKind(structure.getLsKind());
        this.setMolStructure(structure.getMolStructure());
        this.setSmiles(structure.getSmiles());
        this.setIgnored(structure.isIgnored());
        this.setDeleted(structure.isDeleted());
        this.setCodeName(structure.getCodeName());
        this.setRecordedBy(structure.getRecordedBy());
        this.setRecordedDate(structure.getRecordedDate());
        this.setModifiedBy(structure.getModifiedBy());
        this.setModifiedDate(structure.getModifiedDate());
        this.setLsTransaction(structure.getLsTransaction());
    }

    public static com.labsynch.labseer.domain.ChemStructure update(com.labsynch.labseer.domain.ChemStructure structure) {
        ChemStructure updatedStructure = ChemStructure.findChemStructure(structure.getId());
        updatedStructure.setMolStructure(structure.getMolStructure());
        updatedStructure.setSmiles(structure.getSmiles());
        updatedStructure.setIgnored(structure.isIgnored());
        updatedStructure.setDeleted(structure.isDeleted());
        updatedStructure.setCodeName(structure.getCodeName());
        updatedStructure.setLsType(structure.getLsType());
        updatedStructure.setLsKind(structure.getLsKind());
        updatedStructure.setModifiedBy(structure.getModifiedBy());
        updatedStructure.setModifiedDate(structure.getModifiedDate());
        updatedStructure.setLsTransaction(structure.getLsTransaction());
        updatedStructure.merge();
        return structure;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getVersion() {
        return this.version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public static com.labsynch.labseer.domain.ChemStructure findStructureByCodeName(String codeName) {
    	ChemStructure result = ChemStructure.findChemStructuresByCodeNameEquals(codeName).getSingleResult();
    	return result;
    }
}
