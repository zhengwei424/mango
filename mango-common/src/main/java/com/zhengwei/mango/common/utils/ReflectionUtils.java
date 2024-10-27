package com.zhengwei.mango.common.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 反射相关辅助方法
 */
public class ReflectionUtils {

    /**
     * 根据方法名调用指定对象的方法
     *
     * @param object
     * @param method
     * @param args
     * @return
     */
    public static Object invoke(Object object, String method, Object... args) {
        Object result = null;
        Class<?> clazz = object.getClass();
        Method queryMethod = getMethod(clazz, method, args);
        if (queryMethod != null) {
            try {
                result = queryMethod.invoke(object, args);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            }
        } else {
            try {
                throw new NoSuchMethodException(clazz.getName() + " 类中没有找到 " + method + " 方法。");
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    /**
     * 根据方法名和参数对象查找方法
     *
     * @param calzz
     * @param name
     * @param args  参数实例数据
     * @return
     */
    public static Method getMethod(Class<? extends Object> calzz, String name, Object[] args) {
        Method queryMethod = null;
        Method[] methods = calzz.getMethods();
        for (Method method : methods) {
            if (method.getName().equals(name)) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length == args.length) {
                    boolean isSameMethod = true;
                    for (int i = 0; i < parameterTypes.length; i++) {
                        Object arg = args[i];
                        if (arg == null) {
                            arg = "";
                        }
                        if (!parameterTypes[i].equals(args[i].getClass())) {
                            isSameMethod = false;
                        }
                    }
                    if (isSameMethod) {
                        queryMethod = method;
                        break;
                    }
                }
            }

        }
        return queryMethod;
    }
}
