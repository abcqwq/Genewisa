<script setup lang="ts">
import { useGeneralStore } from "../stores/General";
import {onMounted, ref} from 'vue'
import router from "../router";
import axios from "axios";

onMounted(() => {
    const store = useGeneralStore();
    if (store.token == '') {
        router.push('/login');
    }
})


let store = useGeneralStore();

function handleLogout() {
    axios({
        method: "post",
        url: "http://localhost:8000/api/logout",
        params: {
            token: store.token
        }})
        .then(() => {
            store.forgetToken();
            router.push("/");
        })
        .catch((err) => console.log(err));
}

</script>

<template>
    <div class="Dashboard">
        <div class="navbar-dashboard w-full bg-gradient-to-r from-indigo-300 to-indigo-400 py-5 px-12">

            <div class="flex">
                <div class="basis-1/2 font-bold text-white flex items-center text-2xl">
                    genewisa
                </div>

                <div class="basis-1/2 flex justify-end items-center">
                    <button @click="handleLogout" id="logout" class="bg-white py-1 px-8 rounded-full text-indigo-400">
                        Logout
                    </button>
                </div>
            </div>

        </div>




    </div>
</template>

<style scoped>

</style>
