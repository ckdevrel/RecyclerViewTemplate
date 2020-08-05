package com.takeoffandroid.recyclerviewtemplate.adapter;

import android.content.Context;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

import androidx.recyclerview.widget.LinearLayoutManager;

import com.takeoffandroid.recyclerviewtemplate.AbstractGooglePlay;
import com.takeoffandroid.recyclerviewtemplate.R;

import org.jetbrains.annotations.NotNull;


/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class GooglePlayAdapter extends RecyclerView.Adapter<GooglePlayAdapter.ViewHolder> {

    private Context mContext;
    private ArrayList<AbstractGooglePlay> modelList;

    private OnItemClickListener mItemClickListener;
    private OnMoreClickListener mMoreClickListener;

    public GooglePlayAdapter(Context context, ArrayList<AbstractGooglePlay> modelList) {
        this.mContext = context;
        this.modelList = modelList;
    }

    public void updateList(ArrayList<AbstractGooglePlay> modelList) {
        this.modelList = modelList;
        notifyDataSetChanged();

    }

    @NotNull
    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {

        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_recycler_google_play, viewGroup, false);

        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {

        //Here you can fill your row view

        final AbstractGooglePlay model = getItem(position);


        ArrayList<AbstractGooglePlay> singleSectionItems = model.getSingleItemArrayList();

        holder.itemTxtTitle.setText(model.getTitle());

        SingleItemListAdapter itemListDataAdapter = new SingleItemListAdapter(mContext, singleSectionItems);

        holder.recyclerViewHorizontalList.setHasFixedSize(true);
        holder.recyclerViewHorizontalList.setLayoutManager(new LinearLayoutManager(mContext, LinearLayoutManager.HORIZONTAL, false));
        holder.recyclerViewHorizontalList.setAdapter(itemListDataAdapter);


        holder.recyclerViewHorizontalList.setNestedScrollingEnabled(false);


        itemListDataAdapter.SetOnItemClickListener(new SingleItemListAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int itemPosition, AbstractGooglePlay model) {

                mItemClickListener.onItemClick(view, position, itemPosition, model);

            }
        });

        holder.itemTxtMore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                mMoreClickListener.onMoreClick(view, position, model);


            }
        });


    }

    @Override
    public int getItemCount() {

        return modelList.size();
    }


    private AbstractGooglePlay getItem(int position) {
        return modelList.get(position);
    }

    public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
        this.mItemClickListener = mItemClickListener;
    }

    public void SetOnMoreClickListener(final OnMoreClickListener onMoreClickListener) {
        this.mMoreClickListener = onMoreClickListener;
    }

    public interface OnItemClickListener {
        void onItemClick(View view, int absolutePosition, int relativePosition, AbstractGooglePlay model);
    }


    public interface OnMoreClickListener {
        void onMoreClick(View view, int position, AbstractGooglePlay model);
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        protected RecyclerView recyclerViewHorizontalList;
        protected TextView itemTxtMore;
        private TextView itemTxtTitle;


        public ViewHolder(final View itemView) {
            super(itemView);


            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.recyclerViewHorizontalList = (RecyclerView) itemView.findViewById(R.id.recycler_view_horizontal_list);
            this.itemTxtMore = (TextView) itemView.findViewById(R.id.item_txt_more);


        }
    }


}



