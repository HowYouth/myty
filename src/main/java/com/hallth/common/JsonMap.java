package com.hallth.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class JsonMap extends HashMap {
    public String getString(String key){
        return String.valueOf(this.get(key));
    }

    public Integer getInteger(String key){
        return Integer.valueOf(this.getString(key));
    }

    public Double getDouble(String key){
        return Double.valueOf(this.getString(key));
    }

    public Float getFloat(String key){
        return Float.valueOf(this.getString(key));
    }

    public Boolean getBoolean(String key){
        return Boolean.valueOf(this.getString(key));
    }

    public Character getChar(String key){
        return (Character) (this.get(key));
    }

    public Long getLong(String key){
        return Long.valueOf(this.getString(key));
    }

    public Date getDate(String key, String dataFormat) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(dataFormat);
        return sdf.parse(this.getString(key));
    }
}
