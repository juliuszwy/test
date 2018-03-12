package cp.pay.mj.vo;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class ChartVo {
	
	private String name;
	private Object value;
	private Object value1;
	
	public ChartVo(){};
	public ChartVo(String name,Object value){
		this.name = name;
		this.value = value;
	}

	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Object getValue1() {
		return value1;
	}
	public void setValue1(Object value1) {
		this.value1 = value1;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
