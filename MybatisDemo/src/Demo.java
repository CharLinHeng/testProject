import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import pojo.Data;

import java.io.IOException;
import java.io.InputStream;

public class Demo {

   public static void main(String[] args) throws IOException {
       //配置 总的 SqlMapConfig  加载  用io流进行加载   获取 字节流 字符流\
       String source_url = "sqlMapConfig.xml";
//        System.out.println(Resources.class.getResource("")+",| "+Test.class.getResource(""));
       InputStream is = Resources.getResourceAsStream(source_url);//通过流进行加载
       //写好 Mapper
       //第三，创建sqlSessionFactory
       SqlSessionFactory sqlsessionFactory = new SqlSessionFactoryBuilder().build(is);
       //创建 sqlSessionFactory下面的 sqlsession
       SqlSession sqlSession  = sqlsessionFactory.openSession();

       //执行语句
       Data data =  sqlSession.selectOne("test.findtip", 9);
       System.out.println(data.toString());
       //

   }

}
