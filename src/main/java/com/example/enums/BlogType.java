/**
 * 
 */
package com.example.enums;

/**
 * @author Administrator
 *
 */
public enum BlogType {
	BLOG("blog", "博客"),
	QUESTION("question", "提问"),
	ESSAY("essay", "随笔");
	
	private String code;
	private String desc;
    
    private BlogType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static BlogType getCode(String code) {
        for (BlogType type : BlogType.values()) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }
        return null;
    }

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the desc
	 */
	public String getDesc() {
		return desc;
	}

	/**
	 * @param desc the desc to set
	 */
	public void setDesc(String desc) {
		this.desc = desc;
	}

	
}
