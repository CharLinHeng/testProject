package data_set;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class SaveUnitData {
    public int columnSize;
    public int rowSize;
    public List<String> columnArray;
    public ArrayList<List<String>> datas;
    public int currIndex = 0;

    //    Array
    public SaveUnitData(int column, int rowSize_, List<String> columnArray_) {
//        System.out.println(rowSize_+" ???"+column);
        datas  = new ArrayList();
        if (rowSize_>=0&&column>=0) {
            //初始化
            this.columnSize = column;
            this.rowSize = rowSize_;
            this.columnArray = columnArray_;
        }
        else{
            System.out.println("传入参数不符合");

        }
    }

    public boolean add_element(List<String> data_add) {
        this.datas.add(data_add);
        return true;
    }
    public void showFunc(){
        //展示数据函数
        System.out.println("-------------------------------------");
        System.out.println("下面是获取的行数:"+this.rowSize);
        System.out.println("下面是获取的列数:"+this.columnSize);
        for(int i = 0;i<columnSize;i++){
            System.out.print("   "+columnArray.get(i));

        }
        System.out.println();
        for(int i = 0;i<rowSize;i++){
            for(int j = 0;j<datas.get(i).size();j++)
                System.out.print("   "+datas.get(i).get(j));
            System.out.println();
        }


    }
}