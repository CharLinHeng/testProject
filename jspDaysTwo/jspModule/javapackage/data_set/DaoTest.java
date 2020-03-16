package data_set;
import dao.UserDao;
import dao.UserDaoImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import pojo.GetInformations;

import java.io.InputStream;
public class DaoTest {
    private SqlSessionFactory sqlSessionFactory;
    //��ע�⣬before���Ǽ��ع���
    @Before
    public void before()throws Exception{
        String source_url = "sqlMapConfig.xml";
        InputStream is = Resources.getResourceAsStream(source_url);//ͨ�������м���
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
    }
    @Test
    public void daoTest() throws Exception{
        System.out.println("HHHHHHHHHH");
        UserDao userDao = new UserDaoImpl(sqlSessionFactory);

        GetInformations dif = userDao.selecttip(30);

        System.out.println(dif.toString()+"??");

    }
}
