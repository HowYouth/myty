package com.hallth.utils;

public class DatabaseUtils {

    public static int getStartRow(int currentPage, int pageSize){
        int startRow = (currentPage - 1) * pageSize;
        return startRow;
    }

}
