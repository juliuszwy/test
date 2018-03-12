package cp.pay.mj.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class OrderUserVo {
	private Long id;
	private Integer agentId;
	private Double balanceScale;
	
	public OrderUserVo(){};
	public OrderUserVo(Long id,Integer agentId1,Double balanceScale){
		this.id = id;
		this.agentId = agentId1;
		this.balanceScale = balanceScale;
	};

	public Double getBalanceScale() {
		return balanceScale;
	}
	public void setBalanceScale(Double balanceScale) {
		this.balanceScale = balanceScale;
	}
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}


	public Integer getAgentId() {
		return agentId;
	}
	public void setAgentId(Integer agentId1) {
		this.agentId = agentId1;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	
}
