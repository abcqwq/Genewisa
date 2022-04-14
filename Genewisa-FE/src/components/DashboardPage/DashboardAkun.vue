<script setup lang="ts">
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import {onMounted, onUnmounted, ref, watch} from "vue";
import router from "../../router";

const store = useGeneralStore();
const listData = ref([]);
const confirmDel = ref(false);

onMounted(() => {
    const store = useGeneralStore();
    if (store.token == '') {
        router.push('/login');
    }
});

watch(() => store.pageNow, () => {
    getData();
});

watch(() => store.keywordNow, () => {
    getData();
});

watch(() => store.isDeleting, () => {
    if (store.isDeleting === 2) {
        deleteData();
        store.isDeleting = 0;
    }
});

onUnmounted(() => {
    store.keywordNow = '';
    store.isDeleting = 0;
    store.deletedObject = '';
});

function getData() {
    axios({
        method: "get",
        url: "http://localhost:8000/api/user?page=" + store.pageNow + "&keyword=" + store.keywordNow,
        params: {
            token: store.token
        }
    })
        .then((res) => {
            listData.value = res.data.data.data;
            store.pageNow = res.data.data.current_page;
            if (listData.value.length == 0) {
                store.pageNow--;
            }
        })
        .catch((err) => {
            console.log(err);
            store.forgetToken();
        });
}

function deleteData() {
    axios({
        method: "delete",
        url: "http://localhost:8000/api/user/" + store.deletedObject,
        params: {
            token: store.token
        }
    })
        .then(() => {
            router.push("/");
        })
        .catch((err) => console.log(err));
}

function confirmDelete(username: string){
    store.isDeleting = 1;
    store.deletedObject = username;
}

onMounted(() => {
    getData();
})
</script>

<template>
    <table class="table-fixed w-full">
        <thead>
        <tr>
            <th class="text-left w-1/3">Username</th>
            <th class="text-left w-1/3">Nama Depan</th>
            <th class="text-left w-1/3">Nama Belakang</th>
        </tr>
        </thead>
        <tbody id="data">
            <tr class="h-12" v-for="(data, index) in listData" :data="data" v-bind:class="{'bg-slate-50' : !(index % 2)}">
                <td> {{ data.username }} </td>
                <td> {{ data.first_name }} </td>
                <td> {{ data.last_name }} </td>
                <td>
                    <button class="mx-4" @click="confirmDelete(data.username)">
                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M13.2 3.6V1.8C13.2 1.32261 13.0104 0.864773 12.6728 0.527208C12.3352 0.189642 11.8774 0 11.4 0L6.6 0C6.12261 0 5.66477 0.189642 5.32721 0.527208C4.98964 0.864773 4.8 1.32261 4.8 1.8V3.6H0V4.8H1.2V16.2C1.2 16.6774 1.38964 17.1352 1.72721 17.4728C2.06477 17.8104 2.52261 18 3 18H15C15.4774 18 15.9352 17.8104 16.2728 17.4728C16.6104 17.1352 16.8 16.6774 16.8 16.2V4.8H18V3.6H13.2ZM6 1.8C6 1.64087 6.06321 1.48826 6.17574 1.37574C6.28826 1.26321 6.44087 1.2 6.6 1.2H11.4C11.5591 1.2 11.7117 1.26321 11.8243 1.37574C11.9368 1.48826 12 1.64087 12 1.8V3.6H6V1.8ZM8.4 8.4V14.4H9.6V8.4H8.4ZM4.8 14.4V10.8H6V14.4H4.8ZM12 10.8V14.4H13.2V10.8H12Z" fill="#F43F3F"/>
                        </svg>
                    </button>
                </td>
            </tr>
        </tbody>
    </table>
</template>

<style scoped>

</style>