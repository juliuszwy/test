package cp.pay.mj.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;

import cp.pay.mj.utils.Constants;


public class DataGridModel implements java.io.Serializable {
  /**
	 * 
	 */
  private static final long serialVersionUID = 6273941337779149371L;
  private int               limit;                                  // 每页大小
  private String            sort;                                   // 排序字段
  private String            order;                                  // 排序规则
  private int  offset  = 0;                   // 当前行序号
  
  private Integer totalSliders = Constants.DEFAULT_PAGE_SLIDERS;
  public int getCurrentRow() {
//    currentRow = getPage() <= 1 ? 0 : ((getPage() - 1) * limit);
//    return currentRow;
	  return offset;
  }
  
  public void setOffset(int currentRow) {
    this.offset = currentRow;
  }



  public int getPageSize() {
	return limit;
}

public String getSort() {
    return sort;
  }

  public void setSort(String sort) {
    this.sort = sort;
  }

  public String getOrder() {
    return order;
  }

  public void setOrder(String order) {
    this.order = order;
  }
  

public Integer getTotalSliders() {
	return totalSliders;
}

public void setTotalSliders(Integer totalSliders) {
	this.totalSliders = totalSliders;
}


public int getLimit() {
	return limit;
}
public void setLimit(int pageSize) {
	this.limit = pageSize;
}

public int getOffset() {
	return offset;
}

@Override
  public String toString() {
	return ToStringBuilder.reflectionToString(this);
  }

}
