<script setup lang="ts">
import {useGeneralStore} from "../stores/General";
import TableAkun from "../components/DashboardPage/DashboardAkun.vue";
import TableReview from "../components/DashboardPage/DashboardReview.vue";
import TableWisata from "../components/DashboardPage/DashboardWisata.vue";

import {onMounted} from 'vue'
import router from "../router";
import axios from "axios";

onMounted(() => {
    const store = useGeneralStore();
    if (store.token == '') {
        router.push('/login');
    }
})


const store = useGeneralStore();

function handleLogout() {
    axios({
        method: "post",
        url: "http://localhost:8000/api/logout",
        params: {
            token: store.token
        }
    })
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


        <div class="mt-12 flex">

            <div class="p-8 w-[326px]">

                <div class="mb-6">
                    <button @click="store.setDashboardSection('akun')" v-bind:class="{'font-bold' : store.dashboardSection === 'akun'}">
                        Akun user
                    </button>
                </div>

                <div class="mb-6" >
                    <button @click="store.setDashboardSection('review')" v-bind:class="{'font-bold' : store.dashboardSection === 'review'}">
                        Review
                    </button>
                </div>

                <div class="mb-6">
                    <button @click="store.setDashboardSection('wisata')" v-bind:class="{'font-bold' : store.dashboardSection === 'wisata'}">
                        Tempat wisata
                    </button>
                </div>

            </div>

            <div class="px-8 py-4 w-full pr-64">
                <div class="flex w-full">

                    <div class="text-4xl font-semibold basis-1/2">
                        Data {{ store.dashboardSection }}
                    </div>

                    <div class="basis-1/2 flex justify-end">
                        <div class="border-b-2 w-fit flex gap-4">
                            <input id="username" type="text" class="input-box">

                            <div class="scale-75 w-fit my-auto">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_13_61)">
                                        <path
                                            d="M8.95995 0.32C7.60017 0.319826 6.25954 0.640605 5.0471 1.25625C3.83466 1.87189 2.78465 2.76501 1.98247 3.86297C1.18028 4.96093 0.648577 6.23273 0.430591 7.57493C0.212605 8.91713 0.314495 10.2918 0.727975 11.5872C1.14146 12.8826 1.85485 14.0621 2.81014 15.0298C3.76542 15.9975 4.93563 16.7261 6.22558 17.1563C7.51553 17.5864 8.8888 17.7061 10.2337 17.5054C11.5786 17.3048 12.8572 16.7895 13.9654 16.0016L18.0204 20.0595L20.0595 18.0205L16.0016 13.9654C16.9202 12.6729 17.4654 11.1526 17.5775 9.57083C17.6897 7.98909 17.3643 6.407 16.6371 4.99786C15.91 3.58872 14.809 2.40687 13.4549 1.58177C12.1007 0.756672 10.5457 0.320144 8.95995 0.32Z"
                                            fill="#AAAAAA" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_13_61">
                                            <rect width="20" height="20" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="mt-12">
                    <TableAkun v-if="store.dashboardSection == 'akun'"/>
                    <TableReview v-else-if="store.dashboardSection == 'review'"/>
                    <TableWisata v-else/>
                </div>

            </div>

        </div>


    </div>
</template>

<style scoped>

</style>
