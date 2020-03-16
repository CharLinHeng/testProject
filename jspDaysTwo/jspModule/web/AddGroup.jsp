<%@ page import="java.net.URLDecoder" %>
<%@ page import="static java.net.URLDecoder.*" %>
<%@ page import="sun.security.provider.MD5" %>
<%@ page import="data_set.Md5Make" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@include file="Connect_database.jsp"%>
<%!
    String result_= "";
    String title;
    String starttime;
    String endtime;
    String scrip;
    String invest;
    String score;
    String maxpeople;
    String grouptype ;
    String author = "admin";
    Thread thread;


%>

<%

    try{
        title = decode(request.getParameter("title"),"utf-8"); //对得到的参数进行解码
        starttime = decode(request.getParameter("starttime"),"utf-8"); //对得到的参数进行解码
        endtime = decode(request.getParameter("endtime"),"utf-8"); //对得到的参数进行解码
        scrip = decode(request.getParameter("scrip"),"utf-8"); //对得到的参数进行解码
        invest = decode(request.getParameter("invest"),"utf-8"); //对得到的参数进行解码
        score = decode(request.getParameter("score"),"utf-8"); //对得到的参数进行解码
        maxpeople = decode(request.getParameter("maxpeople"),"utf-8"); //对得到的参数进行解码
        grouptype = decode(request.getParameter("type"),"utf-8"); //对得到的参数进行解码



//        System.out.println(title);
//        System.out.println(starttime);
//        System.out.println(endtime);
//        System.out.println(scrip);
//        System.out.println(invest);
//        System.out.println(score);
//        System.out.println(maxpeople);
//        System.out.println(grouptype);


    }catch (NullPointerException e){
        result_ = "描述字节太长了，解析失败。存储失败，请最好别加图片。汉字描述就可以，后续会改善";
    }
    if(scrip.length()>2){
        result_ = "";
    }
    //------------------------------------------------------------------------------------------------
    //查找是否有重复名称的
    final String reset = "select groupname from objectgroup where groupname = '"+title+"';";
    System.out.println("{"+reset+"}");
//    -------------------------------------------------------------------------------------------------
    thread = null;
    thread = new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                updateOrDeleteOrInsert(reset,QUERY);
            } catch (SQLException e) {
                result_ = "|failer";
                return ;
            }
        }
    });
    thread.start();
    try {
        thread.join();
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
    //    -------------------------------------------------------------------------------------------------
    if (sud.rowSize>0){
        result_ = "|Data aleardy has repeat title .please check";
        out.print(result_);
        return ;
    }


    //生成md5码
    final String cmd,md5;
    md5 = Md5Make.md5Makes(String.format("%d",(int)(Math.random()*1000000)+100000000),32);
    //时间
    Date d = new Date();
    SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //语言限制
    String language_limit = "*";
    //开始拼接   插入 objejctgroup
    cmd = "insert into objectgroup (`grade_group`, `groupname`, `describle`, `investcode`, `type`, `createtime`, `author`, `max_participantspoeple`, `currparticipants`, `fullscore`, `iscango`, `starttime`, `endtime`, `languagelimit`)values(" +
            "'"+md5+"','"+title+"','"+scrip+"','"+invest+"','"+grouptype+"','"+sdf.format(d)+"','"+author+"',"+Integer.parseInt(maxpeople)+",0,"+Integer.parseInt(score)+",1,'"+starttime+"','"+endtime+"','"+language_limit+"')";

    updateOrDeleteOrInsert(cmd,INSERT);
//    thread = null;
//    System.out.println(cmd+"|||||");
//    thread = new Thread(new Runnable() {
//        @Override
//        public void run() {
//                try {
//
//                } catch (SQLException e) {
//                    result_ = "|failer";
//                }
//        }
//    });
//    thread.start();
//    try {
//        thread.join();
//    } catch (InterruptedException e) {
//        e.printStackTrace();
//    }
//
    if(closeCT())
        result_ = "|success";
    else
        result_ = "|Connection close not OK";

%>
<%
    if(result_!=""){
        out.print(decode(result_,"utf-8"));
    }
%>