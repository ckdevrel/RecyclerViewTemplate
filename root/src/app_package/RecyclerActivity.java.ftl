package ${packageName}.activities;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import java.util.ArrayList;

<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if isSwipeRefreshLayout>
import android.support.v4.widget.SwipeRefreshLayout;
</#if>
import ${packageName}.R;
import ${packageName}.adapters.${adapterClass};
import ${packageName}.models.${adapterModelClass};
import android.widget.Toast;
import android.os.Handler;


public class ${activityClass} extends AppCompatActivity {

    private RecyclerView recyclerView;

    // @BindView(R.id.recycler_view)
    // RecyclerView recyclerView;

    <#if isSwipeRefreshLayout>
    // @BindView(R.id.swipe_refresh_recycler_list)
    // SwipeRefreshLayout swipeRefreshRecyclerList;

    private SwipeRefreshLayout swipeRefreshRecyclerList;

    </#if>

    private ${adapterClass} mAdapter;

    private LinearLayoutManager mLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutActivityName});

        // ButterKnife.bind(this);

        findViews();

        setAdapter();

        <#if isSwipeRefreshLayout>
        swipeRefreshRecyclerList.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
           @Override
           public void onRefresh() {

              // Do your stuff on refresh
              new Handler().postDelayed(new Runnable() {
               @Override
               public void run() {

                   if(swipeRefreshRecyclerList.isRefreshing())
                       swipeRefreshRecyclerList.setRefreshing(false);
                 }
             },5000);

           }
       });
       </#if>

    }

  private void findViews(){
       recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
       <#if isSwipeRefreshLayout>
       swipeRefreshRecyclerList = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_recycler_list);
        </#if>
    }

    private void setAdapter(){

      <#if features == 'googleplay'>

             ArrayList<${adapterModelClass}> singleItemList = new ArrayList<>();

             singleItemList.add(new AbstractModel("Android", "Hello " + " Android"));
             singleItemList.add(new AbstractModel("Beta", "Hello " + " Beta"));
             singleItemList.add(new AbstractModel("Cupcake", "Hello " + " Cupcake"));
             singleItemList.add(new AbstractModel("Donut", "Hello " + " Donut"));
             singleItemList.add(new AbstractModel("Eclair", "Hello " + " Eclair"));
             singleItemList.add(new AbstractModel("Froyo", "Hello " + " Froyo"));
             singleItemList.add(new AbstractModel("Gingerbread", "Hello " + " Gingerbread"));
             singleItemList.add(new AbstractModel("Honeycomb", "Hello " + " Honeycomb"));
             singleItemList.add(new AbstractModel("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich"));
             singleItemList.add(new AbstractModel("Jelly Bean", "Hello " + " Jelly Bean"));
             singleItemList.add(new AbstractModel("KitKat", "Hello " + " KitKat"));
             singleItemList.add(new AbstractModel("Lollipop", "Hello " + " Lollipop"));
             singleItemList.add(new AbstractModel("Marshmallow", "Hello " + " Marshmallow"));
             singleItemList.add(new AbstractModel("Nougat", "Hello " + " Nougat"));
             singleItemList.add(new AbstractModel("Android O", "Hello " + " Android O"));

             ArrayList<${adapterModelClass}> modelList = new ArrayList<>();

             modelList.add(new AbstractModel("Android", "Hello " + " Android",singleItemList));
             modelList.add(new AbstractModel("Beta", "Hello " + " Beta",singleItemList));
             modelList.add(new AbstractModel("Cupcake", "Hello " + " Cupcake",singleItemList));
             modelList.add(new AbstractModel("Donut", "Hello " + " Donut",singleItemList));
             modelList.add(new AbstractModel("Eclair", "Hello " + " Eclair",singleItemList));
             modelList.add(new AbstractModel("Froyo", "Hello " + " Froyo",singleItemList));
             modelList.add(new AbstractModel("Gingerbread", "Hello " + " Gingerbread",singleItemList));
             modelList.add(new AbstractModel("Honeycomb", "Hello " + " Honeycomb"));
             modelList.add(new AbstractModel("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich",singleItemList));
             modelList.add(new AbstractModel("Jelly Bean", "Hello " + " Jelly Bean",singleItemList));
             modelList.add(new AbstractModel("KitKat", "Hello " + " KitKat",singleItemList));
             modelList.add(new AbstractModel("Lollipop", "Hello " + " Lollipop",singleItemList));
             modelList.add(new AbstractModel("Marshmallow", "Hello " + " Marshmallow",singleItemList));
             modelList.add(new AbstractModel("Nougat", "Hello " + " Nougat",singleItemList));
             modelList.add(new AbstractModel("Android O", "Hello " + " Android O",singleItemList));

        <#else>


          ArrayList<${adapterModelClass}> modelList = new ArrayList<>();

         modelList.add(new ${adapterModelClass}("Android", "Hello "+" Android"));
         modelList.add(new ${adapterModelClass}("Beta","Hello "+" Beta"));
         modelList.add(new ${adapterModelClass}("Cupcake","Hello "+" Cupcake"));
         modelList.add(new ${adapterModelClass}("Donut","Hello "+" Donut"));
         modelList.add(new ${adapterModelClass}("Eclair","Hello "+" Eclair"));
         modelList.add(new ${adapterModelClass}("Froyo","Hello "+" Froyo"));
         modelList.add(new ${adapterModelClass}("Gingerbread","Hello "+" Gingerbread"));
         modelList.add(new ${adapterModelClass}("Honeycomb","Hello "+" Honeycomb"));
         modelList.add(new ${adapterModelClass}("Ice Cream Sandwich","Hello "+" Ice Cream Sandwich"));
         modelList.add(new ${adapterModelClass}("Jelly Bean","Hello "+" Jelly Bean"));
         modelList.add(new ${adapterModelClass}("KitKat","Hello "+" KitKat"));
         modelList.add(new ${adapterModelClass}("Lollipop","Hello "+" Lollipop"));
         modelList.add(new ${adapterModelClass}("Marshmallow","Hello "+" Marshmallow"));
         modelList.add(new ${adapterModelClass}("Nougat","Hello "+" Nougat"));
         modelList.add(new ${adapterModelClass}("Android O","Hello "+" Android O"));

         </#if>

         <#if features == 'header'>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Header");

         <#elseif features == 'footer'>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Footer");

         <#elseif features == 'headerandfooter'>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Header","Footer");

         <#else>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList);
        </#if>
          recyclerView.setHasFixedSize(true);
          // use a linear layout manager
          mLayoutManager = new LinearLayoutManager(this);
          recyclerView.setLayoutManager(mLayoutManager);
          recyclerView.setAdapter(mAdapter);


          <#if isItemClick>
          <#if features != 'googleplay'>
          mAdapter.SetOnItemClickListener(new ${adapterClass}.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int position,${adapterModelClass} model) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey "+model.getTitle(), Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>
          </#if>
          <#if features == 'header'>

          mAdapter.SetOnHeaderClickListener(new ${adapterClass}.OnHeaderClickListener() {
                    @Override
                    public void onHeaderClick(View view,String headerTitle) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey I am a header", Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>

          <#if features == 'footer'>

          mAdapter.SetOnFooterClickListener(new ${adapterClass}.OnFooterClickListener() {
                    @Override
                    public void onFooterClick(View view,String footerTitle) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey I am a footer", Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>

          <#if features == 'headerandfooter'>

          mAdapter.SetOnHeaderClickListener(new ${adapterClass}.OnHeaderClickListener() {
                    @Override
                    public void onHeaderClick(View view,String headerTitle) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey I am a header", Toast.LENGTH_SHORT).show();

                    }
                });

          mAdapter.SetOnFooterClickListener(new ${adapterClass}.OnFooterClickListener() {
                    @Override
                    public void onFooterClick(View view,String footerTitle) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey I am a footer", Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>
          <#if features == 'googleplay'>
          mAdapter.SetOnMoreClickListener(new ${adapterClass}.OnMoreClickListener() {
                    @Override
                    public void onMoreClick(View view, int position,${adapterModelClass} model) {
                        Toast.makeText(${activityClass}.this, "See more " + position, Toast.LENGTH_SHORT).show();

                  }
              });

          mAdapter.SetOnItemClickListener(new ${adapterClass}.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int absolutePosition, int relativePosition,${adapterModelClass} model) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Absolute Pos: "+absolutePosition
                                    + " Relative Pos: "+relativePosition, Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>

    }
}
