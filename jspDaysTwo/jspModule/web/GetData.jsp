<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="Connect_database.jsp"%>
<%@ page import="static java.net.URLDecoder.*" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.net.URLDecoder" %>

<%!
    StringBuilder result = new StringBuilder();
    int columnNeed = -1;
    int start_Column=0;
%>
<%

    final String cmd = request.getParameter("getOrigient");//获取 参数
    if(cmd == null){

    }
    Thread thread = null;
    thread = new Thread(new Runnable() {
        @Override
        public void run() {
            if(cmd.equals("GROUPTYPE")){
                String command = "select * from grouptype;";
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                    columnNeed = 2; //需要多少的列数据
                    start_Column = 0;//从那列开始
                } catch (SQLException e) {
//                    result.append("获取数据错误!");
                }
            }
            else if(cmd.equals("EACHGROUP")){
                String command = "select * from objectgroup;";
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                    columnNeed = 3; //需要多少的列数据
                    start_Column = 1;//从那列开始
                } catch (SQLException e) {
//                    result.append("获取数据错误!");
                }
            }
            else if(cmd.equals("GROUPTYPE_ANDTITLE_ALL")){
                String sign = null;
                try {
                    sign = decode(request.getParameter("sign"),"utf-8");
                } catch (UnsupportedEncodingException e) {
//                    e.printStackTrace();

                }
                //查询这个组的所有数据
                String command = "select * from objectgroup where type='"+sign+"';";
//                System.out.println(command);
                try {

                    updateOrDeleteOrInsert(command,QUERY);
                    columnNeed = 15; //需要多少的列数据
                    start_Column = 1;//从那列开始
                } catch (SQLException e) {
//                    result.append("获取数据错误!");
                }





            }
            else if(cmd.equals("QGROUPOBJECT")){
                Cookie[] cookies = null;
                Cookie cookie = null;
                cookies = request.getCookies();
                boolean hasGROUPID = false;
                String value;
                if(cookies!=null){
                    for(int i = 0;i<cookies.length;i++){
                        cookie = cookies[i];
                        if(cookie.getName().equals("title")){
                            hasGROUPID = true;
                            try {
                                value = URLDecoder.decode(cookie.getValue(), "utf-8");
                                String command = "select * from title where grade in (SELECT grade FROM titlerelative_b WHERE groupmd5='"+value+"')";
                                //先存储数据
                                columnNeed = 12; //需要多少的列数据
                                start_Column = 0;//从那列开始
                                updateOrDeleteOrInsert(command,QUERY);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            } catch (SQLSyntaxErrorException e) {
                                e.printStackTrace();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            break;
                        }
                    }
                    //接下来，查询


                }
                else{

                    return ;
                }
            }
            else if(cmd.equals("QUERYMOUYIGE")){
                Cookie[] cookies = null;
                Cookie cookie = null;
                cookies = request.getCookies();
                boolean hasGROUPID = false;
                String value;
                if(cookies!=null){
                    for(int i = 0;i<cookies.length;i++){
                        cookie = cookies[i];
                        if(cookie.getName().equals("title")){
                            hasGROUPID = true;
                            try {
                                value = URLDecoder.decode(cookie.getValue(), "utf-8");
                                String command = "select * from objectgroup where grade_group='"+value+"';";
                                //先存储数据
                                columnNeed = 15; //需要多少的列数据
                                start_Column = 0;//从那列开始
                                updateOrDeleteOrInsert(command,QUERY);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            } catch (SQLSyntaxErrorException e) {
                                e.printStackTrace();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            break;
                        }
                    }
                    //接下来，查询
                }
            }
            else if(cmd.equals("TITLEDATA")){
                int x =  Integer.parseInt(request.getParameter("x"));
                String command = "select * from title where x="+x;
                //先存储数据
                columnNeed = 13; //需要多少的列数据
                start_Column = 0;//从那列开始
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                } catch (SQLException e) {
                    e.printStackTrace();
                }


            }
            else if(cmd.equals("EXAMPLES")){
//                System.out.println("A");
                String x =  request.getParameter("x");
                String command = "select * from titleexamples where iscanread='可见' and grade='"+x+"'";
//                System.out.println(command);
                //先存储数据
                columnNeed = 7; //需要多少的列数据
                start_Column = 0;//从那列开始
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else if(cmd.equals("ALL_EXAMPLES")){
                String x =  request.getParameter("x");
                String command = "select count(*) from titleexamples where and grade='"+x+"'";
//                System.out.println(command);
                //先存储数据
                columnNeed = -1; //需要多少的列数据
                start_Column = 0;//从那列开始
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                } catch (SQLException e) {
                    e.printStackTrace();
                }


            }
            else if(cmd.equals("EXAMPLES_EACH")){
                String x =  request.getParameter("x");
                int index = Integer.parseInt(request.getParameter("index"));
                String command = "select * from titleexamples where grade='"+x+"' limit "+index+",1";
//                System.out.println(command);
                //先存储数据
                columnNeed = 7; //需要多少的列数据
                start_Column = 0;//从那列开始
                try {
                    updateOrDeleteOrInsert(command,QUERY);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            //

        }
    });
    thread.start();
    try {
        thread.join();
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
    result = new StringBuilder();
    //提前结束
    if(columnNeed == -1){
        out.println("|"+sud.datas.get(0).get(0));
        return ;
    }


    if(sud.rowSize >0)
        result.append("}");//初始化
    for(int i = 0;i<sud.rowSize;i++){
        for(int j = start_Column;j<columnNeed;j++){
            result.append(sud.datas.get(i).get(j)+"|");
        }
        result.append("}");
    }
    System.out.println(result.toString());
%>
<%=result.toString()%>