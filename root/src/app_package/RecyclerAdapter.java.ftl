package ${packageName}.adapters;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import ${packageName}.R;
import ${packageName}.models.${adapterModelClass};
/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class ${adapterClass} extends RecyclerView.Adapter<${adapterClass}.${itemClass}> {

    private Context mContext;
    private ArrayList<${adapterModelClass}> modelList;

    <#if isItemClick>
    private OnItemClickListener mItemClickListener;
    </#if>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList) {
            this.mContext = context;
            this.modelList = modelList;
    }

    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
    }

    @Override
    public ${itemClass} onCreateViewHolder(ViewGroup viewGroup, int viewType) {

        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.${layoutName}, viewGroup, false);

        return new ${itemClass}(view);
    }

    @Override
     public void onBindViewHolder(ViewHolder holder, int position) {

         //Here you can fill your row view

           ${adapterModelClass} model = modelList.get(position);

           if(model != null) {
             holder.itemTxtTitle.setText(model.getTitle());
             holder.itemTxtMessage.setText(model.getMessage());
           }

     }

    @Override
    public int getItemCount() {

        return modelList.size();
    }

    public class ${itemClass} extends RecyclerView.ViewHolder {

        private ImageView imgUser;
        private TextView itemTxtTitle;
        private TextView itemTxtMessage;

        // @BindView(R.id.img_user)
        // ImageView imgUser;
        // @BindView(R.id.item_txt_title)
        // TextView itemTxtTitle;
        // @BindView(R.id.item_txt_message)
        // TextView itemTxtMessage;

        public ${itemClass}(final View itemView) {
            super(itemView);

            // ButterKnife.bind(this, itemView);

            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View v) {

                 mItemClickListener.onItemClick(itemView, getAdapterPosition());
             }
         });

            </#if>


            this.imgUser = (ImageView) itemView.findViewById(R.id.img_user);
            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);
        }
    }

    <#if isItemClick>

        public interface OnItemClickListener {
                void onItemClick(View view, int position);
        }

        public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
                this.mItemClickListener = mItemClickListener;
        }
    </#if>



}
