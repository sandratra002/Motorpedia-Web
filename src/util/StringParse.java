package util;

public class StringParse {
    public static String getExtension(String fileName){
        int index = fileName.lastIndexOf(".");
        if(index != -1 && index < fileName.length() - 1) return fileName.substring(index + 1);
        else return "";
    }
}
