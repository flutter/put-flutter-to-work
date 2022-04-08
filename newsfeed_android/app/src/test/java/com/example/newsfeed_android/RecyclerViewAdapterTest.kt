package com.example.newsfeed_android
import org.junit.Assert.assertEquals
import org.junit.Test

class RecyclerViewAdapterTest{

    @Test fun get_item_count_returns_correct() {

        val list : List<String> = listOf("Item", "Item2", "Item3")
        val recycler = RecyclerViewAdapter(list)

        assertEquals(list.size, recycler.itemCount)
    }

    @Test fun item_type_item_when_not_last_item() {

        val list : List<String> = listOf("Item", "Item2", "Item3")
        val recycler = RecyclerViewAdapter(list)

        var result = recycler.getItemViewType(0)
        assertEquals(0, result)

        result = recycler.getItemViewType(1)
        assertEquals(0, result)
    }

    @Test fun item_type_item_when_last_item() {

        val list : List<String> = listOf("Item", "Item2", "Item3")
        val recycler = RecyclerViewAdapter(list)

        val result = recycler.getItemViewType(list.size - 1)

        assertEquals(1, result)
    }
}