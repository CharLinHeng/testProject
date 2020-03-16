<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data_set.SaveUnitData"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    ResultSet re = null;
    Connection ct = null;
    static SaveUnitData sud = null; //最终结果
    final int INSERT = 1;
    final int DELETE = 2;
    final int QUERY = 3;
    final int UPDATE = 4;
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time = sdf.format(d);
%>
<%
//    ResultSet re ;
    String dbURL="jdbc:mysql://localhost:3306/progarmmercode?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT";

    re = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            if(ct ==null)
                ct = DriverManager.getConnection(dbURL,"root","root");

            //System.out.println("加载数据库成功");
        } catch (ClassNotFoundException e) {

            System.out.println("加载数据库失败了");
            re = null;
        }
//        System.out.println("load success!!");
        //
%>
<%!
    public void query(String sql){
        List<String> name= new ArrayList();  //返回所有字段名字
        //每次组多查询
        //执行后，需要获取字段大小，行数大小，Arrayist, 用数组包起字段所有名字，
        try {
            //获取所有字段名称   结果存储在name里面
            re = ct.createStatement().executeQuery(sql);
            ResultSetMetaData data = re.getMetaData();
            for(int i = 0;i<data.getColumnCount();i++) {
                name.add(data.getColumnName(i + 1));

            }
            //获取数据行数  还有 数据在data_vecter里面
            ArrayList<List<String>> data_vector= new ArrayList(); //数据
            while(re.next()){
                List<String> each_data = new ArrayList();
                for(int i = 1;i<=name.size();i++) {//读取每行
                    each_data.add(re.getString(i));
                }
                data_vector.add(each_data);
            }
        //正式实例化
         sud = new SaveUnitData(name.size(),data_vector.size(),name);
        //一行一行填充数据
        for(int i = 0;i<data_vector.size();i++){
            if(sud.add_element(data_vector.get(i))){
            }
        }
        //填充完毕后，
//        sud.showFunc();
        } catch (SQLException e) {
//            e.printStackTrace();
            e.printStackTrace();
            System.out.println("执行命令失败..");
        }
    }
    public boolean updateOrDeleteOrInsert(String cmd,int type) throws SQLException,SQLSyntaxErrorException{
        //
        Statement stmt=ct.createStatement();
        int result = 0;
        switch (type){
            case DELETE:
                 result=stmt.executeUpdate(cmd);
                break;
            case INSERT:
                 result=stmt.executeUpdate(cmd);
                break;
            case UPDATE:
                 result=stmt.executeUpdate(cmd);
                break;
            case QUERY:
                        query(cmd);
                default:
                break;
        }
//        System.out.println(result);
        stmt.close();

        return true;
    }
    public boolean closeCT(){
        try {
            ct.close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
%>