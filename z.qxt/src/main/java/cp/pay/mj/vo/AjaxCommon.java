package cp.pay.mj.vo;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class AjaxCommon {
	private Object id;
	private String name;
	private boolean isSelected = false;
	
	public AjaxCommon(){};
	public AjaxCommon(Object id,String name){
		this.id = id;
		this.name = name;
	}
	public Object getId() {
		return id;
	}

	public void setId(Object id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public boolean isSelected() {
		return isSelected;
	}


	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
