<%@ page import="java.util.ArrayList" %>
<%@ page import="data_set.Md5Make" %><%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/12
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="Connect_database.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");//设置统一字符编码
    //
    if(request.getParameter("scription") == null){
        out.print("描述图片太大了！错误！");
        return ;
    }
    //
    //标题
    String title = request.getParameter("name");
    //具体描述
    String objectScription = request.getParameter("scription");
    //所在题组 和 md5
    String belong_group=request.getParameter("belong_group_");
    String belong_group_md5=request.getParameter("groupmd5_");
    //开始时间-结束事假
    String starttime=request.getParameter("startrime");
    String endtime=request.getParameter("endtime") ;
    //分值
    String score=request.getParameter("score");
    //题目难易度
    String objectEasy=request.getParameter("object_hard");
    //题目数据限制
    String data_limit=request.getParameter("object_data_limit");
    //附加描述
    String addScript = request.getParameter("addition_tip");
    //测试样例
        //获取样例多少个
     String example_num = request.getParameter("nums_");
        //一共
    String example_num_all = request.getParameter("curr_INDEX");
        //输入  num
        int num_all = Integer.parseInt(example_num_all);
    ArrayList<String>cin_ = new ArrayList();
        //输出
    ArrayList<String>out_ = new ArrayList();
        //附加提示
    ArrayList<String>add_tip_example = new ArrayList();
        //可以见吗
    ArrayList<String>is_CanSee = new ArrayList();
        //时间限制
    ArrayList<String>time_limit = new ArrayList();
    String EE[] = {"EE_1","EE_2","EE_3","EE_4","EE_5","EE_6","EE_7","EE_8","EE_9","EE_10"};
    String E[] = {"E_1","E_2","E_3","E_4","E_5","E_6","E_7","E_8","E_9","E_10"};
    String aDDITION_TIP[] = {"T1","T2","T3","T4","T5","T6","T7","T8","T9","T10"};
    String CANSEE[] = {"CCCCC1","CCCCC2","CCCCC3","CCCCC4","CCCCC5","CCCCC6","CCCCC7","CCCCC8","CCCCC9","CCCCC10"};
    String TIME_LIMIT[] = {"BBBBB1","BBBBB2","BBBBB3","BBBBB4","BBBBB5","BBBBB6","BBBBB7","BBBBB8","BBBBB9","BBBBB10"};
        for(int i = 0;i<num_all;i++){
            String temp = EE[i];
            if(request.getParameter(temp)!=""&request.getParameter(temp).length()>=1){ //如果输出样例不空.
                cin_.add(request.getParameter(E[i]));
                out_.add(request.getParameter(EE[i]));
                add_tip_example.add(request.getParameter(aDDITION_TIP[i]));
                is_CanSee.add(request.getParameter(CANSEE[i]));
                time_limit.add(request.getParameter(TIME_LIMIT[i]));
//                out.print(String.format("输入%s ,输出%s ，测试样例附加提示%s",cin_.get(i),out_.get(i),add_tip_example.get(i)));
            }
        }
        //正确代码
        String correct_code = request.getParameter("correct_code").replaceAll("'","\\\\'");
    //所有数据都准备好了。开始存储


    //先要检查这个标题是否注册
    String cmd = "select title from title where title='"+title+"'";
    updateOrDeleteOrInsert(cmd,QUERY);
    if(sud.rowSize>0){
        out.println("已经含有此标题!");
        return ;
    }
//    out.println("可以继续了");
    out.println("<br>");

    //

    //
    updateOrDeleteOrInsert("select type from objectgroup where grade_group='"+belong_group_md5+"';",QUERY);
    String objecttype = sud.datas.get(0).get(0);
//    out.println(objecttype);
    //生成md5
    String md5 = Md5Make.md5Makes(String.format("%d",(int)(Math.random()*1000000)+100000000),32);
//    out.println(md5+"<br>");
    //插了title表
    cmd = "insert into title (`grade`, `title`, `detail`, `type`, `score`, `submitpeoplenum`, `appcetnum`, `sittingtip`, `hard`, `addition`, `starttime`, `endtime`)values" +
            "('"+md5+"','"+title+"','"+objectScription+"','"+objecttype+"','"+score+"',0,0,'"+addScript+"','"+objectEasy+"','"+data_limit+"'" +
            ",'"+starttime+"','"+endtime+"')";
//    System.out.println(cmd);
    updateOrDeleteOrInsert(cmd,INSERT);
    //接下来，插
    String author = "administrator";
    cmd ="insert into titlerelative_a ( `grade`, `author`, `createtime`, `judgetime`,`correctCodes`)values" +
            "('"+md5+"','"+author+"','"+time+"','"+time+"','"+correct_code+"')";
    updateOrDeleteOrInsert(cmd,INSERT);
    cmd = "insert into titlerelative_b(`grade`, `groupmd5`, `groupname`, `judgecode`, `ranklimit`, `power`, `batch`, `batch_x`)values" +
            "('"+md5+"','"+belong_group_md5+"','"+belong_group+"','',0,0,0,0)";
    updateOrDeleteOrInsert(cmd,INSERT);
//插测试样例
    for(int i = 0;i<cin_.size();i++){
        String cin ="";
        if(!cin_.get(i).equals("*")){
            cin = cin_.get(i);
        }
        cmd = "insert into titleexamples(`grade`, `cin`, `out_`, `tip`, `maxlongtime`,`iscanread`)values(" +
                "'"+md5+"','"+cin+"','"+out_.get(i)+"','"+add_tip_example.get(i)+"','"+time_limit.get(i)+"','"+is_CanSee.get(i)+"')";
        updateOrDeleteOrInsert(cmd,INSERT);

//        System.out.println(cmd);


    }
    out.println("成功！");
    closeCT();

%>