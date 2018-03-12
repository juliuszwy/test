package cp.pay.mj.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class AppPayVo {
	private String userId;
	private String activityId;
	private String goodsId;

	public String getUserId() {
		return userId;
	}





	public void setUserId(String userId) {
		this.userId = userId;
	}





	public String getActivityId() {
		return activityId;
	}





	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}





	public String getGoodsId() {
		return goodsId;
	}





	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}





	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
