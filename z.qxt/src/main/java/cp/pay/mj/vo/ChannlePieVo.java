package cp.pay.mj.vo;
import org.apache.commons.lang3.builder.ToStringBuilder;
public class ChannlePieVo {
	private String name;
	private Integer scanCount;
	private Integer activatedCount;
	private Integer activeCount;
	
	public ChannlePieVo(){};
	public ChannlePieVo(String name,Long scanCount,Long activatedCount,Long activeCount){
		this.name = name;
		this.scanCount = Integer.parseInt(scanCount+"");
		this.activatedCount = Integer.parseInt(activatedCount+"");
		this.activeCount = Integer.parseInt(activeCount+"");
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}



	public Integer getScanCount() {
		return scanCount;
	}
	public void setScanCount(Integer scanCount) {
		this.scanCount = scanCount;
	}
	public Integer getActivatedCount() {
		return activatedCount;
	}
	public void setActivatedCount(Integer activatedCount) {
		this.activatedCount = activatedCount;
	}
	public Integer getActiveCount() {
		return activeCount;
	}
	public void setActiveCount(Integer activeCount) {
		this.activeCount = activeCount;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
