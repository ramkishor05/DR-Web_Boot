package com.work.drdo.utils;

import java.util.Map;

import ar.com.fdvs.dj.domain.DJValueFormatter;

public class FormulaFooterFormater implements DJValueFormatter{
	private String formula;
	public FormulaFooterFormater(String formula){
		this.formula = formula;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object evaluate(Object arg0,Map fields, Map variables, Map parameters) {
		return formula +" : "+ arg0.toString();
	}

	@Override
	public String getClassName() {
		return String.class.getName();
	}

}
