package ${packageName};

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

<#if features != 'googleplay'>
<#if layoutmanager == 'grid'>
import android.support.v7.widget.GridLayoutManager;
<#else>
import android.support.v7.widget.LinearLayoutManager;
</#if>
</#if>

<#if features == 'googleplay'>
import android.support.v7.widget.LinearLayoutManager;
</#if>
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import java.util.ArrayList;

<#if isSwipeRefreshLayout>
import android.support.v4.widget.SwipeRefreshLayout;
</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import android.widget.Toast;
import android.os.Handler;
<#if isToolbar>
import android.support.v7.widget.Toolbar;
</#if>


public class ${activityClass} extends AppCompatActivity {

    private RecyclerView recyclerView;

    // @BindView(R.id.recycler_view)
    // RecyclerView recyclerView;

    <#if isToolbar>
    //@BindView(R.id.toolbar)
    //Toolbar toolbar;
    private Toolbar toolbar;
     </#if>

    <#if isSwipeRefreshLayout>
    // @BindView(R.id.swipe_refresh_recycler_list)
    // SwipeRefreshLayout swipeRefreshRecyclerList;

    private SwipeRefreshLayout swipeRefreshRecyclerList;

    </#if>

    private ${adapterClass} mAdapter;
    <#if isPagination>
    private RecyclerViewScrollListener scrollListener;
    </#if>

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutActivityName});

        // ButterKnife.bind(this);
        findViews();
        <#if isToolbar>
        initToolbar("Takeoff Android");
        </#if>
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
    <#if isToolbar>
       toolbar = (Toolbar) findViewById(R.id.toolbar);
     </#if>
       recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
       <#if isSwipeRefreshLayout>
       swipeRefreshRecyclerList = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_recycler_list);
        </#if>
    }

    <#if isToolbar>
    public void initToolbar(String title) {
      setSupportActionBar(toolbar);
      getSupportActionBar().setDisplayHomeAsUpEnabled(true);
      getSupportActionBar().setDisplayShowHomeEnabled(true);
      getSupportActionBar().setTitle(title);
  }
   </#if>


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

          <#if features == 'googleplay'>
          LinearLayoutManager layoutManager = new LinearLayoutManager(this);
          recyclerView.setLayoutManager(layoutManager);
          <#else>
          <#if layoutmanager == 'grid'>

          final GridLayoutManager layoutManager = new GridLayoutManager(${activityClass}.this, 2);
          recyclerView.addItemDecoration(new GridMarginDecoration(${activityClass}.this, 2, 2, 2, 2));
          recyclerView.setLayoutManager(layoutManager);

          <#else>
          // use a linear layout manager
          LinearLayoutManager layoutManager = new LinearLayoutManager(this);
          recyclerView.setLayoutManager(layoutManager);
          </#if>
          <#if isDivider>
          DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(recyclerView.getContext(), layoutManager.getOrientation());
          dividerItemDecoration.setDrawable(ContextCompat.getDrawable(${activityClass}.this, R.drawable.divider_recyclerview));
          recyclerView.addItemDecoration(dividerItemDecoration);
          </#if>
          </#if>

          recyclerView.setAdapter(mAdapter);

          <#if isPagination>

          scrollListener = new RecyclerViewScrollListener() {

              public void onEndOfScrollReached(RecyclerView rv) {

                Toast.makeText(${activityClass}.this,"End of the RecyclerView reached. Do your pagination stuff here", Toast.LENGTH_SHORT).show();

                scrollListener.disableScrollListener();
              }
          };
          recyclerView.addOnScrollListener(scrollListener);
          /*
             Note: The below two methods should be used wisely to handle the pagination enable and disable states based on the use case.
                     1. scrollListener.disableScrollListener(); - Should be called to disable the scroll state.
                     2. scrollListener.enableScrollListener(); - Should be called to enable the scroll state.
          */

          </#if>

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
