package cp.pay.mj.vo;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class UserForm {
	private String id;
	private String loginName;
	private String password;
	private String salt;
	private String name;
	private String email;
	private String phone;
	private String address;
	private Integer status;
	private Integer property;
	private Integer apiStatus;
	private Integer smsStatus;
	private String token;
	private String md5Key;
	private String desKey;
	
	private Date createDate;
	
	private SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	public String getCreateDateStr() {
		return sim.format(createDate);
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getProperty() {
		return property;
	}
	public void setProperty(Integer property) {
		this.property = property;
	}
	public Integer getApiStatus() {
		return apiStatus;
	}
	public void setApiStatus(Integer apiStatus) {
		this.apiStatus = apiStatus;
	}
	public Integer getSmsStatus() {
		return smsStatus;
	}
	public void setSmsStatus(Integer smsStatus) {
		this.smsStatus = smsStatus;
	}
	public SimpleDateFormat getSim() {
		return sim;
	}
	public void setSim(SimpleDateFormat sim) {
		this.sim = sim;
	}
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getMd5Key() {
		return md5Key;
	}
	public void setMd5Key(String md5Key) {
		this.md5Key = md5Key;
	}
	public String getDesKey() {
		return desKey;
	}
	public void setDesKey(String desKey) {
		this.desKey = desKey;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	
}
