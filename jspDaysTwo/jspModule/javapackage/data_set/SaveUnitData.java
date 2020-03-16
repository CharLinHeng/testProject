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
            //��ʼ��
            this.columnSize = column;
            this.rowSize = rowSize_;
            this.columnArray = columnArray_;
        }
        else{
            System.out.println("�������������");

        }
    }

    public boolean add_element(List<String> data_add) {
        this.datas.add(data_add);
        return true;
    }
    public void showFunc(){
        //չʾ���ݺ���
        System.out.println("-------------------------------------");
        System.out.println("�����ǻ�ȡ������:"+this.rowSize);
        System.out.println("�����ǻ�ȡ������:"+this.columnSize);
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