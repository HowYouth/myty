package com.hallth.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

@Service
public class ExportUtils {
    /**
     * 导出为07版Excel，即后缀名为 .xlsx
     * @author hys
     * @time 2016-03-02 10:53:34
     * @param sheetNames	Excel的sheet页名字
     * @param titles	每个sheet页的表格名字
     * @param colNameList	列名
     * @param dataLists	导出的数据
     * @return
     * */
    public XSSFWorkbook writeXlsx07(String[] sheetNames, String[] titles, List<String[]> colNameList,
                                     List<List<String[]>> dataLists){
        // 创建HSSFWorkbook对象(excel的文档对象)
        XSSFWorkbook wb = new XSSFWorkbook();
        // 建立新的sheet对象（excel的表单）
        for(int i = 0; i < sheetNames.length; i ++){
            XSSFCellStyle cellStyle1 = setCell(wb);		//表名的边框和对齐方式
            XSSFCellStyle cellStyle2 = setCell(wb);		//列名的边框和对齐方式
            XSSFCellStyle cellStyle3 = setCell(wb);		//数据的边框和对齐方式
            XSSFFont font1 = setFont(wb);				//标题的字体设置
            XSSFFont font2 = setFont(wb);				//列名的字体设置
            XSSFFont font3 = setFont(wb);				//数据的字体设置

            //sheet页名字
            XSSFSheet sheet = wb.createSheet(sheetNames[i]);
            String title = titles[i];
            String[] colNames = colNameList.get(i);
            List<String[]> dataList = dataLists.get(i);
            // 设置缺省列宽8.5,行高为设置的30
//                sheet.setDefaultRowHeightInPoints(30);

            // 合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, colNames.length-1));
            // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
            XSSFRow row1 = sheet.createRow(0);
//                row1.setHeightInPoints(50);					//设定行的高度,会使设置的默认行高失效（其他行受到了影响，其他行也设置该属性)
            // 创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
            XSSFCell cell = row1.createCell(0);
            // 设置标题单元格
            cell.setCellValue(title);								//表名
            font1.setFontHeightInPoints((short)20);					//设置标题的字号
//                font1.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);			//设置标题加粗
            cellStyle1.setFont(font1);								//保存字体设置
//                cellStyle1.setAlignment(XSSFCellStyle.ALIGN_CENTER);	//设置水平方向对齐方式
            cell.setCellStyle(cellStyle1);							//保存样式设置

            // 在sheet里创建第二行，用于写入列名（表头）
            XSSFRow row2 = sheet.createRow(1);
            for(int j = 0; j < colNames.length; j ++){
                // 设置指定列的列宽，256 * 50这种写法是因为width参数单位是单个字符的256分之一
                if(j == 2){
                    sheet.setColumnWidth(j, 256 * 15);// 设置第一列的宽度为15
                } else if(j == 3) {
                    sheet.setColumnWidth(j, 256 * 15);// 设置第一列的宽度为15
                } else if(j == 1){
                    sheet.setColumnWidth(j, 256 * 40);// 设置第一列的宽度为15
                } else if(j == 4){
                    sheet.setColumnWidth(j, 256 * 30);// 设置第一列的宽度为15
                } else if(j == 5){
                    sheet.setColumnWidth(j, 256 * 10);// 设置第一列的宽度为15
                } else if(j == 6){
                    sheet.setColumnWidth(j, 256 * 7);// 设置第一列的宽度为15
                } else if(j == 0){
                    sheet.setColumnWidth(j, 256 * 7);// 设置第一列的宽度为15
                }
                // 创建单元格并设置列名单元格内容
                XSSFCell colCell = row2.createCell(j);
                colCell.setCellValue(colNames[j]);				//列名
                font2.setFontHeightInPoints((short) 15);		//设置列名字号
//                    font2.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);	//设置列名加粗
                cellStyle2.setFont(font2);						//保存字体设置
//                    cellStyle2.setAlignment(XSSFCellStyle.ALIGN_CENTER);					//设置水平方向对齐方式
                cellStyle2.setFillForegroundColor(IndexedColors.AQUA.getIndex());		//设置单元格背景颜色
//                    cellStyle2.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);				//设置背景填充方式
                colCell.setCellStyle(cellStyle2);				//保存样式设置
            }
            //开始写入数据
            for(int k = 0; k < dataList.size(); k ++){
                XSSFRow row3 = sheet.createRow(k+2);
                String[] data = dataList.get(k);
                for(int l = 0; l < data.length; l ++){
                    XSSFCell dataCell = row3.createCell(l);
                    dataCell.setCellValue(data[l]);						//单元格内容，写入数据
//                        font3.setBoldweight(XSSFFont.BOLDWEIGHT_NORMAL);	//设置单元格不加粗
                    font3.setFontHeightInPoints((short) 10);			//设置单元格字号
                    cellStyle3.setFont(font3);							//保存字体设置
//                        cellStyle3.setAlignment(XSSFCellStyle.ALIGN_LEFT);	//设置水平方向对齐方式
                    dataCell.setCellStyle(cellStyle3);					//保存样式设置
                }
            }
        }
        return wb;
    }

    /**
     * 设置单元格
     * */
    private static XSSFCellStyle setCell(XSSFWorkbook wb){
        XSSFCellStyle cellStyle = wb.createCellStyle();
//		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);					//设置字体的水平方向对齐方式
//        cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);		//设置字体的垂直方向对齐方式
//        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);				//设置底部边框为实线
        cellStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());		//设置底部边框颜色
//        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);					//设置左部边框为实线
        cellStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());		//设置左部边框颜色
//        cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);				//设置右部边框为实线
        cellStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());		//设置右部边框颜色
//        cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);					//设置顶部边框为实线
        cellStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());		//设置顶部边框颜色
        cellStyle.setWrapText(true);										//设置自动换行
        return cellStyle;
    }

    /**
     * 设置字体颜色
     * */
    private static XSSFFont setFont(XSSFWorkbook wb){
        XSSFFont font = wb.createFont();
        font.setColor(IndexedColors.BLACK.getIndex());		//设置字体颜色
        font.setFontName("宋体");							//设置字体
        return font;
    }
}
