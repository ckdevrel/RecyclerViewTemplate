package ${packageName};

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

<#if features != 'googleplay' || features != 'section'>
<#if layoutmanager == 'grid'>
import androidx.recyclerview.widget.GridLayoutManager;
<#else>
import androidx.recyclerview.widget.LinearLayoutManager;
</#if>
</#if>

<#if features == 'googleplay' || features == 'section'>
import androidx.recyclerview.widget.LinearLayoutManager;
</#if>
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.RecyclerView;
import android.view.View;
import java.util.ArrayList;

<#if isSwipeRefreshLayout>
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import android.widget.Toast;
import android.os.Handler;
<#if !isFragment && (isToolbar || isSearch)>
import androidx.appcompat.widget.Toolbar;
</#if>

<#if isSearch>
import android.view.Menu;
import androidx.appcompat.widget.SearchView;
import androidx.core.view.MenuItemCompat;
import android.app.SearchManager;
import android.widget.EditText;
import android.graphics.Color;
import android.text.InputFilter;
import android.text.Spanned;
</#if>

<#if isFAB>
import com.google.android.material.floatingactionbutton.FloatingActionButton;
</#if>


public class ${activityClass} extends AppCompatActivity {

    private RecyclerView recyclerView;

    <#if isToolbar || isSearch>
    private Toolbar toolbar;
     </#if>

    <#if isSwipeRefreshLayout>
    private SwipeRefreshLayout swipeRefreshRecyclerList;
    </#if>
    <#if isFAB>
    private FloatingActionButton fab;
    </#if>
    private ${adapterClass} mAdapter;
    <#if isPagination>
    private RecyclerViewScrollListener scrollListener;
    </#if>

    private ArrayList<${adapterModelClass}> modelList = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutActivityName});

        findViews();
        <#if isToolbar || isSearch>
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
    <#if isToolbar || isSearch>
       toolbar = (Toolbar) findViewById(R.id.toolbar);
     </#if>
       recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
       <#if isSwipeRefreshLayout>
       swipeRefreshRecyclerList = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_recycler_list);
        </#if>
        <#if isFAB>
       fab = (FloatingActionButton) findViewById(R.id.fab);;
        </#if>
    }

    <#if isToolbar || isSearch>
    public void initToolbar(String title) {
      setSupportActionBar(toolbar);
      getSupportActionBar().setDisplayHomeAsUpEnabled(true);
      getSupportActionBar().setDisplayShowHomeEnabled(true);
      getSupportActionBar().setTitle(title);
  }
   </#if>

     <#if isSearch>
     @Override
     public boolean onCreateOptionsMenu(Menu menu) {
         super.onCreateOptionsMenu(menu);

         getMenuInflater().inflate(R.menu.menu_search, menu);


         // Retrieve the SearchView and plug it into SearchManager
         final SearchView searchView = (SearchView) MenuItemCompat
                 .getActionView (menu.findItem (R.id.action_search));

         SearchManager searchManager = (SearchManager) this.getSystemService (this.SEARCH_SERVICE);
         searchView.setSearchableInfo (searchManager.getSearchableInfo (this.getComponentName ()));

         //changing edittext color
         EditText searchEdit = ((EditText)searchView.findViewById(android.support.v7.appcompat.R.id.search_src_text));
         searchEdit.setTextColor(Color.WHITE);
         searchEdit.setHintTextColor (Color.WHITE);
         searchEdit.setBackgroundColor (Color.TRANSPARENT);
         searchEdit.setHint ("Search");

         InputFilter[] fArray = new InputFilter[2];
         fArray[0] = new InputFilter.LengthFilter(40);
         fArray[1] = new InputFilter () {
             @Override
             public CharSequence filter (CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {

                 for (int i = start; i<end ; i++){

                     if(!Character.isLetterOrDigit (source.charAt (i)))
                         return "";
                 }


                 return null;


             }
         };
         searchEdit.setFilters(fArray);
         View v = searchView.findViewById(android.support.v7.appcompat.R.id.search_plate);
         v.setBackgroundColor(Color.TRANSPARENT);

         searchView.setOnQueryTextListener (new SearchView.OnQueryTextListener () {
             @Override
             public boolean onQueryTextSubmit (String s) {
                 return false;
             }

             @Override
             public boolean onQueryTextChange (String s) {
                 ArrayList<${adapterModelClass}> filterList = new ArrayList<${adapterModelClass}> ();
                 if(s.length()>0){
                     for(int i = 0; i < modelList.size();i++){
                         if(modelList.get(i).getTitle ().toLowerCase().contains(s.toString().toLowerCase())){
                             filterList.add(modelList.get(i));
                             mAdapter.updateList(filterList);
                         }
                     }

                 }else{
                     mAdapter.updateList(modelList);
                 }
                 return false;
             }
         });


         return true;
     }
     </#if>



    private void setAdapter(){

      <#if features == 'googleplay' || features == 'section'>

             ArrayList<${adapterModelClass}> singleItemList = new ArrayList<>();

             singleItemList.add(new ${adapterModelClass}("Android", "Hello " + " Android"));
             singleItemList.add(new ${adapterModelClass}("Beta", "Hello " + " Beta"));
             singleItemList.add(new ${adapterModelClass}("Cupcake", "Hello " + " Cupcake"));
             singleItemList.add(new ${adapterModelClass}("Donut", "Hello " + " Donut"));
             singleItemList.add(new ${adapterModelClass}("Eclair", "Hello " + " Eclair"));
             singleItemList.add(new ${adapterModelClass}("Froyo", "Hello " + " Froyo"));
             singleItemList.add(new ${adapterModelClass}("Gingerbread", "Hello " + " Gingerbread"));
             singleItemList.add(new ${adapterModelClass}("Honeycomb", "Hello " + " Honeycomb"));
             singleItemList.add(new ${adapterModelClass}("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich"));
             singleItemList.add(new ${adapterModelClass}("Jelly Bean", "Hello " + " Jelly Bean"));
             singleItemList.add(new ${adapterModelClass}("KitKat", "Hello " + " KitKat"));
             singleItemList.add(new ${adapterModelClass}("Lollipop", "Hello " + " Lollipop"));
             singleItemList.add(new ${adapterModelClass}("Marshmallow", "Hello " + " Marshmallow"));
             singleItemList.add(new ${adapterModelClass}("Nougat", "Hello " + " Nougat"));
             singleItemList.add(new ${adapterModelClass}("Android O", "Hello " + " Android O"));


             modelList.add(new ${adapterModelClass}("Android", "Hello " + " Android",singleItemList));
             modelList.add(new ${adapterModelClass}("Beta", "Hello " + " Beta",singleItemList));
             modelList.add(new ${adapterModelClass}("Cupcake", "Hello " + " Cupcake",singleItemList));
             modelList.add(new ${adapterModelClass}("Donut", "Hello " + " Donut",singleItemList));
             modelList.add(new ${adapterModelClass}("Eclair", "Hello " + " Eclair",singleItemList));
             modelList.add(new ${adapterModelClass}("Froyo", "Hello " + " Froyo",singleItemList));
             modelList.add(new ${adapterModelClass}("Gingerbread", "Hello " + " Gingerbread",singleItemList));
             modelList.add(new ${adapterModelClass}("Honeycomb", "Hello " + " Honeycomb",singleItemList));
             modelList.add(new ${adapterModelClass}("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich",singleItemList));
             modelList.add(new ${adapterModelClass}("Jelly Bean", "Hello " + " Jelly Bean",singleItemList));
             modelList.add(new ${adapterModelClass}("KitKat", "Hello " + " KitKat",singleItemList));
             modelList.add(new ${adapterModelClass}("Lollipop", "Hello " + " Lollipop",singleItemList));
             modelList.add(new ${adapterModelClass}("Marshmallow", "Hello " + " Marshmallow",singleItemList));
             modelList.add(new ${adapterModelClass}("Nougat", "Hello " + " Nougat",singleItemList));
             modelList.add(new ${adapterModelClass}("Android O", "Hello " + " Android O",singleItemList));

        <#else>


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

         <#if isHeader && isFooter>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Header","Footer");


         <#elseif isHeader>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Header");

         <#elseif isFooter>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList,"Footer");

         <#else>
         mAdapter = new ${adapterClass}(${activityClass}.this, modelList);
        </#if>

          recyclerView.setHasFixedSize(true);

          <#if features == 'googleplay' || features == 'section'>
          LinearLayoutManager layoutManager = new LinearLayoutManager(this);
          recyclerView.setLayoutManager(layoutManager);

          <#else>
          <#if layoutmanager == 'grid'>

          final GridLayoutManager layoutManager = new GridLayoutManager(${activityClass}.this, 2);
          <#if features == 'banner'>
          recyclerView.addItemDecoration(new GridMarginDecoration(${activityClass}.this, 2, 2, 2, 2));
          </#if>
          recyclerView.setLayoutManager(layoutManager);

          <#else>
          // use a linear layout manager

          <#if layoutorientation == 'horizontal'>
          LinearLayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
          <#else>
          LinearLayoutManager layoutManager = new LinearLayoutManager(this);
          </#if>

          recyclerView.setLayoutManager(layoutManager);
          </#if>

          </#if>

          <#if features != 'googleplay' && isDivider>
          DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(recyclerView.getContext(), layoutManager.getOrientation());
          dividerItemDecoration.setDrawable(ContextCompat.getDrawable(${activityClass}.this, R.drawable.divider_recyclerview));
          recyclerView.addItemDecoration(dividerItemDecoration);
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

          <#if features == 'checkbox' || features == 'toggle'>

          mAdapter.SetOnCheckedListener(new ${adapterClass}.OnCheckedListener() {
            @Override
            public void onChecked(View view, boolean isChecked, int position, ${adapterModelClass} model) {

                Toast.makeText(${activityClass}.this, (isChecked ? "Checked " : "Unchecked ") + model.getTitle(), Toast.LENGTH_SHORT).show();


            }
        });

          </#if>

          </#if>
          </#if>

          <#if isHeader && isFooter>

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


          <#elseif isHeader>

          mAdapter.SetOnHeaderClickListener(new ${adapterClass}.OnHeaderClickListener() {
                    @Override
                    public void onHeaderClick(View view,String headerTitle) {

                      //handle item click events here
                      Toast.makeText(${activityClass}.this,"Hey I am a header", Toast.LENGTH_SHORT).show();

                    }
                });


          <#elseif isFooter>

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
