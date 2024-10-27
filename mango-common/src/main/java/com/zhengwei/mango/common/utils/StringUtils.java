package com.zhengwei.mango.common.utils;

/**
 * 字符串工具类
 */
public class StringUtils {

    /**
     * 判空操作
     *
     * @param str
     * @return
     */
    public static boolean isBlank(String str) {
        return str == null || "".equals(str) || "null".equals(str) || "undefined".equals(str);
        // 是否需要trim -> (" ".trim() == "")
        // return str == null || "".equals(str.trim()) || "null".equals(str.trim()) || "undefined".equals(str.trim());
    }

}
