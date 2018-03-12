package cp.pay.mj.domain.log;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import cp.pay.mj.domain.common.UUIDEntity;
@Entity
@Table(name = "qxt_logs")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class RequestLog extends UUIDEntity {
	private static final long serialVersionUID = 1L;
	private String imsi;
	private String imei;
	private String token;
	private String cpmid;
	private String spCode;
	private String yl;
	
	private String phone;
	private Integer pro=0;
	private String code;
	private Integer status=0;
	private  Long handleTime;
	private Date createDate;
	
	public RequestLog(){
		createDate = new Date();
	}
	
	@Column(name = "phone", nullable = false,length=20)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "imsi", nullable = false,length=50)
	public String getImsi() {
		return imsi;
	}


	public void setImsi(String imsi) {
		imsi = imsi ==null?"":imsi.length()>15?imsi.substring(0,15):imsi;
		this.imsi = imsi;
	}

	@Column(name = "sp_code", nullable = true,length=20)
	public String getSpCode() {
		return spCode;
	}

	public void setSpCode(String spCode) {
		this.spCode = spCode;
	}
	@Column(name = "imei", nullable = true,length=100)
	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		imei = imei ==null?"":imei.length()>30?imei.substring(0,30):imei;
		this.imei = imei;
	}

	@Column(name = "cp_mid", nullable = false,length=50)
	public String getCpmid() {
		return cpmid;
	}

	public void setCpmid(String cpmid) {
		cpmid = cpmid ==null?"":cpmid.length()>15?cpmid.substring(0,15):cpmid;
		this.cpmid = cpmid;
	}

	@Column(name = "yl", nullable = true,length=50)
	public String getYl() {
		
		return yl;
	}

	public void setYl(String yl) {
		yl = yl ==null?"":yl.length()>15?yl.substring(0,15):yl;
		this.yl = yl;
	}

	
	@Column(name = "pro", nullable = false)
	public Integer getPro() {
		return pro;
	}

	public void setPro(Integer pro) {
		this.pro = pro;
	}

	@Column(name = "code", nullable = false,length=20)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return status;
	}

	

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name="create_date",nullable = false,updatable=false)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column(name="token",nullable = false,length=50)
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	
	@Column(name="handle_time",nullable = false)
	public Long getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Long handleTime) {
		this.handleTime = handleTime;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	

}
