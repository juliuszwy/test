package cp.pay.mj.utils;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cp.pay.mj.annotation.ExportExcelAnnotation;
/**
 * 
 * 
 * @author ck
 * @version v1.0
 * @param <T>
 *          应用泛型，代表任意一个符合javabean风格的类
 *          注意这里为了简单起见，boolean型的属性xxx的get器方式为getXxx(),而不是isXxx()
 *          byte[]表jpg格式的图片数据
 */
public class ExportExcel<T> {

  public void exportExcel(Collection<T> dataset, OutputStream out) {
    exportExcel("测试POI导出EXCEL文档", null, dataset, out, "yyyy-MM-dd");
  }

  public void exportExcel(String[] headers, Collection<T> dataset, OutputStream out) {
    exportExcel("测试POI导出EXCEL文档", headers, dataset, out, "yyyy-MM-dd");
  }

  public void exportExcel(String[] headers, Collection<T> dataset, OutputStream out, String pattern) {
    exportExcel("测试POI导出EXCEL文档", headers, dataset, out, pattern);
  }

  /**
   * 这是一个通用的方法，利用了JAVA的反射机制，可以将放置在JAVA集合中并且符号一定条件的数据以EXCEL 的形式输出到指定IO设备上
   * 
   * @param title
   *          表格标题名
   * @param headers
   *          表格属性列名数组
   * @param dataset
   *          需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
   *          javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
   * @param out
   *          与输出设备关联的流对象，可以将EXCEL文档导出到本地文件或者网络中
   * @param pattern
   *          如果有时间数据，设定输出格式。默认为"yyy-MM-dd"
   */
  public void exportExcel(String title, String[] headers, Collection<T> dataset, OutputStream out, String pattern) {

    // 声明一个工作薄
    XSSFWorkbook workbook = new XSSFWorkbook();
    // 生成一个表格
    XSSFSheet sheet = workbook.createSheet(title);
    // 设置表格默认列宽度为15个字节
    sheet.setDefaultColumnWidth((short) 15);

    // 生成并设置表格字段名样式
    XSSFCellStyle style = workbook.createCellStyle();
    style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
    style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    // 生成一个字体
    XSSFFont font = workbook.createFont();
    font.setColor(HSSFColor.VIOLET.index);
    font.setFontHeightInPoints((short) 12);
    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
    // 把字体应用到当前的样式
    style.setFont(font);

    // 生成并设置异常数据表格数据样式
    XSSFCellStyle style1 = workbook.createCellStyle();
    style1.setFillForegroundColor(HSSFColor.WHITE.index);
    style1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    // 生成另一个字体
    XSSFFont font1 = workbook.createFont();
    font1.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
    // 把字体应用到当前的样式
    style1.setFont(font1);

    // 生成并设置异常数据表格数据样式
    XSSFCellStyle style2 = workbook.createCellStyle();
    style2.setFillForegroundColor(HSSFColor.RED.index);
    style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    // 生成另一个字体
    XSSFFont font2 = workbook.createFont();
    font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
    // 把字体应用到当前的样式
    style2.setFont(font2);

    // 保存数据字段名
    XSSFRow row = sheet.createRow(0);

    for (short i = 0; i < headers.length; i++) {
      XSSFCell cell = row.createCell(i);
      cell.setCellStyle(style);
      XSSFRichTextString text = new XSSFRichTextString(headers[i]);
      cell.setCellValue(text);
    }

    // 遍历集合数据，产生数据行
    Iterator<T> it = dataset.iterator();
    int index = 0;
    while (it.hasNext()) {
      index++;
      row = sheet.createRow(index);
      T t = (T) it.next();
      // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
      Field[] fields = t.getClass().getDeclaredFields();

      fields = getFieldsBySort(fields);

      int a = fields.length;

      for (short i = 0; i < a; i++) {
        XSSFCell cell = row.createCell(i);
        cell.setCellStyle(style1);

        Field field = fields[i];
        field.setAccessible(true);

        try {

          Object value = field.get(t);
          // 判断值的类型后进行强制类型转换
          String textValue = null;
          if (value instanceof Date) {
            Date date = (Date) value;
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            textValue = sdf.format(date);

            cell.setCellValue(textValue);
          } else if (value instanceof Integer) {
            textValue = value.toString();
            cell.setCellValue(Double.valueOf(textValue));
          } else if (value instanceof BigDecimal) {
            textValue = value.toString();
            cell.setCellValue(Double.valueOf(textValue));
          } else if (value instanceof Double) {

            cell.setCellValue(Double.valueOf(value.toString()));
          } else {
            // 其它数据类型都当作字符串简单处理
            if (value != null) {
              textValue = value.toString();

              if (textValue.contains(".00")) {
                textValue = textValue.substring(0, textValue.length() - 3);
              }

            } else {
              textValue = "";
            }
            cell.setCellValue(textValue);
          }
          if (textValue != null) {
            if (textValue.contains("系统中不存在当前应用") || textValue.contains("系统中不存在当前渠道") || textValue.contains("安装量或者信息费为空") || textValue.contains("数据库已存在该信息")) {
              cell.setCellStyle(style2);
            }
          }

        } catch (SecurityException e) {
          e.printStackTrace();
        } catch (IllegalArgumentException e) {
          e.printStackTrace();
        } catch (IllegalAccessException e) {
          e.printStackTrace();
        } finally {
          // 清理资源
        }
      }

    }
    try {
      workbook.write(out);
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

  @SuppressWarnings("rawtypes")
  class descendComparator implements Comparator {
    public int compare(Object o1, Object o2) {
      Double i1 = (Double) o1;
      Double i2 = (Double) o2;
      return -i1.compareTo(i2);
    }
  }

  private Field[] getFieldsBySort(Field[] fields) {

    List<Field> list = new ArrayList<Field>();
    for (Field field : fields) {
      ExportExcelAnnotation ee = field.getAnnotation(ExportExcelAnnotation.class);
      if (ee != null) {
        list.add(field);
      }

    }
    Field[] fields2 = new Field[list.size()];

    for (int i = 0; i < list.size(); i++) {
      for (int j = 0; j < list.size(); j++) {
        ExportExcelAnnotation ee = list.get(j).getAnnotation(ExportExcelAnnotation.class);
        if (i == ee.index()) {
          fields2[i] = list.get(j);
        }
      }
    }

    return fields2;

  }

  public void exportExcel2003(String title, String[] headers, Collection<T> dataset, OutputStream out, String pattern) {
    // 声明一个工作薄
    HSSFWorkbook  workbook = new HSSFWorkbook ();
    // 生成一个表格
   // HSSFSheet sheet = workbook.createSheet(title);
    // 设置表格默认列宽度为15个字节
    //sheet.setDefaultColumnWidth(15);
    // 生成并设置表格字段名样式
    HSSFCellStyle style = workbook.createCellStyle();
    style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
    style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    // 生成一个字体
    HSSFFont font = workbook.createFont();
    font.setColor(HSSFColor.VIOLET.index);
    font.setFontHeightInPoints((short) 12);
    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
    // 把字体应用到当前的样式
    style.setFont(font);
  
    // 生成并设置异常数据表格数据样式
    HSSFCellStyle style1 = workbook.createCellStyle();
    style1.setFillForegroundColor(HSSFColor.WHITE.index);
    style1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    // 生成另一个字体
    HSSFFont font1 = workbook.createFont();
    font1.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
    // 把字体应用到当前的样式
    style1.setFont(font1);
  
    // 生成并设置异常数据表格数据样式
    HSSFCellStyle style2 = workbook.createCellStyle();
    style2.setFillForegroundColor(HSSFColor.RED.index);
    style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    // 生成另一个字体
    HSSFFont font2 = workbook.createFont();
    font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
    // 把字体应用到当前的样式
    style2.setFont(font2);
    
    HSSFSheet sheet = workbook.createSheet(title);
    sheet.setDefaultColumnWidth(15);
    HSSFRow row = sheet.createRow(0);
    for (int i = 0; i < headers.length; i++) {
      HSSFCell cell = row.createCell(i);
      cell.setCellStyle(style);
      HSSFRichTextString text = new HSSFRichTextString(headers[i]);
      cell.setCellValue(text);
    }
    	Iterator<T> it =dataset.iterator();
	    int index = 0;
	    while (it.hasNext()) {
	      index++;
	      row = sheet.createRow(index);
	      T t = (T) it.next();
	      // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
	      Field[] fields = t.getClass().getDeclaredFields();
	  
	      fields = getFieldsBySort(fields);
	  
	      int a = fields.length;
	  
	      for (int i = 0; i < a; i++) {
	        HSSFCell cell = row.createCell(i);
	        cell.setCellStyle(style1);
	  
	        Field field = fields[i];
	        field.setAccessible(true);
	  
	        try {
	  
	          Object value = field.get(t);
	          // 判断值的类型后进行强制类型转换
	          String textValue = null;
	          if (value instanceof Date) {
	            Date date = (Date) value;
	            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	            textValue = sdf.format(date);
	  
	            cell.setCellValue(textValue);
	          } else if (value instanceof Integer) {
	            textValue = value.toString();
	            cell.setCellValue(Double.valueOf(textValue));
	          } else if (value instanceof BigDecimal) {
	            textValue = value.toString();
	            cell.setCellValue(Double.valueOf(textValue));
	          } else if (value instanceof Double) {
	            cell.setCellValue(Double.valueOf(value.toString()));
	          } else {
	            // 其它数据类型都当作字符串简单处理
	            if (value != null) {
	              textValue = value.toString();
	            /*  if (textValue.contains(".00")) {
	                textValue = textValue.substring(0, textValue.length() - 3);
	              }*/
	            } else {
	              textValue = "";
	            }
	            cell.setCellValue(textValue);
	          }
	          if (textValue != null) {
	            if (textValue.contains("系统中不存在当前应用") || textValue.contains("系统中不存在当前渠道") || textValue.contains("安装量或者信息费为空") || textValue.contains("数据库已存在该信息")) {
	              cell.setCellStyle(style2);
	            }
	          }
	        } catch (SecurityException e) {
	          e.printStackTrace();
	        } catch (IllegalArgumentException e) {
	          e.printStackTrace();
	        } catch (IllegalAccessException e) {
	          e.printStackTrace();
	        } finally {
	          // 清理资源
	        }
	      }
	    }
    try {
      workbook.write(out);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
