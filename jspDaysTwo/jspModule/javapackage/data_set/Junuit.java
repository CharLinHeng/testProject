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
        //���� �ܵ� SqlMapConfig  ����  ��io�����м���   ��ȡ �ֽ��� �ַ���\
        String source_url = "sqlMapConfig.xml";
//        System.out.println(Resources.class.getResource("")+",| "+Test.class.getResource(""));
        InputStream is = Resources.getResourceAsStream(source_url);//ͨ�������м���
        //д�� Mapper
        //����������sqlSessionFactory
        SqlSessionFactory sqlsessionFactory = new SqlSessionFactoryBuilder().build(is);
        //���� sqlSessionFactory����� sqlsession
        SqlSession sqlSession  = sqlsessionFactory.openSession();

        //ִ�����
//        GetInformations data =  sqlSession.selectOne("test.findtip", 20);
//        System.out.println(data.toString());
//            List<GetInformations> datas =  sqlSession.selectList("test.alltip");
//            for(int i = 0;i<datas.size();i++){
//                System.out.println(datas.get(i).toString());
//            }
        //��tip���
//        GetInformations insert_unit = new GetInformations();
//        insert_unit.setUserid(3);
//        insert_unit.setContent("adddata");
//        insert_unit.setInitalId(20);
//        insert_unit.setStatue(200);
//        insert_unit.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//        insert_unit.setType(600);
//
//        sqlSession.insert("test.adddata",insert_unit);

        //ɾ
//        sqlSession.delete("test.deletedata");
//        sqlSession.commit();
        //��
        GetInformations insert_unit = new GetInformations();
        insert_unit.setX(20);
        insert_unit.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

        sqlSession.update("test.update",insert_unit);
        sqlSession.commit();


//

    }
}
