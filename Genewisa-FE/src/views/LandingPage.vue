<script setup lang="ts">
import NavigationBar from "../components/LandingPage/NavigationBar.vue";
import BodyContent from "../components/LandingPage/Body.vue";
import LandingSVG from "../components/LandingPage/LandingSVG.vue";
import { useGeneralStore } from "../stores/General";
import {onMounted, ref} from 'vue'
import router from "../router";

onMounted(() => {
    let store = useGeneralStore();
    console.log(store.token);
    if (store.token !== '') {
        router.push('/dashboard');
    }
})

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
