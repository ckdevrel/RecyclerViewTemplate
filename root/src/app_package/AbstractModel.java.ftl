package ${packageName};
import java.util.ArrayList;

public class ${adapterModelClass} {

    private String title;

    private String message;

    <#if features == 'googleplay'>
    private ArrayList<${adapterModelClass}> singleItemModelArrayList;
    </#if>

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    <#if features == 'googleplay'>

    public ArrayList<${adapterModelClass}> getSingleItemArrayList() {
         return singleItemModelArrayList;
     }

     public void setSingleItemArrayList(ArrayList<${adapterModelClass}> singleItemModelArrayList) {
         this.singleItemModelArrayList = singleItemModelArrayList;
     }

    </#if>


    public ${adapterModelClass}(String title, String message) {
      this.title = title;
      this.message = message;
    }

    <#if features == 'googleplay'>

    public ${adapterModelClass}(String title,  String message, ArrayList<${adapterModelClass}> singleItemModelArrayList) {
     this.title = title;
     this.message = message;
     this.singleItemModelArrayList = singleItemModelArrayList;
    }

    </#if>

  public ${adapterModelClass}() {

    }
}
