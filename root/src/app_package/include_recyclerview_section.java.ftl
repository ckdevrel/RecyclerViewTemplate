import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;


public class ${adapterClass} extends SectionedRecyclerViewAdapter<RecyclerView.ViewHolder> {


    private List<${adapterModelClass}> modelList;

    <#if isItemClick>
    private OnItemClickListener mItemClickListener;

    </#if>

    private Context context;

    public ${adapterClass}(Context context,List<${adapterModelClass}> modelList) {
        this.modelList = modelList;
        this.context = context;

    }

    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
            notifyDataSetChanged();
    }

    @Override
    public int getSectionCount() {
        return modelList.size();
    }

    @Override
    public int getItemCount(int section) {

        return modelList.get(section).getSingleItemArrayList().size();

    }

    @Override
    public void onBindHeaderViewHolder(RecyclerView.ViewHolder holder, int section) {

        String sectionName = modelList.get(section).getTitle();
        SectionViewHolder sectionViewHolder = (SectionViewHolder) holder;
        sectionViewHolder.txtHeader.setText(sectionName);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int section, int relativePosition, int absolutePosition) {

        ArrayList<${adapterModelClass}> itemsInSection = modelList.get(section).getSingleItemArrayList();

        String itemTitle = itemsInSection.get(relativePosition).getTitle();
        String itemMessage = itemsInSection.get(relativePosition).getMessage();

        ${itemClass} itemViewHolder = (${itemClass}) holder;

        itemViewHolder.itemTxtTitle.setText(itemTitle);
        itemViewHolder.itemTxtMessage.setText(itemMessage);


    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, boolean header) {
        if (header)

        {
          View view = LayoutInflater.from(context)
                    .inflate(R.layout.item_recycler_section, parent, false);
            return new SectionViewHolder(view);
        } else {
          View view = LayoutInflater.from(context)
                    .inflate(R.layout.${itemLayoutName}, parent, false);
            return new ${itemClass}(view);
        }

    }


    // SectionViewHolder Class for Sections
    public static class SectionViewHolder extends RecyclerView.ViewHolder {


        final TextView txtHeader;

        public SectionViewHolder(View itemView) {
            super(itemView);

            txtHeader = (TextView) itemView.findViewById(R.id.txt_header);


        }
    }

    // ItemViewHolder Class for Items in each Section
    public static class ${itemClass} extends RecyclerView.ViewHolder {

        final TextView itemTxtTitle;

        final ImageView imgUser;

        final TextView itemTxtMessage;



        public  ${itemClass}(View itemView) {
            super(itemView);
            itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);

            imgUser = (ImageView) itemView.findViewById(R.id.img_user);


        }
    }


    <#if isItemClick>

      public interface OnItemClickListener {
              void onItemClick(View view, int position,${adapterModelClass} model);
      }

      public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
              this.mItemClickListener = mItemClickListener;
      }


    </#if>


}
