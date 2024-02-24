package conf;

import java.io.File;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class ConfigInfo {
    static String confPath = "webapps\\Motorpedia\\conf\\conf.xml";

    // Class method
    public static HashMap<String, String> getServerInfo() throws Exception {
        HashMap<String, String> infos = new HashMap<String, String>();

        File xml = new File(confPath);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        Document document = factory.newDocumentBuilder().parse(xml);

        Element root = document.getDocumentElement();

        NodeList childs = root.getChildNodes();
        for (int i = 0; i < childs.getLength(); i++) {
            if (childs.item(i) instanceof Element) {
                Element childElement = (Element) childs.item(i);
                infos.put(childElement.getTagName(), childElement.getTextContent());
            }
        }

        return infos;
    }

}
