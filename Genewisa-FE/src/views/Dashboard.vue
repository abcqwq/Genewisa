<script setup lang="ts">
import {useGeneralStore} from "../stores/General";
import TableAkun from "../components/DashboardPage/DashboardAkun.vue";
import TableReview from "../components/DashboardPage/DashboardReview.vue";
import TableWisata from "../components/DashboardPage/DashboardWisata.vue";
import DeleteModal from "../components/DashboardPage/DeleteModal.vue";
import LogoutModal from "../components/DashboardPage/LogoutModal.vue";

import {onMounted, onUnmounted, ref, watch} from 'vue'
import router from "../router";
import axios from "axios";

const store = useGeneralStore();
const keywordTemp = ref('');

watch(() => store.isLogoutting, () => {
    if (store.isLogoutting === 2) {
        handleLogout();
    }
});

onMounted(() => {
    const store = useGeneralStore();
    if (store.token == '') {
        router.push('/login');
    }
});

onUnmounted(() => {
    store.isLogoutting = 0;
});

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
        .catch((err) => {
            console.log(err);
            store.forgetToken();
        });
}

</script>

<template>

    <DeleteModal v-if="store.isDeleting == 1" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2" />
    <LogoutModal v-if="store.isLogoutting == 1" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2" />
    <div class="Dashboard">
        <div class="navbar-dashboard w-full bg-gradient-to-r from-indigo-300 to-indigo-400 py-5 px-12">

            <div class="flex">
                <div class="basis-1/2 font-bold text-white flex items-center text-2xl">
                    genewisa
                </div>

                <div class="basis-1/2 flex justify-end items-center">
                    <button @click="store.isLogoutting = 1" id="logout" class="bg-white py-1 px-8 rounded-full text-indigo-400">
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

            <div class="py-4 w-full pr-64">
                <div class="flex w-full">

                    <div class="text-4xl font-semibold basis-1/2">
                        Data {{ store.dashboardSection }}
                    </div>

                    <div class="basis-1/2 flex justify-end">
                        <div class="border-b-2 w-fit flex gap-4">

                            <input type="text" class="input-box" v-model="keywordTemp">

                            <div class="scale-75 w-fit my-auto">
                                <button @click="store.keywordNow = keywordTemp">
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
                                </button>
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

        <div class="flex justify-end scale-75 gap-3 mb-48 mt-8">
            <button @click="store.pageNow--">
                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M28.42 4.18599C28.5695 4.07953 28.7455 4.01628 28.9286 4.00317C29.1116 3.99005 29.2948 4.02758 29.458 4.11165C29.6212 4.19572 29.758 4.32307 29.8536 4.47976C29.9493 4.63646 29.9999 4.81644 30 4.99999V25C29.9999 25.1835 29.9493 25.3635 29.8536 25.5202C29.758 25.6769 29.6212 25.8043 29.458 25.8883C29.2948 25.9724 29.1116 26.0099 28.9286 25.9968C28.7455 25.9837 28.5695 25.9205 28.42 25.814L16 16.944V25C15.9999 25.1835 15.9493 25.3635 15.8537 25.5202C15.758 25.6769 15.6212 25.8043 15.458 25.8883C15.2948 25.9724 15.1116 26.0099 14.9286 25.9968C14.7455 25.9837 14.5695 25.9205 14.42 25.814L0.42 15.814C0.290369 15.7215 0.184706 15.5994 0.111803 15.4578C0.0389004 15.3162 0.000864029 15.1592 0.000864029 15C0.000864029 14.8407 0.0389004 14.6838 0.111803 14.5422C0.184706 14.4006 0.290369 14.2785 0.42 14.186L14.42 4.18599C14.5695 4.07953 14.7455 4.01628 14.9286 4.00317C15.1116 3.99005 15.2948 4.02758 15.458 4.11165C15.6212 4.19572 15.758 4.32307 15.8537 4.47976C15.9493 4.63646 15.9999 4.81644 16 4.99999V13.056L28.42 4.18599Z" fill="#AAAAAA"/>
                </svg>
            </button>

            <div class="font-semibold text-2xl">
                {{store.pageNow}}
            </div>

            <button @click="store.pageNow++">
                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.58 4.18599C1.43047 4.07953 1.25453 4.01628 1.07144 4.00317C0.888354 3.99005 0.70519 4.02758 0.542016 4.11165C0.378843 4.19572 0.241955 4.32307 0.14635 4.47976C0.0507456 4.63646 0.000113132 4.81644 0 4.99999V25C0.000113132 25.1835 0.0507456 25.3635 0.14635 25.5202C0.241955 25.6769 0.378843 25.8043 0.542016 25.8883C0.70519 25.9724 0.888354 26.0099 1.07144 25.9968C1.25453 25.9837 1.43047 25.9205 1.58 25.814L14 16.944V25C14.0001 25.1835 14.0507 25.3635 14.1463 25.5202C14.242 25.6769 14.3788 25.8043 14.542 25.8883C14.7052 25.9724 14.8884 26.0099 15.0714 25.9968C15.2545 25.9837 15.4305 25.9205 15.58 25.814L29.58 15.814C29.7096 15.7215 29.8153 15.5994 29.8882 15.4578C29.9611 15.3162 29.9991 15.1592 29.9991 15C29.9991 14.8407 29.9611 14.6838 29.8882 14.5422C29.8153 14.4006 29.7096 14.2785 29.58 14.186L15.58 4.18599C15.4305 4.07953 15.2545 4.01628 15.0714 4.00317C14.8884 3.99005 14.7052 4.02758 14.542 4.11165C14.3788 4.19572 14.242 4.32307 14.1463 4.47976C14.0507 4.63646 14.0001 4.81644 14 4.99999V13.056L1.58 4.18599Z" fill="#AAAAAA"/>
                </svg>
            </button>
        </div>

    </div>
</template>

<style scoped>

</style>
