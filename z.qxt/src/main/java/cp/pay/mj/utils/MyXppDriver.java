package cp.pay.mj.utils;

import java.io.Writer;

import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.naming.NameCoder;
import com.thoughtworks.xstream.io.xml.Xpp3DomDriver;

public class MyXppDriver extends Xpp3DomDriver {
	public MyXppDriver(NameCoder nameCoder) {
		super(nameCoder);
	}

	public MyXppDriver() {
		super();
	}

	public HierarchicalStreamWriter createWriter(Writer out) {
		return new MyPrettyPrintWriter(out);
	}
	
}