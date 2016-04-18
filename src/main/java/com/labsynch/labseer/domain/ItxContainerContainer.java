package com.labsynch.labseer.domain;

import java.io.Reader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.labsynch.labseer.utils.CustomBigDecimalFactory;
import com.labsynch.labseer.utils.ExcludeNulls;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findItxContainerContainersByLsTransactionEquals" })
public class ItxContainerContainer extends AbstractThing {

	private static final Logger logger = LoggerFactory.getLogger(ItxContainerContainer.class);

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "first_container_id")
    private Container firstContainer;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "second_container_id")
    private Container secondContainer;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "itxContainerContainer", fetch = FetchType.LAZY)
    private Set<ItxContainerContainerState> lsStates = new HashSet<ItxContainerContainerState>();

    public ItxContainerContainer(com.labsynch.labseer.domain.ItxContainerContainer itxContainer) {
    	this.setRecordedBy(itxContainer.getRecordedBy());
    	this.setRecordedDate(itxContainer.getRecordedDate());
    	this.setLsTransaction(itxContainer.getLsTransaction());
    	this.setModifiedBy(itxContainer.getModifiedBy());
    	this.setModifiedDate(itxContainer.getModifiedDate());
    	this.setCodeName(itxContainer.getCodeName());
    	this.setLsType(itxContainer.getLsType());
    	this.setLsKind(itxContainer.getLsKind());
    	this.setLsTypeAndKind(itxContainer.getLsTypeAndKind());
        this.firstContainer = itxContainer.getFirstContainer();
        this.secondContainer = itxContainer.getSecondContainer();
    }
    
    public static ItxContainerContainer update(ItxContainerContainer object) {
    	ItxContainerContainer updatedObject = new JSONDeserializer<ItxContainerContainer>().use(null, ItxContainerContainer.class).
        		use(BigDecimal.class, new CustomBigDecimalFactory()).deserializeInto(object.toJson(), 
        				ItxContainerContainer.findItxContainerContainer(object.getId()));
    	updatedObject.setModifiedDate(new Date());
    	updatedObject.merge();
        return updatedObject;
    }
    
    public String toJson() {
        return new JSONSerializer().exclude("*.class")
            	.transform(new ExcludeNulls(), void.class)
        		.serialize(this);
    }
    
    public static ItxContainerContainer fromJsonToItxContainerContainer(String json) {
        return new JSONDeserializer<ItxContainerContainer>()
        		.use(null, ItxContainerContainer.class)
        		.use(BigDecimal.class, new CustomBigDecimalFactory())
        		.deserialize(json);
    }
    
    public static String toJsonArray(Collection<ItxContainerContainer> collection) {
        return new JSONSerializer().exclude("*.class")
            	.transform(new ExcludeNulls(), void.class)
        		.serialize(collection);
    }
    
    public static Collection<ItxContainerContainer> fromJsonArrayToItxContainerContainers(String json) {
        return new JSONDeserializer<List<ItxContainerContainer>>().use(null, ArrayList.class)
        		.use("values", ItxContainerContainer.class)
        		.use(BigDecimal.class, new CustomBigDecimalFactory())
        		.deserialize(json);
    }
    
    public static Collection<ItxContainerContainer> fromJsonArrayToItxContainerContainers(Reader json) {
        return new JSONDeserializer<List<ItxContainerContainer>>().use(null, ArrayList.class)
        		.use("values", ItxContainerContainer.class)
        		.use(BigDecimal.class, new CustomBigDecimalFactory())
        		.deserialize(json);
    }
    
    public static ItxContainerContainer updateNoStates(ItxContainerContainer itxContainerContainer) {
    	ItxContainerContainer updatedItxContainerContainer = ItxContainerContainer.findItxContainerContainer(itxContainerContainer.getId());
    	updatedItxContainerContainer.setRecordedBy(itxContainerContainer.getRecordedBy());
    	updatedItxContainerContainer.setRecordedDate(itxContainerContainer.getRecordedDate());
    	updatedItxContainerContainer.setIgnored(itxContainerContainer.isIgnored());
    	updatedItxContainerContainer.setDeleted(itxContainerContainer.isDeleted());
    	updatedItxContainerContainer.setLsTransaction(itxContainerContainer.getLsTransaction());
    	updatedItxContainerContainer.setModifiedBy(itxContainerContainer.getModifiedBy());
    	updatedItxContainerContainer.setCodeName(itxContainerContainer.getCodeName());
    	updatedItxContainerContainer.setLsType(itxContainerContainer.getLsType());
    	updatedItxContainerContainer.setLsKind(itxContainerContainer.getLsKind());
    	updatedItxContainerContainer.setLsTypeAndKind(itxContainerContainer.getLsTypeAndKind());
    	updatedItxContainerContainer.firstContainer = Container.findContainer(itxContainerContainer.getFirstContainer().getId());
    	updatedItxContainerContainer.secondContainer = Container.findContainer(itxContainerContainer.getSecondContainer().getId());    	
    	updatedItxContainerContainer.setModifiedDate(new Date());
    	updatedItxContainerContainer.merge();
    	
    	logger.debug("------------ Just updated the itxContainerContainer: ");
    	if(logger.isDebugEnabled()) logger.debug(updatedItxContainerContainer.toJson());
    	
        return updatedItxContainerContainer;
    }
}
