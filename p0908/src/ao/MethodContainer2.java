package ao;
import java.util.*;
import ao.Student;

public class MethodContainer2 {
	
	public ArrayList<Student> getStudentList() {
		ArrayList<Student> list = new ArrayList<Student>();
		String[] name = {
			"���ϱ�","�����","�輺��","���ּ�","��ö��","������","������","������","�ڹ���","�ڿ�ȣ",
			"��â��","����ȣ","������","�����","�ŵ���","�Ź���","�̺���","�����","������","������",
			"������","����ö","������","�����"
		};
		
		String[] gender = {
			"����","����","����","����","����","����","����","����","����","����",
			"����","����","����","����","����","����","����","����","����","����",
			"����","����","����","����"
		};
		
		int[] age = {
			23,25,24,23,26,23,23,24,25,24,
			26,24,23,28,24,24,24,23,25,25,
			23,23,26,25
		};
		
		Student[] student;
		student = new Student[age.length];
		
		for(int i=0; i<age.length; i++) {
			student[i] = new Student();
			student[i].getname = name[i];
			student[i].getgender = gender[i];
			student[i].getage = age[i];
			list.add(student[i]);
		}

		return list;
	}
}








