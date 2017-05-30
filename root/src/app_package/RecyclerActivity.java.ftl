package ${packageName};

import <#if appCompat?has_content>android.support.v7.app.ActionBarActivity<#else>android.app.Activity</#if>;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import butterknife.BindView;
import butterknife.ButterKnife;
import android.view.View;

<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if isSwipeRefreshLayout>
import android.support.v4.widget.SwipeRefreshLayout;
</#if>


public class ${activityClass} extends ${(appCompat?has_content)?string('ActionBar','')}Activity {

    // private RecyclerView recyclerView;

    @BindView(R.id.recycler_view)
    RecyclerView recyclerView;

    <#if isSwipeRefreshLayout>
    @BindView(R.id.swipe_refresh_recycler_list)
    SwipeRefreshLayout swipeRefreshRecyclerList;

    //private SwipeRefreshLayout swipeRefreshRecyclerList;

    </#if>

    private ${adapterClass} mAdapter;

    private LinearLayoutManager mLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutActivityName});

        ButterKnife.bind(this);

        // findViews();

        setAdapter();

        <#if isSwipeRefreshLayout>
        swipeRefreshRecyclerList.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
           @Override
           public void onRefresh() {

              // Do your stuff on refresh


           }
       });
       </#if>

    }

  //  private void findViews(){
  //      recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
  //      <#if isSwipeRefreshLayout>
  //      swipeRefreshRecyclerList = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_recycler_list);
        </#if>
  //  }

    private void setAdapter(){
          mAdapter = new ${adapterClass}();
          recyclerView.setHasFixedSize(true);
          // use a linear layout manager
          mLayoutManager = new LinearLayoutManager(this);
          recyclerView.setLayoutManager(mLayoutManager);
          recyclerView.setAdapter(mAdapter);

          <#if isItemClick>

          mAdapter.SetOnItemClickListener(new ${adapterClass}.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int position) {

                      //handle item click events here

                    }
                });
          </#if>

    }
}
