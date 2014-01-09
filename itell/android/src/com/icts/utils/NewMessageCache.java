package com.icts.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.icts.object.MessageObject;

public class NewMessageCache {
	
	/**
	 * String chua id
	 * Long timestamp
	 */
	private static Map<Long, MessageObject> timestampMessageCache =new HashMap<Long, MessageObject>();
	
	/**
	 * String chua id
	 * Long timestamp
	 */
	private static Map<String, List<MessageObject>> userMessageCache =new HashMap<String, List<MessageObject>>();
	
	/**
	 * Insert message into 2 cache
	 * @param message
	 * @param receiverID
	 */
	public static void addMessageToCache(MessageObject message,String receiverID) {
		String receiver = message.getReceiverID();
		String sender = message.getSenderID();
        if ((message == null)||
        	(receiver==null)||
        	(sender==null)) {
            return;
        }
        
        if (receiver.equalsIgnoreCase(receiverID)){
        	List<MessageObject> list = userMessageCache.get(sender);
        	if (list==null){
        		list = new ArrayList<MessageObject>();
        		list.add(message);
        		userMessageCache.put(sender, list);
        	}
        	else{
        		list.add(message);
        		userMessageCache.remove(sender);
        		userMessageCache.put(sender, list);
        	}
        	
        	if (timestampMessageCache.get(message.getTimestamp())==null){
        		timestampMessageCache.put(message.getTimestamp(), message);
        	}
        }
	}
	
	/**
	 * Clear all data
	 */
	public static void clearCache(){
		if (userMessageCache!=null){
			userMessageCache.clear();
		}
		
		if (timestampMessageCache!=null){
			timestampMessageCache.clear();
		}
	}

	/**
	 * Get Arraylist using sender for chat list screen
	 * @param sender
	 * @return
	 */
	public static ArrayList<MessageObject> getMessage(String sender){
		if (sender==null||userMessageCache==null)
			return null;
		return (ArrayList<MessageObject>) userMessageCache.get(sender);
	}
	
	/**
	 * Remove message from 2 cache
	 * @param message
	 */
	public static void removeMessage(MessageObject message){
		if (message==null){
			return;
		}
		long timestamp = message.getTimestamp();
		if (timestampMessageCache!=null){
			timestampMessageCache.remove(timestamp);
		}
		
		if (userMessageCache==null){
			return;
		}
		String sender = message.getSenderID();
		if (sender==null){
			return;
		}
		if (userMessageCache.containsKey(sender)){
			ArrayList<MessageObject> list =(ArrayList<MessageObject>) userMessageCache.get(sender);
			list.remove(message);
			userMessageCache.remove(sender);
			userMessageCache.put(sender, list);
		}
		
	}
	/**
	 * Get number of new messages of user 
	 * @return number
	 */
	public static int getCountNewMessage(){
		if (timestampMessageCache == null){
			return 0;
		}
		return timestampMessageCache.size();
	}
	
	/**
	 * Get number of new messages of user 
	 * @return number
	 */
	public static int getCountUSer(){
		if (userMessageCache == null){
			return 0;
		}
		return userMessageCache.size();
	}
	
	public static Map<String, List<MessageObject>> getUsers(){
		return userMessageCache;
	}
}
