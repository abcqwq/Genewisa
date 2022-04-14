<script setup lang="ts">
import {useGeneralStore} from "../../stores/General";

const store = useGeneralStore();
</script>

<template>
    <div class="EditModal shadow-xl rounded-md w-[487px] bg-white">

        <div class="p-10 text-center">
            <div class="mx-auto w-fit pl-[30px]">
                <svg width="125" height="125" viewBox="0 0 125 125" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M74.2188 82.0312V91.7969C74.2188 94.3869 73.1899 96.8708 71.3585 98.7022C69.5271 100.534 67.0431 101.562 64.4531 101.562H25.3906C22.8006 101.562 20.3167 100.534 18.4853 98.7022C16.6539 96.8708 15.625 94.3869 15.625 91.7969V33.2031C15.625 30.6131 16.6539 28.1292 18.4853 26.2978C20.3167 24.4664 22.8006 23.4375 25.3906 23.4375H62.5C67.8931 23.4375 74.2188 27.8101 74.2188 33.2031V42.9688M89.8438 82.0312L109.375 62.5L89.8438 42.9688M42.9688 62.5H105.469" stroke="black" stroke-width="7.8125" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>
            <h2 class="text-3xl font-semibold mb-2">
                Logout
            </h2>
            <div class="w-[200px] mx-auto">
                <p>
                    Apakah kamu yakin ingin keluar dari akun?
                </p>
            </div>
            
        </div>

        <div class="flex">
            <button @click="store.isLogoutting = 0"  class="basis-1/2 bg-gradient-to-br from-slate-200 to-slate-300 py-1">Batal</button>
            <button @click="store.isLogoutting = 2" class="basis-1/2 bg-gradient-to-br from-red-300 to-pink-400 text-white py-1">Logout</button>
        </div>
    </div>
</template>

<style scoped>

</style>