package day1215;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * Parser를 사용한 XML 생성
 */
public class CreateJDOMXML {

	public static void main(String[] args) {
		//***1.XML 문서객체(Document)를 생성
		Document doc = new Document();
		//이걸로 <?xml version="1.0" encoding="UTF-8"?>이 만들어진다.
		
		//***2.최상위 부모노트 생성
		Element rootNode = new Element("msgs");
		
		//***3.최상위 부모 노드를 XML 문서 객체에 추가
		doc.addContent(rootNode);
		
		//***4. 자식 노드 생성
		Element msgNode = new Element("msg");
		Element nameNode = new Element("name");
		
		
		
		//***5. 자식 노드에 문자열 (String node) 추가
		msgNode.setText("오늘은 월요일, 월요일....!!");
		nameNode.setText("I am IronMan");
		
		
		//자식노드를 부모노드에 추가
		rootNode.addContent(msgNode);
		rootNode.addContent(nameNode);
		
		//***6.생성된 객체를 출력
		//이 때 getPrettyFormat을 쓰면 문서가 이쁘게 나온다.
	//	XMLOutputter xout = new XMLOutputter(Format.getCompactFormat());//한줄로 나옴
	//	XMLOutputter xout = new XMLOutputter(Format.getRawFormat());//얘도 한줄로 나옴
		XMLOutputter xout = new XMLOutputter(Format.getPrettyFormat());//정렬 이쁘게 나옴
		
		/*
		 * System.out : Console로 출력
		 * FileOutputStream : 파일로 출력
		 * 
		 */
		try {
			xout.output(doc,System.out);
			FileOutputStream fos = new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/msg.xml");
			xout.output(doc, fos); //msg.xml 파일이 생성됨.
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//main

}//class
