package cp.pay.mj.exception;


public class ServiceException extends Exception {

	private static final long serialVersionUID = 2169272782791440297L;

	public ServiceException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public ServiceException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public ServiceException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void printStackTrace() {
		if(getCause() != null){
			getCause().printStackTrace();
		}else {
			super.printStackTrace();
		}
	}

	@Override
	public StackTraceElement[] getStackTrace() {
		if(getCause() != null){
			return getCause().getStackTrace();
		}
		return super.getStackTrace();
	}
	
	
	
	
}
