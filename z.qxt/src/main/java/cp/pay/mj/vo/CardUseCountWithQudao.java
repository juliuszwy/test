package cp.pay.mj.vo;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class CardUseCountWithQudao {
	private String key;
	private Integer val; 	
	public CardUseCountWithQudao(){};
	public CardUseCountWithQudao(int key,Long val){
		this.key = key+"";
		this.val = Integer.parseInt(val+"");
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getVal() {
		return val;
	}
	public void setVal(Integer val) {
		this.val = val;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
