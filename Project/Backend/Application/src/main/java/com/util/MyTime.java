package com.util;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTime {
	public static Time toTimeFromString(String time) throws ParseException {
//		2021-07-16T20:03
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date d = df.parse(time);
		return new Time(d.getTime());
	}

	public static Timestamp toTimestampFromString(String time) throws ParseException {
//		2021-07-16T20:03
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date d = df.parse(time);
		return new Timestamp(d.getTime());
	}

}
