package com.work.drdo.utils;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

public class StringToDoubleConverter implements CustomExpression {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String property;

	public StringToDoubleConverter(String property) {
		this.property = property;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object evaluate(Map fields, Map variables, Map parameters) {

		if (null != fields.get("variable1") && property.equalsIgnoreCase("variable1")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable1").toString())) {
			return Double.parseDouble(fields.get("variable1").toString());
		} else if (null != fields.get("variable2") && property.equalsIgnoreCase("variable2")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable2").toString())) {
			return Double.parseDouble(fields.get("variable2").toString());
		} else if (null != fields.get("variable3") && property.equalsIgnoreCase("variable3")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable3").toString())) {
			return Double.parseDouble(fields.get("variable3").toString());
		} else if (null != fields.get("variable4") && property.equalsIgnoreCase("variable4")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable4").toString())) {
			return Double.parseDouble(fields.get("variable4").toString());
		} else if (null != fields.get("variable5") && property.equalsIgnoreCase("variable5")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable5").toString())) {
			return Double.parseDouble(fields.get("variable5").toString());
		} else if (null != fields.get("variable6") && property.equalsIgnoreCase("variable6")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable6").toString())) {
			return Double.parseDouble(fields.get("variable6").toString());
		} else if (null != fields.get("variable7") && property.equalsIgnoreCase("variable7")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable7").toString())) {
			return Double.parseDouble(fields.get("variable7").toString());
		} else if (null != fields.get("variable8") && property.equalsIgnoreCase("variable8")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable8").toString())) {
			return Double.parseDouble(fields.get("variable8").toString());
		} else if (null != fields.get("variable9") && property.equalsIgnoreCase("variable9")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable9").toString())) {
			return Double.parseDouble(fields.get("variable9").toString());
		} else if (null != fields.get("variable10") && property.equalsIgnoreCase("variable10")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable10").toString())) {
			return Double.parseDouble(fields.get("variable10").toString());
		} else if (null != fields.get("variable11") && property.equalsIgnoreCase("variable11")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable11").toString())) {
			return Double.parseDouble(fields.get("variable11").toString());
		} else if (null != fields.get("variable12") && property.equalsIgnoreCase("variable12")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable12").toString())) {
			return Double.parseDouble(fields.get("variable12").toString());
		} else if (null != fields.get("variable13") && property.equalsIgnoreCase("variable13")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable13").toString())) {
			return Double.parseDouble(fields.get("variable13").toString());
		} else if (null != fields.get("variable14") && property.equalsIgnoreCase("variable14")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable14").toString())) {
			return Double.parseDouble(fields.get("variable14").toString());
		} else if (null != fields.get("variable15") && property.equalsIgnoreCase("variable15")
				&& org.apache.commons.lang.math.NumberUtils.isNumber(fields.get("variable15").toString())) {
			return Double.parseDouble(fields.get("variable15").toString());
		}
		return null;
	}

	@Override
	public String getClassName() {
		return Double.class.getName();
	}

}
