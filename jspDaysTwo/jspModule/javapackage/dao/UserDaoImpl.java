package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.GetInformations;

public class UserDaoImpl implements UserDao{

    //注入
    private SqlSessionFactory sqlSessionFactory;
    public UserDaoImpl(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
    //通过一个id来查询 tip中的数据

    public GetInformations selecttip(int id){

        SqlSession sqlSession = sqlSessionFactory.openSession();

        return sqlSession.selectOne("test.findtip",id);



    }



}
