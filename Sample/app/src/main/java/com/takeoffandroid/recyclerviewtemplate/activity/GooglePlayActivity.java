package com.takeoffandroid.recyclerviewtemplate.activity;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;


import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.view.View;

import java.util.ArrayList;

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.widget.Toast;
import android.os.Handler;
import androidx.appcompat.widget.Toolbar;

import android.view.Menu;
import androidx.appcompat.widget.SearchView;
import androidx.core.view.MenuItemCompat;
import android.app.SearchManager;
import android.widget.EditText;
import android.graphics.Color;
import android.text.InputFilter;
import android.text.Spanned;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import com.takeoffandroid.recyclerviewtemplate.AbstractGooglePlay;
import com.takeoffandroid.recyclerviewtemplate.R;
import com.takeoffandroid.recyclerviewtemplate.adapter.GooglePlayAdapter;


public class GooglePlayActivity extends AppCompatActivity {

    private RecyclerView recyclerView;

   
    private Toolbar toolbar;

    

    private SwipeRefreshLayout swipeRefreshRecyclerList;
   
    private FloatingActionButton fab;
    private GooglePlayAdapter mAdapter;

    private ArrayList<AbstractGooglePlay> modelList = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_google_play);

        // ButterKnife.bind(this);
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


        // Retrieve the SearchView and plug it into SearchManager
        final SearchView searchView = (SearchView) MenuItemCompat
                .getActionView(menu.findItem(R.id.action_search));

        SearchManager searchManager = (SearchManager) this.getSystemService(this.SEARCH_SERVICE);
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
                ArrayList<AbstractGooglePlay> filterList = new ArrayList<AbstractGooglePlay>();
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


        ArrayList<AbstractGooglePlay> singleItemList = new ArrayList<>();

        singleItemList.add(new AbstractGooglePlay("Android", "Hello " + " Android"));
        singleItemList.add(new AbstractGooglePlay("Beta", "Hello " + " Beta"));
        singleItemList.add(new AbstractGooglePlay("Cupcake", "Hello " + " Cupcake"));
        singleItemList.add(new AbstractGooglePlay("Donut", "Hello " + " Donut"));
        singleItemList.add(new AbstractGooglePlay("Eclair", "Hello " + " Eclair"));
        singleItemList.add(new AbstractGooglePlay("Froyo", "Hello " + " Froyo"));
        singleItemList.add(new AbstractGooglePlay("Gingerbread", "Hello " + " Gingerbread"));
        singleItemList.add(new AbstractGooglePlay("Honeycomb", "Hello " + " Honeycomb"));
        singleItemList.add(new AbstractGooglePlay("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich"));
        singleItemList.add(new AbstractGooglePlay("Jelly Bean", "Hello " + " Jelly Bean"));
        singleItemList.add(new AbstractGooglePlay("KitKat", "Hello " + " KitKat"));
        singleItemList.add(new AbstractGooglePlay("Lollipop", "Hello " + " Lollipop"));
        singleItemList.add(new AbstractGooglePlay("Marshmallow", "Hello " + " Marshmallow"));
        singleItemList.add(new AbstractGooglePlay("Nougat", "Hello " + " Nougat"));
        singleItemList.add(new AbstractGooglePlay("Android O", "Hello " + " Android O"));


        modelList.add(new AbstractGooglePlay("Android", "Hello " + " Android", singleItemList));
        modelList.add(new AbstractGooglePlay("Beta", "Hello " + " Beta", singleItemList));
        modelList.add(new AbstractGooglePlay("Cupcake", "Hello " + " Cupcake", singleItemList));
        modelList.add(new AbstractGooglePlay("Donut", "Hello " + " Donut", singleItemList));
        modelList.add(new AbstractGooglePlay("Eclair", "Hello " + " Eclair", singleItemList));
        modelList.add(new AbstractGooglePlay("Froyo", "Hello " + " Froyo", singleItemList));
        modelList.add(new AbstractGooglePlay("Gingerbread", "Hello " + " Gingerbread", singleItemList));
        modelList.add(new AbstractGooglePlay("Honeycomb", "Hello " + " Honeycomb", singleItemList));
        modelList.add(new AbstractGooglePlay("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich", singleItemList));
        modelList.add(new AbstractGooglePlay("Jelly Bean", "Hello " + " Jelly Bean", singleItemList));
        modelList.add(new AbstractGooglePlay("KitKat", "Hello " + " KitKat", singleItemList));
        modelList.add(new AbstractGooglePlay("Lollipop", "Hello " + " Lollipop", singleItemList));
        modelList.add(new AbstractGooglePlay("Marshmallow", "Hello " + " Marshmallow", singleItemList));
        modelList.add(new AbstractGooglePlay("Nougat", "Hello " + " Nougat", singleItemList));
        modelList.add(new AbstractGooglePlay("Android O", "Hello " + " Android O", singleItemList));


        mAdapter = new GooglePlayAdapter(GooglePlayActivity.this, modelList);

        recyclerView.setHasFixedSize(true);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);


        recyclerView.setAdapter(mAdapter);


        mAdapter.SetOnMoreClickListener(new GooglePlayAdapter.OnMoreClickListener() {
            @Override
            public void onMoreClick(View view, int position, AbstractGooglePlay model) {
                Toast.makeText(GooglePlayActivity.this, "See more " + position, Toast.LENGTH_SHORT).show();

            }
        });

        mAdapter.SetOnItemClickListener(new GooglePlayAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int absolutePosition, int relativePosition, AbstractGooglePlay model) {

                //handle item click events here
                Toast.makeText(GooglePlayActivity.this, "Absolute Pos: " + absolutePosition
                        + " Relative Pos: " + relativePosition, Toast.LENGTH_SHORT).show();

            }
        });


    }


}
