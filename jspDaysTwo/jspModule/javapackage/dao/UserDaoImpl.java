package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.GetInformations;

public class UserDaoImpl implements UserDao{

    //ע��
    private SqlSessionFactory sqlSessionFactory;
    public UserDaoImpl(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
    //ͨ��һ��id����ѯ tip�е�����

    public GetInformations selecttip(int id){

        SqlSession sqlSession = sqlSessionFactory.openSession();

        return sqlSession.selectOne("test.findtip",id);



    }



}
