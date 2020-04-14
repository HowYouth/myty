package com.hallth.utils;

import com.hallth.domain.JDBCBean;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class JDBCUtils {

    /**
     * type: 1-查询；2-新增；3-删除；4-修改
     * */

    public JDBCBean doSQL(String sql, int type) {
        Map map = new HashMap();
        JDBCBean bean = new JDBCBean();
        bean.setSuccess(true);
        Connection con = null;
        try {
            //通过驱动管理器获取连接---三个参数：URL, 用户名、密码
            //URL---统一资源定位符---格式如： http://192.168.5.12:9527/index.html
            //                         协议 :// 对方机器的IP地址:端口号/资源名
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/miyuantianya?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
            String userName = "root";
            String password = "hallth";
            con = DriverManager.getConnection(url, userName, password);
            PreparedStatement pstmt = con.prepareStatement(sql);

            if(type == 1){
                ResultSet rs = pstmt.executeQuery(); // 返回结果集 ResultSet
                int total = 0;
                int columnCount = 0;
                List<String> colNamelist = new ArrayList<>();
                List<Object> queryData = new ArrayList<>();
                for (;rs.next();) {
                    StringBuffer sb = new StringBuffer();
                    ResultSetMetaData rsMeta=rs.getMetaData();
                    columnCount=rsMeta.getColumnCount();
                    for (int i=1; i<=columnCount; i++) {
                        if(total==0){
                            colNamelist.add(rsMeta.getColumnLabel(i));
                        }
                        sb.append(rs.getObject(i) + "\t");
                    }
                    total++;
                    queryData.add(sb.toString());
                }
                bean.setColNameList(colNamelist);
                bean.setCount(0);
                bean.setData(queryData);
                bean.setTotal(total);
            } else {
                pstmt.execute();
            }
        } catch (Exception e) {
            e.printStackTrace();
            bean.setSuccess(false);
            bean.setErr_msg(e.getMessage());
        } finally {
             // 关闭连接
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    bean.setSuccess(false);
                    bean.setErr_msg(e.getMessage());
                }
            }
        }
        return bean;
    }
}
