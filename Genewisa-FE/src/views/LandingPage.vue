<script setup lang="ts">
import NavigationBar from "../components/LandingPage/NavigationBar.vue";
import BodyContent from "../components/LandingPage/Body.vue";
import LandingSVG from "../components/LandingPage/LandingSVG.vue";
import {onMounted, ref} from 'vue'

// reactive state
let count = ref(0)

// functions that mutate state and trigger updates
function increment() {
    count.value++
}

</script>

<template>
    <div class="LandingPage">

        <NavigationBar></NavigationBar>

        <div class="container flex justify-evenly mx-auto px-36 mt-36">

            <div class="basis-3/5 pl-12">

                <BodyContent></BodyContent>

            </div>

            <div class="basis-2/5">
                <LandingSVG></LandingSVG>
            </div>

        </div>

    </div>
</template>

<style scoped>

</style>
