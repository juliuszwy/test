package cp.pay.mj.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class WxPayVo {
	private String userId;
	private String agentId;
	private Integer disCount=0;
	private Integer cardCount=0;
	private Integer gcardCount=0;
	private String price;
	private String realPrice;
	private String body;
	
	
	public Integer getGcardCount() {
		return gcardCount;
	}

	public void setGcardCount(Integer gcardCount) {
		this.gcardCount = gcardCount;
	}

	public String getRealPrice() {
		return realPrice;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setRealPrice(String realPrice) {
		this.realPrice = realPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	public Integer getDisCount() {
		return disCount;
	}

	public void setDisCount(Integer disCount) {
		this.disCount = disCount;
	}




	public Integer getCardCount() {
		return cardCount;
	}




	public void setCardCount(Integer cardCount) {
		this.cardCount = cardCount;
	}





	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
