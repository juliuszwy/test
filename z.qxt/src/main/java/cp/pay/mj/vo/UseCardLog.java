package cp.pay.mj.vo;
import java.io.Serializable;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class UseCardLog implements Serializable{
		private static final long serialVersionUID = 1L;
		private String userId;
		private String weixinId;
		private String agentId;
		private String qudaoId;
		private Long cards;;
		
		private Date date;
		
		
		public UseCardLog() {
		}
		public UseCardLog(String userId,String weixinId,String agentId,String qudaoId,Long cards) {
			this.userId = userId;
			this.cards = cards;
			this.weixinId = weixinId;
			this.qudaoId = qudaoId;
			this.agentId = agentId;
			
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
		public String getWeixinId() {
			return weixinId;
		}
		public void setWeixinId(String weixinId) {
			this.weixinId = weixinId;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public Long getCards() {
			return cards;
		}
		public void setCards(Long cards) {
			this.cards = cards;
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
