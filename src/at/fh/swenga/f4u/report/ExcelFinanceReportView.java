package at.fh.swenga.f4u.report;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import at.fh.swenga.f4u.model.FinanceModel;

public class ExcelFinanceReportView extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<FinanceModel> finances = (List<FinanceModel>) model.get("finances");

		// create a worksheet
		Sheet sheet = workbook.createSheet("Finance Report");

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);

		// create a new row in the worksheet
		Row headerRow = sheet.createRow(0);

		// create a new cell in the row
		Cell cell0 = headerRow.createCell(0);
		cell0.setCellValue("Date");
		cell0.setCellStyle(style);

		// create a new cell in the row
		Cell cell1 = headerRow.createCell(1);
		cell1.setCellValue("Note");
		cell1.setCellStyle(style);
		
		// create a new cell in the row
		Cell cell2 = headerRow.createCell(2);
		cell2.setCellValue("Category");
		cell2.setCellStyle(style);
		
		// create a new cell in the row
		Cell cell3 = headerRow.createCell(3);
		cell3.setCellValue("Sucategory");
		cell3.setCellStyle(style);

		// create a new cell in the row
		Cell cell4 = headerRow.createCell(4);
		cell4.setCellValue("Incoming");
		cell4.setCellStyle(style);
		
		// create a new cell in the row
		Cell cell5 = headerRow.createCell(5);
		cell5.setCellValue("Outgoing");
		cell5.setCellStyle(style);

		// create multiple rows with finance data
		int rowNum = 1;
		double sumIncoming = 0;
		double sumOutgoing = 0;
		for (FinanceModel finance : finances) {
			// create the row data
			Row row = sheet.createRow(rowNum++);
			if(finance.isPayment() == false)
				sumOutgoing = sumOutgoing + finance.getValue()*-1;
			else sumIncoming = sumIncoming + finance.getValue();
			
			row.createCell(0).setCellValue(finance.getBookDate().toString());
			row.createCell(1).setCellValue(finance.getNotes());
			row.createCell(2).setCellValue(finance.getCategorie().getName());
			if(finance.getSubcategorie()==null)
				row.createCell(3).setCellValue("-");
			else 
				row.createCell(3).setCellValue(finance.getSubcategorie().getName());
			if(finance.isPayment())
				row.createCell(4).setCellValue(finance.getValue());
			else
				row.createCell(5).setCellValue(finance.getValue()*-1);
		}
		Row sumRow = sheet.createRow(rowNum++);
		Row lastRow = sheet.createRow(rowNum+1);
		sumRow.createCell(3).setCellValue("Sum");
		sumRow.createCell(4).setCellValue(sumIncoming);
		sumRow.createCell(5).setCellValue(sumOutgoing);
		lastRow.createCell(3).setCellValue("Total");
		lastRow.createCell(5).setCellValue(sumIncoming+sumOutgoing);
		
		
		// adjust column width to fit the content
		sheet.autoSizeColumn((short) 0);
		sheet.autoSizeColumn((short) 1);
		sheet.autoSizeColumn((short) 2);

	}

}
