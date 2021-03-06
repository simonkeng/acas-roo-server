package com.labsynch.labseer.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.JdbcUtils;
import org.springframework.jdbc.support.MetaDataAccessException;

import com.github.underscore.$;
import com.github.underscore.Function1;
import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.domain.LsThingState;
import com.labsynch.labseer.domain.LsThingValue;

public class SimpleUtil {
	
	@Autowired
	private PropertiesUtilService propertiesUtilService;
	
	private static int PARAMETER_LIMIT = 999;
	
	public static boolean isNumeric(String str) {
		for (char c : str.toCharArray()) {
			if (!Character.isDigit(c)) return false;
		}
		return true;
	}
	
	public static boolean isDecimalNumeric(String str) {
		for (char c : str.toCharArray()) {
			if (!Character.isDigit(c) && c != '-' && c!= '.') return false;
		}
		return true;
	}
	
	public static int countLines(String filename) throws IOException {
	    InputStream is = new BufferedInputStream(new FileInputStream(filename));
	    try {
	        byte[] c = new byte[1024];
	        int count = 0;
	        int readChars = 0;
	        boolean empty = true;
	        while ((readChars = is.read(c)) != -1) {
	            empty = false;
	            for (int i = 0; i < readChars; ++i) {
	                if (c[i] == '\n') {
	                    ++count;
	                }
	            }
	        }
	        return (count == 0 && !empty) ? 1 : count;
	    } finally {
	        is.close();
	    }
	}
	
	public static List<String> splitSearchString(String searchString){
		List<String> list = new ArrayList<String>();
		Matcher m = Pattern.compile("([^\"]\\S*|\".+?\")\\s*").matcher(searchString);
		while (m.find()){
			list.add(m.group(1).replace("\"",""));
		}
		return list;
	}
	
	public static String toAlphabetic(int i){
		if( i<0 ) {
	        return "-"+toAlphabetic(-i-1);
	    }

	    int quot = i/26;
	    int rem = i%26;
	    char letter = (char)((int)'A' + rem);
	    if( quot == 0 ) {
	        return ""+letter;
	    } else {
	        return toAlphabetic(quot-1) + letter;
	    }
	}
	
	public static Collection<Query> splitHqlInClause(EntityManager em, String queryString, String attributeName, List<String> matchStrings){
		Map<String, Collection<String>> sqlCurveIdMap = new HashMap<String, Collection<String>>();
    	List<String> allCodes = new ArrayList<String>();
    	allCodes.addAll(matchStrings);
    	int startIndex = 0;
    	Collection<Query> allQueries = new ArrayList<Query>();
    	while (startIndex < matchStrings.size()){
    		int endIndex;
    		if (startIndex+PARAMETER_LIMIT < matchStrings.size()) endIndex = startIndex+PARAMETER_LIMIT;
    		else endIndex = matchStrings.size();
    		List<String> nextCodes = allCodes.subList(startIndex, endIndex);
    		String groupName = "strings"+startIndex;
    		String sqlClause = " "+attributeName+" IN (:"+groupName+")";
    		sqlCurveIdMap.put(sqlClause, nextCodes);
    		startIndex=endIndex;
    	}
    	for (String sqlClause : sqlCurveIdMap.keySet()){
			String completeQueryString = queryString + sqlClause + " )";
			Query q = em.createQuery(completeQueryString);
			String groupName = sqlClause.split(":")[1].replace(")","");
        	q.setParameter(groupName, sqlCurveIdMap.get(sqlClause));
        	allQueries.add(q);
    	}
    	return allQueries;
	}
	
	public static Query addHqlInClause(EntityManager em, String queryString, String attributeName, List<String> matchStrings){
		Map<String, Collection<String>> sqlCurveIdMap = new HashMap<String, Collection<String>>();
    	List<String> allCodes = new ArrayList<String>();
    	allCodes.addAll(matchStrings);
    	int startIndex = 0;
    	while (startIndex < matchStrings.size()){
    		int endIndex;
    		if (startIndex+PARAMETER_LIMIT < matchStrings.size()) endIndex = startIndex+PARAMETER_LIMIT;
    		else endIndex = matchStrings.size();
    		List<String> nextCodes = allCodes.subList(startIndex, endIndex);
    		String groupName = "strings"+startIndex;
    		String sqlClause = " "+attributeName+" IN (:"+groupName+")";
    		sqlCurveIdMap.put(sqlClause, nextCodes);
    		startIndex=endIndex;
    	}
    	int numClause = 1;
    	for (String sqlClause : sqlCurveIdMap.keySet()){
    		if (numClause == 1){
    			queryString = queryString + sqlClause;
    		}else{
    			queryString = queryString + " OR " + sqlClause;
    		}
    		numClause++;
    	}
    	queryString = queryString + " )";
    	Query q = em.createQuery(queryString);
		for (String sqlClause : sqlCurveIdMap.keySet()){
        	String groupName = sqlClause.split(":")[1].replace(")","");
        	q.setParameter(groupName, sqlCurveIdMap.get(sqlClause));
        }
    	return q;
	}
	
	public static Query addHqlInClauseNativeQuery(EntityManager em, String queryString, String attributeName, List<String> matchStrings){
		Map<String, Collection<String>> sqlCurveIdMap = new HashMap<String, Collection<String>>();
    	List<String> allCodes = new ArrayList<String>();
    	allCodes.addAll(matchStrings);
    	int startIndex = 0;
    	while (startIndex < matchStrings.size()){
    		int endIndex;
    		if (startIndex+PARAMETER_LIMIT < matchStrings.size()) endIndex = startIndex+PARAMETER_LIMIT;
    		else endIndex = matchStrings.size();
    		List<String> nextCodes = allCodes.subList(startIndex, endIndex);
    		String groupName = "strings"+startIndex;
    		String sqlClause = " "+attributeName+" IN (:"+groupName+")";
    		sqlCurveIdMap.put(sqlClause, nextCodes);
    		startIndex=endIndex;
    	}
    	int numClause = 1;
    	for (String sqlClause : sqlCurveIdMap.keySet()){
    		if (numClause == 1){
    			queryString = queryString + sqlClause;
    		}else{
    			queryString = queryString + " OR " + sqlClause;
    		}
    		numClause++;
    	}
    	queryString = queryString + " )";
    	Query q = em.createNativeQuery(queryString);
		for (String sqlClause : sqlCurveIdMap.keySet()){
        	String groupName = sqlClause.split(":")[1].replace(")","");
        	q.setParameter(groupName, sqlCurveIdMap.get(sqlClause));
        }
    	return q;
	}
	
	public static String makeLeftJoinHql(String table, String alias, String lsType, String lsKind){
		String queryString = "left join "+table+" as "+alias+" with "+alias+".lsType='"+lsType+"' and "+alias+".lsKind='"+lsKind+"' and "+alias+".ignored <> true ";
		return queryString;
	}
	public static String makeInnerJoinHql(String table, String alias, String lsType, String lsKind){
		String queryString = "inner join "+table+" as "+alias+" with "+alias+".lsType='"+lsType+"' and "+alias+".lsKind='"+lsKind+"' and "+alias+".ignored <> true ";
		return queryString;
	}
	
	public static String makeInnerJoinHql(String table, String alias, String lsType){
		String queryString = "inner join "+table+" as "+alias+" with "+alias+".lsType='"+lsType+"' and "+alias+".ignored <> true ";
		return queryString;
	}

	
	public static Predicate buildInPredicate(CriteriaBuilder cb, Expression<String> property, List<String> values) {
		Predicate predicate = null;
        int listSize = values.size();
        for (int i = 0; i < listSize; i += PARAMETER_LIMIT) {
            List<String> subList;
            if (listSize > i + PARAMETER_LIMIT) {
                subList = values.subList(i, (i + PARAMETER_LIMIT));
            } else {
                subList = values.subList(i, listSize);
            }
            if (predicate != null) {
            	predicate = cb.or(predicate, property.in(subList));
            } else {
            	predicate = property.in(subList);
            }
        }
        return predicate;
    }
	
	public static final List<Long> getIdsFromSequence(JdbcTemplate jdbcTemplate, String sequenceName, int numberOfIds){
		String databaseType = null;
		try{
			databaseType = (String) JdbcUtils.extractDatabaseMetaData(jdbcTemplate.getDataSource(), "getDatabaseProductName");
		}catch (MetaDataAccessException e){}
		List<Long> idList = new ArrayList<Long>();
		if (databaseType.equalsIgnoreCase("Oracle")){
			String getIdsSql = "SELECT "+sequenceName+".nextval as id from dual connect by level <"+(numberOfIds+1);
			idList = jdbcTemplate.query(getIdsSql, new RowMapper<Long>(){
				public Long mapRow(ResultSet rs, int rowNum) throws SQLException{
					return rs.getLong(1);
				}
			});
		}
		else{ 
			String getIdsSql = "SELECT nextval('"+sequenceName+"') as id from generate_series(1,"+numberOfIds+")";
			idList = jdbcTemplate.query(getIdsSql, new RowMapper<Long>(){
				public Long mapRow(ResultSet rs, int rowNum) throws SQLException{
					return rs.getLong(1);
				}
			});
		}
		return idList;
	}
	
	public static final List<LsThingValue> pluckValueByStateTypeKindAndValueTypeKind(LsThing lsThing, String stateType, String stateKind,
			String valueType, String valueKind){
		final String finalStateType = stateType;
		final String finalStateKind = stateKind;
		final String finalValueType = valueType;
		final String finalValueKind = valueKind;
		
		final com.github.underscore.Predicate<LsThingState> statePredicate = new com.github.underscore.Predicate<LsThingState>(){
			public Boolean apply(LsThingState lsState){
				return lsState.getLsType().equals(finalStateType) && lsState.getLsKind().equals(finalStateKind) && !lsState.isIgnored();
			}
		};
		final com.github.underscore.Predicate<LsThingValue> valuePredicate = new com.github.underscore.Predicate<LsThingValue>(){
			public Boolean apply(LsThingValue lsValue){
				return lsValue.getLsType().equals(finalValueType) && lsValue.getLsKind().equals(finalValueKind) && !lsValue.isIgnored();
			}
		};
		Function1<LsThingState, List<LsThingValue>> filterValues = new Function1<LsThingState, List<LsThingValue>>(){
			public List<LsThingValue> apply(LsThingState lsState){
				return $.filter(new ArrayList<LsThingValue>(lsState.getLsValues()), valuePredicate);
			}
		};
		
		List<LsThingValue> filteredValues = $.flatten($.map($.filter(new ArrayList<LsThingState>(lsThing.getLsStates()), statePredicate), filterValues));

		return filteredValues;
	}
	
	public static final List<LsThingValue> pluckValueByValueTypeKind(LsThing lsThing, String valueType, String valueKind){
		final String finalValueType = valueType;
		final String finalValueKind = valueKind;
		
		final com.github.underscore.Predicate<LsThingState> statePredicate = new com.github.underscore.Predicate<LsThingState>(){
			public Boolean apply(LsThingState lsState){
				return !lsState.isIgnored();
			}
		};
		
		final com.github.underscore.Predicate<LsThingValue> valuePredicate = new com.github.underscore.Predicate<LsThingValue>(){
			public Boolean apply(LsThingValue lsValue){
				return lsValue.getLsType().equals(finalValueType) && lsValue.getLsKind().equals(finalValueKind) && !lsValue.isIgnored();
			}
		};
		Function1<LsThingState, List<LsThingValue>> filterValues = new Function1<LsThingState, List<LsThingValue>>(){
			public List<LsThingValue> apply(LsThingState lsState){
				return $.filter(new ArrayList<LsThingValue>(lsState.getLsValues()), valuePredicate);
			}
		};
		
		List<LsThingValue> filteredValues = $.flatten($.map($.filter(new ArrayList<LsThingState>(lsThing.getLsStates()), statePredicate), filterValues));

		return filteredValues;
	}
}
