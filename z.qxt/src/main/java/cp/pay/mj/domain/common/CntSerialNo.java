package cp.pay.mj.domain.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

//计费点编号累加表	cnt_serialno	cnt
//序号	字段名	类型	长度	isNULL	说明
//1	id	varchar	32	no	主键ID    uuid
//2.	name	varchar	32	no	计费点编号名称   唯一
//3.	prefix	varchar	32	yes	前缀   不能够存在数字
//4	count	int		no	编号计数点  使用后手动+1
//5	suffix	varchar	32	yes	后缀 前后缀联合唯一 
//不能够有数字
//6.	length	int		no	编号总长度
//7.	filler	char		no	长度不够时, 向左填充字符

@Entity
@Table(name = "cnt_serialno", uniqueConstraints= @UniqueConstraint(columnNames={"prefix", "suffix"}))
public class CntSerialNo extends LongIDEntity {

	private static final long serialVersionUID = 1L;

	private String name;
	private String prefix;
	private Integer count;
	private String suffix;
	private Integer length;
	private Character filler;

	@Column(name="name", length=32, nullable=false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="prefix", length=32, nullable=false)
	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	@Column(name="count", nullable=false)
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Column(name="suffix", nullable=false, length=32)
	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	@Column(name="len", nullable=false)
	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	@Column(name="filler", nullable=false)
	public Character getFiller() {
		return filler;
	}

	public void setFiller(Character filler) {
		this.filler = filler;
	}

}
