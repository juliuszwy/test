package cp.pay.mj.domain;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "qxt_library")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Library {
		private String imsi;
		private String phone;
		private Integer pro;
		
		@Id
		@Column(name = "imsi",nullable=false,length=50,unique=true)
		public String getImsi() {
			return imsi;
		}

		public void setImsi(String imsi) {
			this.imsi = imsi;
		}

		@Column(name = "phone",nullable=false,length=20)
		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}

		@Column(name = "pro",nullable=false)
		public Integer getPro() {
			return pro;
		}


		public void setPro(Integer pro) {
			this.pro = pro;
		}
		@Override
		public String toString() {
			return ToStringBuilder.reflectionToString(this);
		}
	}
