<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%--
此文件用来
          编译的。

--%>
<%

    request.setCharacterEncoding("gbk");

//    request.url

    String code = request.getParameter("textcode");//获取代码
    if(code==null){

        return ;
    }
    System.out.println(code);
//    System.out.println(code);
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat();  //很详细的。
    SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
//    System.out.println(today.format(date));
    String type = ".cpp";  //获取文本类型
    //获取当前时间
    String time  = today.format(date);
    //接下来，获取用户名
    String name = "admin";
    String filename = "titleid_"+name;
    String dirpath = name+time;

    //在目录下生成文件夹和文件
    String url = "A:\\SERVER";
    File file=new File(url);



    if(!file.exists())
        file.mkdir();
        //看看今天那逼的文件夹有没有
        String url_ = url+"\\"+dirpath;
        File f_ser_today = new File(url_);
        if(!f_ser_today.exists())
            f_ser_today.mkdir();

        //判断有没有输出文件
            File out_file = new File(url_+"\\out.exe");
            if(out_file.exists()){
                out_file.delete();
            }

        //
        //将代码放进去并生成文件夹
        //创建
     String path=url_+"\\"+filename+type;
        //
    try{//异常处理
        //如果Qiju_Li文件夹下没有Qiju_Li.txt就会创建该文件
        BufferedWriter bw=new BufferedWriter(new FileWriter(path));
        bw.write(code);//在创建好的文件中写入"Hello I/O"
        bw.close();//一定要关闭文件
    }catch(IOException e){
        e.printStackTrace();
        }
     //以后，这里要改成linux代码  ---------------------------------------------------------------------
    //先确定type是什么，然后用什么编译器
    String type_endwith = "gcc";
    //生成www.bat文件
//    cd /d A:\enviornmentedit\DevCpp\MinGW32\bin\ &&gcc A:\SERVER\admin2020-02-09\titleid_admin.cpp -o A:\SERVER\admin2020-02-09\out
    try{//异常处理
        //如果Qiju_Li文件夹下没有Qiju_Li.txt就会创建该文件
        System.out.println("开始拼接...");
        BufferedWriter bw=new BufferedWriter(new FileWriter(url_+"\\www.bat"));
        String myEdit = "A:\\enviornmentedit\\DevCpp\\MinGW32\\bin\\";
        String outEnvir =url_+"\\out";
        String batContent = "cd /d "+myEdit+" && "+type_endwith+" "+path+" -o "+outEnvir;
        bw.write(batContent);//在创建好的文件中写入
        bw.close();//一定要关闭文件
        System.out.println("拼接完毕...");
        /*
         */
    }catch(IOException e){
        e.printStackTrace();
    }
        //将代码写进去后，
     //在该目录生成脚本
    String jiaoben_ = url_+"\\www.bat";
//    String jiaoben =  "A:\\enviornmentedit\\DevCpp\\MinGW32\\bin\\"+type_endwith+" "+path+" -o "+url_+"\\out";//一句话
//    String jiaoben = "ipconfig";
//    gcc A:\SERVER\admin202r0-02-09\\titleid_admin.cpp -o A:\SERVER\admin2020-02-09\\a




    //生成测试文件
    //新建用户-今天

//---------------------------------------------------------------------------------------
    //直接在后台执行
    //先判断运行的线程数量
    System.out.println("ready_work is ok ... now start judge...");
//    System.out.println(Thread.activeCount());
    try {
        /*
        cd A:\\enviornmentedit\\DevCpp\\MinGW32\\bin &&"
                +type_endwith+
                " "+path
         */
//        cmd.exe /k start
        //获取输出结构，编译结果.
        String cmd = ""+jiaoben_;
        Process process = Runtime.getRuntime().exec(cmd);
        if(process != null){
            process.getOutputStream().close();
        }
        InputStream input = process.getInputStream();
        System.out.println("-------------------------------------------");
//        BufferedReader reader=new BufferedReader( new InputStreamReader(input,"utf-8"));
        String szline;
        byte[] data = new byte[256];
        StringBuilder result = new StringBuilder();
        try {
            Process p = Runtime.getRuntime().exec(cmd);
            BufferedReader bf = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            while((line=  bf.readLine())!=null) {
                result.append(line+"\n");
            }
        }catch(Exception e) {
            result.delete(0,result.length()-1).append("无效命令");
        };
//        System.out.println(result.toString());
        process.waitFor();
        process.destroy();
    } catch (Exception e) {
        e.printStackTrace();
    }

    File outfile = new File(url_+"\\out.exe");
    if(!outfile.exists()) {
        out.write("edit make failer");

    }
    else{
        out.write("edit make success!");

    }
    //从数据库获取该题目的所有测试样例


    //cmd 执行命令



    //获取结果


    //报告。



    //

//    System.out.println("已经走到最终");
%>
