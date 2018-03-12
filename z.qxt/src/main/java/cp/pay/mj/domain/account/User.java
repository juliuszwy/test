package cp.pay.mj.domain.account;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import cp.pay.mj.domain.common.UUIDEntity;
@Entity
@Table(name = "acct_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User extends UUIDEntity {
	private static final long serialVersionUID = 1L;
	private String loginName;
	private String password;
	private String salt;
	private String name;
	private String email;
	private String phone;
	private String address;
	private Integer status;
	private Integer property;
	
	private String token;
	private String md5Key;
	private String desKey;
	private Integer apiStatus;
	private Integer smsStatus;
	
	private Date createDate;
	
	@Column(name = "phone", nullable = true,length=20)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "address", nullable = true)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	

	@Column(name = "property", nullable = false)
	public Integer getProperty() {
		return property;
	}

	public void setProperty(Integer property) {
		this.property = property;
	}

	@Column(name = "login_name", nullable = false,unique=true)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(nullable = true)
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Column(nullable = false, length = 255)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable = true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@Column(name="md5_key",nullable = false,length=50)
	public String getMd5Key() {
		return md5Key;
	}

	public void setMd5Key(String md5Key) {
		this.md5Key = md5Key;
	}

	@Column(name="des_key",nullable = false,length=50)
	public String getDesKey() {
		return desKey;
	}

	public void setDesKey(String desKey) {
		this.desKey = desKey;
	}

	@Column(name="api_status",nullable = false)
	public Integer getApiStatus() {
		return apiStatus;
	}

	public void setApiStatus(Integer apiStatus) {
		this.apiStatus = apiStatus;
	}

	@Column(name="sms_status",nullable = false)
	public Integer getSmsStatus() {
		return smsStatus;
	}

	public void setSmsStatus(Integer smsStatus) {
		this.smsStatus = smsStatus;
	}

	

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	@Column(length = 1, nullable = false)
	public Integer getStatus() {
		return status;
	}
	

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	

}
