package data_set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import pojo.GetInformations;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Junuit {

    @Test
    public void testMyBatis() throws Exception{
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
//        GetInformations data =  sqlSession.selectOne("test.findtip", 20);
//        System.out.println(data.toString());
//            List<GetInformations> datas =  sqlSession.selectList("test.alltip");
//            for(int i = 0;i<datas.size();i++){
//                System.out.println(datas.get(i).toString());
//            }
        //往tip添加
//        GetInformations insert_unit = new GetInformations();
//        insert_unit.setUserid(3);
//        insert_unit.setContent("adddata");
//        insert_unit.setInitalId(20);
//        insert_unit.setStatue(200);
//        insert_unit.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//        insert_unit.setType(600);
//
//        sqlSession.insert("test.adddata",insert_unit);

        //删
//        sqlSession.delete("test.deletedata");
//        sqlSession.commit();
        //改
        GetInformations insert_unit = new GetInformations();
        insert_unit.setX(20);
        insert_unit.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

        sqlSession.update("test.update",insert_unit);
        sqlSession.commit();


//

    }
}
