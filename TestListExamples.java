import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class TestListExamples {

  @Test
  public void testFilter1(){
    StringChecker sc = new StringChecker(){
      public boolean checkString(String s){
        return true;
      }
    };
    
    List<String> input = new ArrayList<String>();
    input.add("hello");
    input.add("bye");
    input.add("test");
    input.add("computer");
    List<String> result = ListExamples.filter(input, sc);
    List<String> expect = new ArrayList<>();
    expect.add("hello");
    expect.add("bye");
    expect.add("test");
    expect.add("computer");

    assertEquals(expect, result);
  }

  @Test
  public void testFilter2(){
    StringChecker sc = new StringChecker(){
      public boolean checkString(String s){
        return true;
      }
    };
    
    List<String> input = new ArrayList<String>();
    List<String> result = ListExamples.filter(input, sc);
    List<String> expect = new ArrayList<>();

    assertEquals(expect, result);
  }

  @Test
  public void testFilter3(){
    StringChecker sc = new StringChecker(){
      public boolean checkString(String s){
        return true;
      }
    };
    
    List<String> input = new ArrayList<String>();
    input.add("hello");
    input.add("bye");
    input.add("hello");
    input.add("bye");
    List<String> result = ListExamples.filter(input, sc);
    List<String> expect = new ArrayList<>();
    expect.add("hello");
    expect.add("bye");
    expect.add("hello");
    expect.add("bye");

    assertEquals(expect, result);
  }

  @Test
  public void testMerge(){
    List<String> list1 = new ArrayList<>();
    List<String> list2 = new ArrayList<>();
    list1.add("a");
    list1.add("c");
    list1.add("e");
    list2.add("b");
    list2.add("d");
    list2.add("f");
    List<String> expected = new ArrayList<>();
    expected.add("a");
    expected.add("b");
    expected.add("c");
    expected.add("d");
    expected.add("e");
    expected.add("f");
    
    assertEquals(expected, ListExamples.merge(list1, list2));
  }

}
