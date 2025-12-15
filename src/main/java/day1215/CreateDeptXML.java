package day1215;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import kr.co.sist.emp.DeptDTO;

public class CreateDeptXML {

	public void createXML(List<DeptDTO> list, JspWriter out) throws SQLException, IOException {
		// ***1.XML 문서객체(Document)를 생성
		Document doc = new Document();

		// ***2.최상위 부모노트 생성
		Element deptsNode = new Element("depts");

		// ***3.최상위 부모 노드를 XML 문서 객체에 추가
		doc.addContent(deptsNode);

		// ***4. 자식 노드 중 부모노드 선언
		//데이터가 있을 때만 노드 쓰기 위해 null로 선언
		Element deptNode = null;
		// ***5. 자식 노드 선언
		Element deptnoNode = null;
		Element dnameNode = null;

		for (DeptDTO dDTO : list) {
			deptNode = new Element("dept");//<dept>
			deptnoNode = new Element("deptno");//<deptno>
			dnameNode = new Element("dname");//<dname>
			
			//생성된 자식 노드를 자식노드 중 부모노드에 배치
			deptNode.addContent(deptnoNode);//<dept><deptno/></dept>
			deptNode.addContent(dnameNode);//<dept><deptno/><dname/></dept>
			
			//값 배치 : 정수 말고 문자열만.
			deptnoNode.setText(String.valueOf(dDTO.getDeptno()));
			dnameNode.setText(dDTO.getDname());
			
			
			//최상위 노드에 자식노드 배치
			deptsNode.addContent(deptNode);
		}//end for
		
		//rootNode.addContent(nameNode);

		// ***6.생성된 객체를 출력
		// 이 때 getPrettyFormat을 쓰면 문서가 이쁘게 나온다.
		XMLOutputter xout = new XMLOutputter(Format.getPrettyFormat());// 정렬 이쁘게 나옴
		xout.output(doc, System.out);// 콘솔 출력
		FileOutputStream fos = new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/deptInfo.xml");
		xout.output(doc, fos); // 파일 출력
		xout.output(doc, out); // 웹브라우저 출력 (JSP Writer)

		if (fos != null) {
			fos.close();
		} // end if 파일 출력 종료

	}// createXML

}// class
