<script setup lang="ts">
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import {onMounted, ref} from "vue";

const store = useGeneralStore();
const listData = ref([]);
function getData() {
    axios({
        method: "get",
        url: "http://localhost:8000/api/tempat-wisata",
        params: {
            token: store.token
        }
    })
        .then((res) => {
            listData.value = res.data.data;
        })
        .catch((err) => console.log(err));
}

onMounted(() => {
    getData();
})
</script>

<template>
    <table class="table-fixed w-full">
        <thead>
        <tr>
            <th class="text-left w-1/3">Nama</th>
            <th class="text-left w-1/3">Lokasi</th>
            <th class="text-left w-1/3">Deskripsi</th>
        </tr>
        <tr class="h-12" v-for="(data, index) in listData" :data="data" v-bind:class="{'bg-slate-50' : !(index % 2)}">
            <td> {{ data.name }} </td>
            <td> {{ data.city }} </td>
            <td> {{ data.description }} </td>
        </tr>
        {{listData.value}}
        </thead>
        <tbody id="data">
        </tbody>
    </table>
</template>

<style scoped>

</style>