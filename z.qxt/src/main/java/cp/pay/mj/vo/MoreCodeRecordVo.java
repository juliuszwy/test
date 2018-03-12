package cp.pay.mj.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MoreCodeRecordVo  {
	private String userId;
	private Date useDate;
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	
	public String getUseDateStr() {
		try{
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sim.format(getUseDate());
		}catch(Exception e){
			return "";
		}
	}


	public Date getUseDate() {
		return useDate;
	}


	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}





	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
