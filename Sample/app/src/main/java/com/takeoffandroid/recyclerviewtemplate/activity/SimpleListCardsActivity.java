package com.takeoffandroid.recyclerviewtemplate.activity;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

import androidx.recyclerview.widget.LinearLayoutManager;

import androidx.recyclerview.widget.RecyclerView;

import android.view.MenuItem;
import android.view.View;

import java.util.ArrayList;

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.takeoffandroid.recyclerviewtemplate.R;
import com.takeoffandroid.recyclerviewtemplate.adapter.SimpleListCardsAdapter;
import com.takeoffandroid.recyclerviewtemplate.AbstractModel;

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


public class SimpleListCardsActivity extends AppCompatActivity {

    private RecyclerView recyclerView;

   
    private Toolbar toolbar;

   

    private SwipeRefreshLayout swipeRefreshRecyclerList;
    private FloatingActionButton fab;
    private SimpleListCardsAdapter mAdapter;

    private ArrayList<AbstractModel> modelList = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_simple_list_cards);

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
        modelList.add(new AbstractModel("Gingerbread", "Hello " + " Gingerbread"));
        modelList.add(new AbstractModel("Honeycomb", "Hello " + " Honeycomb"));
        modelList.add(new AbstractModel("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich"));
        modelList.add(new AbstractModel("Jelly Bean", "Hello " + " Jelly Bean"));
        modelList.add(new AbstractModel("KitKat", "Hello " + " KitKat"));
        modelList.add(new AbstractModel("Lollipop", "Hello " + " Lollipop"));
        modelList.add(new AbstractModel("Marshmallow", "Hello " + " Marshmallow"));
        modelList.add(new AbstractModel("Nougat", "Hello " + " Nougat"));
        modelList.add(new AbstractModel("Android O", "Hello " + " Android O"));


        mAdapter = new SimpleListCardsAdapter(SimpleListCardsActivity.this, modelList);

        recyclerView.setHasFixedSize(true);

        // use a linear layout manager
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        recyclerView.setAdapter(mAdapter);


        mAdapter.SetOnItemClickListener(new SimpleListCardsAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position, AbstractModel model) {

                //handle item click events here
                Toast.makeText(SimpleListCardsActivity.this, "Hey " + model.getTitle(), Toast.LENGTH_SHORT).show();


            }
        });


    }


}
