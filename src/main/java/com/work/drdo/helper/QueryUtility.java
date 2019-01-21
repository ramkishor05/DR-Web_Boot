package com.work.drdo.helper;

public class QueryUtility {

public static StringBuffer createInsertQueryPost(String variableName,String dataType, String data ){
	StringBuffer postinsert = new StringBuffer();
	if(null == data){
		return postinsert.append("null");
	}
	if(dataType.equalsIgnoreCase("text")){
		return postinsert.append("'"+data+"'");
	}if(dataType.equalsIgnoreCase("staticText")){
		return postinsert.append("'"+data+"'");
	}else if(dataType.equalsIgnoreCase("numeric")){
		return postinsert.append(data);
	}else if(dataType.equalsIgnoreCase("date")){
		if(data != null && !data.isEmpty())
		{
			return postinsert.append("'"+data+"'");
		}else{
			return postinsert.append("null");
		}
	}else if(dataType.equalsIgnoreCase("currency")){
		return postinsert.append("'"+data+"'");
	}
	return null;
}
}
