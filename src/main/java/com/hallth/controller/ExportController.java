package com.hallth.controller;

import com.hallth.domain.*;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import com.hallth.service.impl.MytyDengmiTempServiceImpl;
import com.hallth.utils.ExportUtils;
import org.apache.log4j.Logger;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/export")
public class ExportController {
    private static Logger logger = Logger.getLogger(ExportController.class.getName());
    @Resource
    private MytyDengmiTempServiceImpl dengmiTempService;
    @Resource
    private ExportUtils exportUtils;

    @RequestMapping(value = "/exportSubject", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getSubjectScoreInfo( ExportBean param, HttpServletResponse response, HttpServletRequest request) {
        Map<String, Object> result_map = new HashMap<>();
        try{
            String type = param.getType();
            String fanwei = param.getFanwei();
            String roundNo = param.getRoundNo();
            String tabs = param.getTabs();
            int currentPage = param.getExportCurrentPage();
            int pageSize = param.getExportPageSize();
            logger.info("获取的条件：type={" + type + "}, fanwei={" + fanwei + "}, roundNo={" + roundNo + "}, tabs={" + tabs + "}");

            //1. 获取要导出的数据
            if(fanwei.equals("1")){//全部
                currentPage = 1;
                pageSize = Integer.MAX_VALUE;
            }
            String[] sheetNames = new String[1];
            String[] titles = new String[1];
            Map<String, Object> map = new HashMap<>();
            if(tabs.equals("allSubject")){//全部谜题
                map = dengmiTempService.getDengmiByRoundNo(Integer.parseInt(roundNo), currentPage, pageSize);
                sheetNames[0] = "第" + roundNo + "轮全部谜题";
                titles[0] = "谜苑天涯内赛第" + roundNo + "轮全部谜题";
            } else if(tabs.equals("goodSubject")){//佳谜
                map = dengmiTempService.getGoodSubjectByRoundNo(Integer.parseInt(roundNo));
                sheetNames[0] = "第" + roundNo + "轮佳谜";
                titles[0] = "谜苑天涯内赛第" + roundNo + "轮佳谜";
            } else if(tabs.equals("inputAnswer")){//输入猜射

            } else if(tabs.equals("mySubject")){//我的谜题
                sheetNames[0] = "第" + roundNo + "轮我的谜题";
                titles[0] = "谜苑天涯内赛第" + roundNo + "轮我的谜题";
                MytyUser userInfo = (MytyUser) request.getSession().getAttribute("loginUserInfo");
                String loginUserId = userInfo.getUserId();
                map = dengmiTempService.selectByUserIdPageQuery(Integer.parseInt(roundNo), loginUserId, currentPage, pageSize, false);
                map = formatData(map);
            }
            List<DengmiQueryBean> list = (List<DengmiQueryBean>)map.get("rows");
            String file_suffix = "";
            if(type.equals("0")){ //导出为txt
                String txt_content = getTxtData(list);
                file_suffix = ".txt";
                exportTxt(response, txt_content, titles[0], file_suffix);
            } else if(type.equals("1")){//导出为Excel
                List<String[]> colNameList = getColNames();
                List<List<String[]>> dataLists = getDataList(list);
                XSSFWorkbook wb = exportUtils.writeXlsx07(sheetNames,titles,colNameList,dataLists);
                file_suffix = ".xlsx";
                exportExcel(wb, response, titles[0], file_suffix);
            }
            result_map.put("result", true);
            result_map.put("msg", "导出文件成功！");
        } catch (Exception e){
            result_map.put("result", false);
            result_map.put("msg", "导出失败！"+e.getMessage());
        }
        return result_map;
    }

    private Map formatData(Map map){
        Map returnMap = new HashMap();
        List<MytyDengmiTemp> list1 = (List<MytyDengmiTemp>)map.get("rows");
        List<DengmiQueryBean> list = new ArrayList<>();
        for(MytyDengmiTemp item : list1){
            DengmiQueryBean bean = new DengmiQueryBean();
            bean.setDm_temp_id(item.getDmTempId());
            bean.setDm_mimian(item.getDmMimian());
            bean.setDm_mimu(item.getDmMimu());
            bean.setDm_midi(item.getDmMidi());
            bean.setDm_mimianzhu(item.getDmMimianzhu());
            bean.setDm_midizhu(item.getDmMidizhu());
            bean.setUser_name(item.getDmAuthor());
            list.add(bean);
        }
        returnMap.put("rows", list);
        return  returnMap;
    }

    private void exportExcel(XSSFWorkbook wb, HttpServletResponse response, String fileName, String fileSuffix){
        try {
            setResponseHeader(response, fileName + fileSuffix);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private List<String[]> getColNames() {
        List<String[]> colNameList = new ArrayList<>();
        String[] colNames = {"序号","谜面","谜目/谜格","谜底","注解","作者","评分"};
        colNameList.add(colNames);
        return colNameList;
    }

    private List<List<String[]>> getDataList(List<DengmiQueryBean> list ){
        List<List<String[]>> dataList = new ArrayList<>();
        List<String[]> dataList1 = new ArrayList<String[]>();
        for(int i = 0; i < list.size(); i++){
            String[] rowData = new String[7];
            DengmiQueryBean item = list.get(i);
            rowData[0] = (1+i) + "";
            rowData[1] = item.getDm_mimian();
            rowData[2] = item.getDm_mimu();
            rowData[3] = item.getDm_midi();
            rowData[4] = (item.getDm_mimianzhu() == null ? "" : item.getDm_mimianzhu()) + (item.getDm_midizhu() == null ? "" : item.getDm_midizhu());
            rowData[5] = item.getUser_name();
            rowData[6] = item.getUser_judge() + "";
            dataList1.add(rowData);
        }
        dataList.add(dataList1);
        return dataList;
    }

    private String getTxtData(List<DengmiQueryBean> list) {
        StringBuffer stringBuffer = new StringBuffer();
        for(int i = 0; i < list.size(); i ++){
            DengmiQueryBean item = list.get(i);
            stringBuffer.append((i+1) + ". ");
            stringBuffer.append(item.getDm_mimian())
                    .append("【").append(item.getDm_mimu()).append("】")
                    .append(item.getDm_midi()).append("/").append(item.getUser_name());
            if(item.getDm_mimianzhu() != null || item.getDm_midizhu() != null){
                stringBuffer.append("【注：").append((item.getDm_mimianzhu() == null ? "" : item.getDm_mimianzhu()) + (item.getDm_midizhu() == null ? "" : item.getDm_midizhu())).append("】");
            }
            stringBuffer.append("\n");
        }
        return stringBuffer.toString();
    }

    private void exportTxt(HttpServletResponse response,String text, String fileName, String file_suffix){
        response.setCharacterEncoding("utf-8");
        //设置响应的内容类型
        response.setContentType("text/plain");
        //设置文件的名称和格式
        response.addHeader("Content-Disposition","attachment;filename=" + genAttachmentFileName( fileName, "JSON_FOR_UCC_", file_suffix) );//设置名称格式，没有这个中文名称无法显示
        BufferedOutputStream buff = null;
        ServletOutputStream outStr = null;
        try {
            outStr = response.getOutputStream();
            buff = new BufferedOutputStream(outStr);
            buff.write(text.getBytes("UTF-8"));
            buff.flush();
            buff.close();
        } catch (Exception e) {
            logger.error("导出文件文件出错:{}",e);
        } finally {
            try {
                buff.close();
                outStr.close();
            } catch (Exception e) {
                logger.error("关闭流对象出错 e:{}",e);
            }
        }
    }


    private String genAttachmentFileName(String cnName, String defaultName, String fileType) {
        try {
            cnName = new String(cnName.getBytes("gb2312"), "ISO8859-1");
        } catch (Exception e) {
            cnName = defaultName;
        }
        return cnName + fileType;
    }
}
