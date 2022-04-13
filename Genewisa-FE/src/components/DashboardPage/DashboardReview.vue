<script setup lang="ts">
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import {onMounted, ref} from "vue";

const store = useGeneralStore();
const listData = ref([]);
function getData() {
    axios({
        method: "get",
        url: "http://localhost:8000/api/review",
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
            <th class="text-left w-1/4">Username</th>
            <th class="text-left w-1/4">Tempat Wisata</th>
            <th class="text-left w-1/4">Rating</th>
            <th class="text-left w-1/4">Comment</th>
        </tr>
        <tr class="h-12" v-for="(data, index) in listData" :data="data" v-bind:class="{'bg-slate-50' : !(index % 2)}">
            <td> {{ data.username }} </td>
            <td> {{ data.id_tempatwisata }} </td>
            <td> {{ data.rating }} </td>
            <td> {{ data.comment }}</td>
        </tr>
        {{listData.value}}
        </thead>
        <tbody id="data">
        </tbody>
    </table>
</template>

<style scoped>

</style>