package ${packageName};

import <#if appCompat?has_content>android.support.v7.app.ActionBarActivity<#else>android.app.Activity</#if>;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import butterknife.BindView;
import butterknife.ButterKnife;
import android.view.View;

<#if applicationPackage??>import ${applicationPackage}.R;</#if>


public class ${activityClass} extends ${(appCompat?has_content)?string('ActionBar','')}Activity {

    // private RecyclerView recyclerView;

    @BindView(R.id.recycler_view)
    RecyclerView recyclerView;

    private ${adapterClass} mAdapter;

    private LinearLayoutManager mLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutActivityName});

        ButterKnife.bind(this);

        // findViews();

        setAdapter();
    }

    private void findViews(){
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
    }

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
