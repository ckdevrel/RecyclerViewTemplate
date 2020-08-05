package com.takeoffandroid.recyclerviewtemplate.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

import androidx.recyclerview.widget.GridLayoutManager;

import androidx.recyclerview.widget.RecyclerView;

import android.view.MenuItem;
import android.view.View;

import java.util.ArrayList;

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.widget.Toast;
import android.os.Handler;
import androidx.appcompat.widget.Toolbar;

import android.view.Menu;
import androidx.appcompat.widget.SearchView;
import android.app.SearchManager;
import android.widget.EditText;
import android.graphics.Color;
import android.text.InputFilter;
import android.text.Spanned;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import com.takeoffandroid.recyclerviewtemplate.AbstractModel;
import com.takeoffandroid.recyclerviewtemplate.GridMarginDecoration;
import com.takeoffandroid.recyclerviewtemplate.adapter.HeaderFooterGridAdapter;
import com.takeoffandroid.recyclerviewtemplate.R;


public class HeaderFooterGridActivity extends AppCompatActivity {

    private RecyclerView recyclerView;

    private Toolbar toolbar;


    private SwipeRefreshLayout swipeRefreshRecyclerList;
    private FloatingActionButton fab;
    private HeaderFooterGridAdapter mAdapter;

    private ArrayList<AbstractModel> modelList = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_header_footer_grid);

        findViews();
        initToolbar("Takeoff Android");
        setAdapter();

        swipeRefreshRecyclerList.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {

                // Do your stuff on refresh
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {

                        if (swipeRefreshRecyclerList.isRefreshing())
                            swipeRefreshRecyclerList.setRefreshing(false);
                    }
                }, 5000);

            }
        });

    }

    private void findViews() {
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        swipeRefreshRecyclerList = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_recycler_list);
        fab = (FloatingActionButton) findViewById(R.id.fab);
        ;
    }

    public void initToolbar(String title) {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setTitle(title);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        getMenuInflater().inflate(R.menu.menu_search, menu);
        MenuItem searchMenuItem = menu.findItem(R.id.action_search);

        // Retrieve the SearchView and plug it into SearchManager
        SearchView searchView = (SearchView) searchMenuItem.getActionView();

        SearchManager searchManager = (SearchManager) this.getSystemService(SEARCH_SERVICE);
        searchView.setSearchableInfo(searchManager.getSearchableInfo(this.getComponentName()));

        //changing edittext color
        EditText searchEdit = ((EditText) searchView.findViewById(R.id.search_src_text));
        searchEdit.setTextColor(Color.WHITE);
        searchEdit.setHintTextColor(Color.WHITE);
        searchEdit.setBackgroundColor(Color.TRANSPARENT);
        searchEdit.setHint("Search");

        InputFilter[] fArray = new InputFilter[2];
        fArray[0] = new InputFilter.LengthFilter(40);
        fArray[1] = new InputFilter() {
            @Override
            public CharSequence filter(CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {

                for (int i = start; i < end; i++) {

                    if (!Character.isLetterOrDigit(source.charAt(i)))
                        return "";
                }


                return null;


            }
        };
        searchEdit.setFilters(fArray);
        View v = searchView.findViewById(R.id.search_plate);
        v.setBackgroundColor(Color.TRANSPARENT);

        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String s) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String s) {
                ArrayList<AbstractModel> filterList = new ArrayList<AbstractModel>();
                if (s.length() > 0) {
                    for (int i = 0; i < modelList.size(); i++) {
                        if (modelList.get(i).getTitle().toLowerCase().contains(s.toString().toLowerCase())) {
                            filterList.add(modelList.get(i));
                            mAdapter.updateList(filterList);
                        }
                    }

                } else {
                    mAdapter.updateList(modelList);
                }
                return false;
            }
        });


        return true;
    }


    private void setAdapter() {


        modelList.add(new AbstractModel("Android", "Hello " + " Android"));
        modelList.add(new AbstractModel("Beta", "Hello " + " Beta"));
        modelList.add(new AbstractModel("Cupcake", "Hello " + " Cupcake"));
        modelList.add(new AbstractModel("Donut", "Hello " + " Donut"));
        modelList.add(new AbstractModel("Eclair", "Hello " + " Eclair"));
        modelList.add(new AbstractModel("Froyo", "Hello " + " Froyo"));


        mAdapter = new HeaderFooterGridAdapter(HeaderFooterGridActivity.this, modelList, "Header", "Footer");


        recyclerView.setHasFixedSize(true);


        final GridLayoutManager layoutManager = new GridLayoutManager(HeaderFooterGridActivity.this, 2);
        recyclerView.addItemDecoration(new GridMarginDecoration(HeaderFooterGridActivity.this, 2, 2, 2, 2));
        recyclerView.setLayoutManager(layoutManager);


        recyclerView.setAdapter(mAdapter);


        mAdapter.SetOnItemClickListener(new HeaderFooterGridAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position, AbstractModel model) {

                //handle item click events here
                Toast.makeText(HeaderFooterGridActivity.this, "Hey " + model.getTitle(), Toast.LENGTH_SHORT).show();


            }
        });


        mAdapter.SetOnHeaderClickListener(new HeaderFooterGridAdapter.OnHeaderClickListener() {
            @Override
            public void onHeaderClick(View view, String headerTitle) {

                //handle item click events here
                Toast.makeText(HeaderFooterGridActivity.this, "Hey I am a header", Toast.LENGTH_SHORT).show();

            }
        });

        mAdapter.SetOnFooterClickListener(new HeaderFooterGridAdapter.OnFooterClickListener() {
            @Override
            public void onFooterClick(View view, String footerTitle) {

                //handle item click events here
                Toast.makeText(HeaderFooterGridActivity.this, "Hey I am a footer", Toast.LENGTH_SHORT).show();

            }
        });


    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return super.onOptionsItemSelected(item);
        }
        return false;
    }
}
