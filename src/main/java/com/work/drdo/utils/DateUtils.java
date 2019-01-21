/**
 * 
 *
 */
package com.work.drdo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtils {

	private static final Logger logger = LoggerFactory.getLogger(DateUtils.class);
	
	private static DatatypeFactory df = null;

	public static final SimpleDateFormat MMDDYYYY = new SimpleDateFormat("MM/dd/yyyy");
	//

	static {
		try {
			logger.info("static init.");
			df = DatatypeFactory.newInstance();
		} catch (DatatypeConfigurationException e) {
			throw new IllegalStateException("Error while trying to obtain a new instance of DatatypeFactory", e);
		}
	}
	
	/*
     * Converts java.util.Date to javax.xml.datatype.XMLGregorianCalendar
     */
    public static XMLGregorianCalendar toFullXMLGregorianCalendar(Date date) throws DatatypeConfigurationException {
        GregorianCalendar gCalendar = new GregorianCalendar();
        gCalendar.setTime(date);
        return df.newXMLGregorianCalendar(gCalendar);
    }
    public static XMLGregorianCalendar toXMLGregorianCalendar(Date date) throws DatatypeConfigurationException {
        return df.newXMLGregorianCalendar(formatDateAsString(date));
    }
  
    public static String formatMMDDYYYY(Date date){
    	  return MMDDYYYY.format(date);
    	 }
    /*
     * Converts XMLGregorianCalendar to java.util.Date in Java
     */
    public static Date toDate(XMLGregorianCalendar calendar){
        if(calendar == null) {
            return null;
        }
        return calendar.toGregorianCalendar().getTime();
    }

    public static String formatDateAsString(Date toFormat) {
    	final SimpleDateFormat esbDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		return esbDateFormatter.format(toFormat);
	}
	public static String formatDateAsString(Date toFormat, String toDateFormat) {
		return new SimpleDateFormat(toDateFormat).format(toFormat);
	}

	public static String formatDateAsString(String toFormat, String dateFormat) throws ParseException {
		return formatDateAsString(toDate(toFormat, dateFormat));
	}
	public static String formatDateAsString(String toFormat, String fromDateFormat, String toDateFormat) throws ParseException {
		return formatDateAsString(toDate(toFormat, fromDateFormat), toDateFormat);
	}
	public static Date toDate(String fromDate) throws ParseException {
		final SimpleDateFormat esbDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		return esbDateFormatter.parse(fromDate);
	}
	public static Date toDate(String toFormat, String fromDateFormat) throws ParseException {
		return new SimpleDateFormat(fromDateFormat).parse(toFormat);
	}
	
}
