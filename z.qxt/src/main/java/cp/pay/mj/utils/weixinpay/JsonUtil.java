package cp.pay.mj.utils.weixinpay;

import java.io.IOException;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;

public class JsonUtil {
	 public static ObjectNode warpJsonNodeResponse(JsonNode obj){  
		    ObjectMapper mapper = new ObjectMapper();  
	        ObjectNode objectNode=mapper.createObjectNode();  
	        objectNode.put("code", 1);  
	        objectNode.put("response", obj);  
	        return objectNode;  
	    }  
	      
	    public static JsonNode objectToJsonNode(Object obj){  
	        try {  
	            ObjectMapper objectMapper = new ObjectMapper();  
	            String objJson=objectMapper.writeValueAsString(obj);  
	            JsonNode jsonNode = objectMapper.readTree(objJson);  
	            return jsonNode;  
	        } catch (JsonProcessingException e) {  
	            e.printStackTrace();  
	        } catch (IOException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return null;  
	    }  
}
