package cnmei.oa.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;

import cnmei.oa.pojo.Employee;

public class ExcelUtils {

	/**
	 * 选择部分数据，并导出
	 * 
	 * @param all
	 *            可导出的全部数据
	 * @param exp
	 *            选择导出的数据类型
	 * @throws IOException
	 */
	public static void exportEm(List<Employee> all, List<String> exp,HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 创建HSSFWorkbook对象(excel的文档对象)
		HSSFWorkbook wkb = new HSSFWorkbook();
		// 建立新的sheet对象（excel的表单）
		HSSFSheet sheet = wkb.createSheet("员工信息");
		/*// 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
		HSSFRow row1 = sheet.createRow(0);
		// 创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
		HSSFCell cell = row1.createCell(0);
		// 设置单元格内容
		cell.setCellValue("员工信息表");
		// 合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, exp.size()-1));*/
		// 在sheet里创建第二行
		HSSFRow row2 = sheet.createRow(0);
		// 创建单元格并设置单元格内容
		for (int i = 0; i < exp.size(); i++) {
			row2.createCell(i).setCellValue(exp.get(i));
		}
		// 在sheet里创建第三行
		for (int i = 0; i < all.size(); i++) {
			HSSFRow row = sheet.createRow(i+1);
			int j =0;
			if(exp.contains("姓名")){
				row.createCell(j++).setCellValue(all.get(i).getName());
			}
			if(exp.contains("性别")){
				row.createCell(j++).setCellValue(all.get(i).getGender());
			}
			if(exp.contains("出生日期")){
				Date birthday = all.get(i).getBirthday();
				if (birthday != null) {
					String bir = DateUtils.dateToString(birthday);
					row.createCell(j).setCellValue(bir);
				}else{
					row.createCell(j).setCellValue("");
				}
				j++;
			}
			if(exp.contains("身份证号")){
				row.createCell(j++).setCellValue(all.get(i).getCard_id());
			}
			if(exp.contains("学历")){
				row.createCell(j++).setCellValue(all.get(i).getEducation());
			}
			if(exp.contains("毕业院校")){
				row.createCell(j++).setCellValue(all.get(i).getSchool());
			}
			if(exp.contains("专业")){
				row.createCell(j++).setCellValue(all.get(i).getMajor());
			}
			if(exp.contains("入职日期")){
				Date day = all.get(i).getEntry_date();
				if (day != null) {
					String entry = DateUtils.dateToString(day);
					row.createCell(j).setCellValue(entry);
				}else{
					row.createCell(j).setCellValue("");
				}
				j++;
			}
			if(exp.contains("部门")){
				row.createCell(j++).setCellValue(all.get(i).getDepartment());
			}
			if(exp.contains("职务")){
				row.createCell(j++).setCellValue(all.get(i).getJob());
			}
			if(exp.contains("职级")){
				row.createCell(j++).setCellValue(all.get(i).getLevel());
			}
			if(exp.contains("新资")){
				row.createCell(j++).setCellValue(all.get(i).getSalary());
			}
			if(exp.contains("手机")){
				row.createCell(j++).setCellValue(all.get(i).getTelephone());
			}
			if(exp.contains("QQ")){
				row.createCell(j++).setCellValue(all.get(i).getQq());
			}
			if(exp.contains("邮箱")){
				row.createCell(j++).setCellValue(all.get(i).getEmail());
			}
			
		}
		
		// 3.将excel文件返回到前台
		String dateStr = DateUtils.getCurrentDate();
		String filename = "员工信息" + dateStr + ".xls";
		String agent = request.getHeader("User-Agent");

		// 一个流两个头
		filename = FileUtils.encodeDownloadFilename(filename, agent);
		// 3.1一个流：Response的输出流
		ServletOutputStream os = response.getOutputStream();
		// 3.2两个头之一：content-type，表示输出文件的类型
		String mimeType = request.getSession().getServletContext().getMimeType(filename);
		response.setContentType(mimeType);
		// 3.3两个头之二：content-disposition，表示以什么方式打开文件
		response.setHeader("content-disposition", "attachment;filename=" + filename);
		// 4.通过workbook对象的write方法写到前台
		wkb.write(os);
	}
}
