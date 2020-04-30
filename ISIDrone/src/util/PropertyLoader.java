package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyLoader {
    private Properties config;

    public PropertyLoader(String propertyName) {
        config = new Properties();

        try {
            InputStream input = Misc.class.getClassLoader().getResourceAsStream(propertyName + ".properties");
            config.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getConfig(String property) {
        return config.getProperty(property);
    }
}