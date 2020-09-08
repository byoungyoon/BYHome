package ao;
import java.util.*;
import ao.Student;

public class MethodContainer2 {
	
	public ArrayList<Student> getStudentList() {
		ArrayList<Student> list = new ArrayList<Student>();
		String[] name = {
			"강하기","김덕인","김성훈","김주성","김철규","김현욱","김혜린","문지웅","박무림","박용호",
			"박창현","박준호","배형준","백상훈","신동한","신민준","이병윤","장규진","장지운","조광현",
			"조성현","최형철","최현준","한재용"
		};
		
		String[] gender = {
			"남자","남자","남자","남자","남자","남자","여자","남자","남자","남자",
			"남자","남자","남자","남자","남자","남자","남자","남자","남자","남자",
			"날자","남자","남자","남자"
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








