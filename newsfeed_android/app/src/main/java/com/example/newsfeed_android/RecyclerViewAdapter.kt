package com.example.newsfeed_android
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.annotation.NonNull
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder

private const val VIEW_TYPE_ITEM = 0
private const val VIEW_TYPE_LOADING = 1

class RecyclerViewAdapter constructor(private val itemList: List<String>) :
RecyclerView.Adapter<ViewHolder>() {

   @NonNull
   override fun onCreateViewHolder(
   @NonNull parent: ViewGroup,
   viewType: Int
   ): ViewHolder {
      return if (viewType == VIEW_TYPE_ITEM) {
         val view =
         LayoutInflater.from(parent.context).inflate(R.layout.item_row, parent, false)
         ItemViewHolder(view)
      } else {
         val view = LayoutInflater.from(parent.context)
         .inflate(R.layout.item_loading, parent, false)
         LoadingViewHolder(view)
      }
   }

   override fun onBindViewHolder(@NonNull viewHolder: ViewHolder, position: Int) {
      if (viewHolder is ItemViewHolder) {
         populateItemRows(viewHolder, position)
      }
   }

   override fun getItemViewType(position: Int): Int {
      return if (itemList.size - 1 == position) VIEW_TYPE_LOADING else VIEW_TYPE_ITEM
   }

   override fun getItemCount(): Int {
      return itemList.size
   }

   private fun populateItemRows(viewHolder: ItemViewHolder, position: Int) {
      when(position % 3) {
         0 -> viewHolder.imageItem.setImageResource(R.mipmap.placeholder_image)
         1 -> viewHolder.imageItem.setImageResource(R.mipmap.placeholder_image2)
         2 -> viewHolder.imageItem.setImageResource(R.mipmap.placeholder_image3)
      }
   }

   inner class ItemViewHolder constructor(@NonNull itemView: View) : ViewHolder(itemView) {
      var imageItem: ImageView = itemView.findViewById(R.id.cardViewImage)
   }

   inner class LoadingViewHolder constructor(itemView: View) : ViewHolder(itemView)

}