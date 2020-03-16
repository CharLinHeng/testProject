package pojo;

import java.io.Serializable;
//序列话接口
public class GetInformations implements Serializable {
    private int x;
    private int userid;
    private int initalId;
    private String content;
    private String time;
    private int type;
    private int statue;

    @Override
    public String toString() {
        return "GetInformations{" +
                "x=" + x +
                ", userid=" + userid +
                ", initalId=" + initalId +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", type=" + type +
                ", statue=" + statue +
                '}';
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setInitalId(int initalId) {
        this.initalId = initalId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setStatue(int statue) {
        this.statue = statue;
    }

    public int getUserid() {
        return userid;
    }

    public int getInitalId() {
        return initalId;
    }

    public String getContent() {
        return content;
    }

    public String getTime() {
        return time;
    }

    public int getType() {
        return type;
    }

    public int getStatue() {
        return statue;
    }

    public int getX() {
        return x;
    }
}
