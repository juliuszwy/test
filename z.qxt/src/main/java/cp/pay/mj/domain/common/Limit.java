package cp.pay.mj.domain.common;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
@Entity
@Table(name = "sdk_limit")
public class Limit extends LongIDEntity {

	private static final long serialVersionUID = 1L;
	private Integer payUnitDay = 0;
	private Integer payUnitMonth = 0;
	private Integer payUnitGlobalDay = 0;
	private Integer payUnitGlobalMonth = 0;
	private Integer status=0;
	private String commonId;
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name="pay_unit_day", nullable=false)
	public Integer getPayUnitDay() {
		return payUnitDay;
	}
	public void setPayUnitDay(Integer payUnitDay) {
		this.payUnitDay = payUnitDay;
	}
	@Column(name="pay_unit_month", nullable=false)
	public Integer getPayUnitMonth() {
		return payUnitMonth;
	}
	public void setPayUnitMonth(Integer payUnitMonth) {
		this.payUnitMonth = payUnitMonth;
	}
	@Column(name="pay_unit_global_day", nullable=false)
	public Integer getPayUnitGlobalDay() {
		return payUnitGlobalDay;
	}
	public void setPayUnitGlobalDay(Integer payUnitGlobalDay) {
		this.payUnitGlobalDay = payUnitGlobalDay;
	}
	@Column(name="pay_unit_global_Month", nullable=false)
	public Integer getPayUnitGlobalMonth() {
		return payUnitGlobalMonth;
	}
	public void setPayUnitGlobalMonth(Integer payUnitGlobalMonth) {
		this.payUnitGlobalMonth = payUnitGlobalMonth;
	}
	
	@Column(name="common_id", nullable=false,length=50)
	public String getCommonId() {
		return commonId;
	}
	public void setCommonId(String commonId) {
		this.commonId = commonId;
	}
	
	
	
}
