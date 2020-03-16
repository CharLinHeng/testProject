package data_set;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//π§æﬂ¿‡
public class Md5Make {
    public static String md5Makes(String str,int num){
        String md5Val ="";
        try {
            MessageDigest m;
            m = MessageDigest.getInstance("MD5");
            m.update(str.getBytes(), 0, str.length());
            md5Val =  new BigInteger(1, m.digest()).toString(num);


        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return md5Val;
    }
}
