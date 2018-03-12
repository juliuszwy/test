package cp.pay.mj.vo;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import cp.pay.mj.domain.common.LongIDEntity;

public class UserCountLog implements Serializable{
		private static final long serialVersionUID = 1L;
		private String userId;
		private String weixinId;
		private String agentId;
		private String qudaoId;
	
		private Integer price;//充值金额
		
		private Integer addCardCount;
		private Integer useCardCount;
		
		private Integer invateCount;
		
		private Date date;
		
		
		public UserCountLog() {
		}
		public UserCountLog(String userId,String weixinId) {
			this.userId = userId;
			this.weixinId = weixinId;
		}
		public UserCountLog(String userId,String weixinId,String agentId,String qudaoId,Long price,Long addCardCount) {
			this.userId = userId;
			this.weixinId = weixinId;
			this.price = Integer.parseInt(price+"");
			this.addCardCount = Integer.parseInt(addCardCount+"");
			this.agentId = agentId;
			this.qudaoId = qudaoId;
			
			
		}
		

		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getWeixinId() {
			return weixinId;
		}
		public void setWeixinId(String weixinId) {
			this.weixinId = weixinId;
		}
		public String getAgentId() {
			return agentId;
		}
		public void setAgentId(String agentId) {
			this.agentId = agentId;
		}
		public String getQudaoId() {
			return qudaoId;
		}
		public void setQudaoId(String qudaoId) {
			this.qudaoId = qudaoId;
		}
		public Integer getPrice() {
			return price;
		}
		public void setPrice(Integer price) {
			this.price = price;
		}
		public Integer getAddCardCount() {
			return addCardCount;
		}
		public void setAddCardCount(Integer addCardCount) {
			this.addCardCount = addCardCount;
		}
		public Integer getUseCardCount() {
			return useCardCount;
		}
		public void setUseCardCount(Integer useCardCount) {
			this.useCardCount = useCardCount;
		}
		public Integer getInvateCount() {
			return invateCount;
		}
		public void setInvateCount(Integer invateCount) {
			this.invateCount = invateCount;
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
