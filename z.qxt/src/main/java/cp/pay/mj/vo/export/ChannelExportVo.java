package cp.pay.mj.vo.export;
import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import cp.pay.mj.annotation.ExportExcelAnnotation;

public class ChannelExportVo implements Serializable{
	  private static final long serialVersionUID = -6963337413931228439L;
	@ExportExcelAnnotation(index = 0)
	private String qudaoId;
	@ExportExcelAnnotation(index = 1)
	private Integer scanNum;
	@ExportExcelAnnotation(index = 2)
	private Integer scanActivateNum;
	@ExportExcelAnnotation(index = 3)
	private Date date;

	public String getQudaoId() {
		return qudaoId;
	}

	public void setQudaoId(String qudaoId) {
		this.qudaoId = qudaoId;
	}

	public Integer getScanNum() {
		return scanNum;
	}

	public void setScanNum(Integer scanNum) {
		this.scanNum = scanNum;
	}

	public Integer getScanActivateNum() {
		return scanActivateNum;
	}

	public void setScanActivateNum(Integer scanActivateNum) {
		this.scanActivateNum = scanActivateNum;
	}

	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}






	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
