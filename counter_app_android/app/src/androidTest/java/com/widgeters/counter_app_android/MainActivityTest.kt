package com.example.counter_app_android

import org.junit.Test;
import org.junit.runner.RunWith;

import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.matcher.ViewMatchers.withText
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.ext.junit.rules.ActivityScenarioRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.filters.LargeTest
import org.junit.Rule

@RunWith(AndroidJUnit4::class)
@LargeTest
class MainActivityTest {

    @get:Rule
    val activityRule = ActivityScenarioRule(MainActivity::class.java)


    @Test
    fun button_click_increments_count() {

        onView(withId(R.id.countText))
            .check(matches(withText("0")))

        onView(withId(R.id.floatingActionButton))
            .perform(click())

        onView(withId(R.id.countText))
            .check(matches(withText("1")))

    }
}
