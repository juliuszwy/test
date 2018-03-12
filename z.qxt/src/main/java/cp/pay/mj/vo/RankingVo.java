package cp.pay.mj.vo;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class RankingVo {
	private String userId;
	private Long price;
	public RankingVo(){};
	public RankingVo(String userId,Long price){
		this.userId = userId;
		this.price = price;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
