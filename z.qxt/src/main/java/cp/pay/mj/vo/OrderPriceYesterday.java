package cp.pay.mj.vo;

import java.text.DecimalFormat;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class OrderPriceYesterday {
	private Long id;
	private Integer newUser = 0;
	private Integer cards = 0;
	private Integer scaleCards = 0;
	
	private Integer totalPriceYstd=0;
	private Integer scalePrice=0;
	private Double income=0d;
	DecimalFormat    df   = new DecimalFormat("######0.00");   
	public OrderPriceYesterday(){};
	public OrderPriceYesterday(Long totalPriceYstd,Long scalePrice,Long cards,Long scalCards){
		if(totalPriceYstd==null)
			totalPriceYstd = 0l;
		if(scalePrice==null)
			scalePrice = 0l;
		if(cards==null)
			cards = 0l;
		if(scalCards==null)
			scalCards = 0l;
		this.totalPriceYstd =Integer.parseInt(totalPriceYstd+"");
		this.scalePrice =Integer.parseInt(scalePrice+"");
		this.cards = Integer.parseInt(cards+"");
		this.scaleCards = Integer.parseInt(scalCards+"");
	}
	
	public String getIncomeS() {
		return df.format(income);
	}
	
	public  void countIncome(Double scale){
		this.income = scalePrice*scale+totalPriceYstd-scalePrice;
	}
	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTotalPriceYstdS() {
		return df.format(totalPriceYstd);
	}
	
	public Integer getTotalPriceYstd() {
		return totalPriceYstd;
	}

	public void setTotalPriceYstd(Integer totalPriceYstd) {
		this.totalPriceYstd = totalPriceYstd;
	}

	public String getNoScalePriceS() {
		return df.format(totalPriceYstd-scalePrice);
	}
	public String getscalePriceS() {
		return df.format(scalePrice);
	}

	public Integer getNewUser() {
		return newUser;
	}
	public void setNewUser(Integer newUser) {
		this.newUser = newUser;
	}
	public Integer getCards() {
		return cards;
	}
	public void setCards(Integer cards) {
		this.cards = cards;
	}
	public Integer getScaleCards() {
		return scaleCards;
	}
	public Integer getNoScaleCards() {
		return cards-scaleCards;
	}
	public void setScaleCards(Integer scaleCards) {
		this.scaleCards = scaleCards;
	}
	public Integer getScalePrice() {
		return scalePrice;
	}
	public void setScalePrice(Integer scalePrice) {
		this.scalePrice = scalePrice;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	
}
