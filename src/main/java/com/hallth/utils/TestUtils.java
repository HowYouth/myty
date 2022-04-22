package com.hallth.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestUtils {
    public static void main(String[] aa){
        String pos = "[{'page':1,'chaptes':[{'offsetX':0.23,'offsetY':0.25}]}]";
        String[] arr = pos.split("offsetX");
        String x = arr[1].split("offsetY")[0];
        String y = arr[1].split("offsetY")[1];
//        String patter = "0\\.[0-9]{1,}";
//        Pattern r = Pattern.compile(patter);
//        Matcher m = r.matcher(x);
//        System.out.println(m.group(0));
//        Matcher mm = r.matcher(y);
//        System.out.println(mm.group(0));

        String str = "[{'page':1,'chaptes':[{'offsetX':0.23,'offsetY':0.25}]}]";

        Pattern pattern = Pattern.compile("0\\.\\d*[1-9]");
        Matcher Xmatcher = pattern.matcher(pos);
        Matcher Ymatcher = pattern.matcher(pos);
        x = Xmatcher.group(0);
        y = Ymatcher.group(1);
        System.out.println(x);//14000
        System.out.println(y);//14000
    }
}
