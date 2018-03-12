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
@Table(name = "qxt_logs_count")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class CountLog extends UUIDEntity {
	private static final long serialVersionUID = 1L;
	public CountLog(String token,Long requestCount,Long requestSucCount,Long oneHandCount,Long twoHandErrCount){
		this.token = token;
		this.requestCount = requestCount;
		this.requestSucCount = requestSucCount;
		this.oneHandCount = oneHandCount;
		this.twoHandErrCount = twoHandErrCount;
	}
	private String token;
	
	private Long requestCount;
	private Long requestSucCount;
	
	private Long oneHandCount;
	private Long twoHandErrCount;
	private Date createDate;
	
	public CountLog(){
		createDate = new Date();
	}
	
	@Column(name = "token", nullable = false,length=50)
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	@Column(name = "request_count", nullable = false)
	public Long getRequestCount() {
		return requestCount;
	}

	public void setRequestCount(Long requestCount) {
		this.requestCount = requestCount;
	}

	@Column(name = "two_hand_err_count", nullable = false)
	public Long getTwoHandErrCount() {
		return twoHandErrCount;
	}

	public void setTwoHandErrCount(Long twoHandErrCount) {
		this.twoHandErrCount = twoHandErrCount;
	}

	@Column(name = "request_suc_count", nullable = false)
	public Long getRequestSucCount() {
		return requestSucCount;
	}

	public void setRequestSucCount(Long requestSucCount) {
		this.requestSucCount = requestSucCount;
	}

	@Column(name = "one_hand_count", nullable = false)
	public Long getOneHandCount() {
		return oneHandCount;
	}

	public void setOneHandCount(Long oneHandCount) {
		this.oneHandCount = oneHandCount;
	}

	@Column(name = "create_date", nullable = false,updatable=false)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
