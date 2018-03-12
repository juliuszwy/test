package cp.pay.mj.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class EmailVo {
	private String id;
	private String title;
	private String body;
	private Integer  enclosure;//附件 0代表没有附件
	private Integer  enclosureStatus;//0代表没有附件 1代表没有领取，2已经领取
	private Integer  awardVoidTime;//邮件失效时间 0代表永久
	private Integer status;//0未读，1已读，2删除
	private String userId;
	private int date;
	
	public EmailVo(){};
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Integer getEnclosure() {
		return enclosure;
	}

	public void setEnclosure(Integer enclosure) {
		this.enclosure = enclosure;
	}

	public Integer getEnclosureStatus() {
		return enclosureStatus;
	}

	public void setEnclosureStatus(Integer enclosureStatus) {
		this.enclosureStatus = enclosureStatus;
	}

	public Integer getAwardVoidTime() {
		return awardVoidTime;
	}

	public void setAwardVoidTime(Integer awardVoidTime) {
		this.awardVoidTime = awardVoidTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int createDate) {
		this.date = createDate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
