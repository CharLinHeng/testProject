package pojo;
import java.io.Serializable;
public class Data implements Serializable {
    private int x;
    private int userid;
    private int initalId;
    private String content;
    private String time;
    private int type;
    private int statue;

    public int getX() {
        return x;
    }

    public String getTime() {
        return time;
    }

    public int getType() {
        return type;
    }

    public int getInitalId() {
        return initalId;
    }

    public int getStatue() {
        return statue;
    }

    public String getContent() {
        return content;
    }
    public int getUserid() {
        return userid;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setInitalId(int initalId) {
        this.initalId = initalId;
    }

    public void setStatue(int statue) {
        this.statue = statue;
    }

    @Override
    public String toString() {
        return "Data{" +
                "x=" + x +
                ", userid=" + userid +
                ", initalId=" + initalId +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", type=" + type +
                ", statue=" + statue +
                '}';
    }
}