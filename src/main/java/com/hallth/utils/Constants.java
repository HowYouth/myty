package com.hallth.utils;

public class Constants {
    public static enum USERSTATUS{
        NOMAL(0,"正常"),
        EXPIRED(1,"过期"),
        LOCKED(2,"锁定"),
        DELETED(3,"删除");

        private USERSTATUS(int key,String value){
            this.key=key;
            this.value=value;
        }
        private final int key;
        private final String value;

        public int getKey() {
            return key;
        }

        public String getValue() {
            return value;
        }
    }
}
