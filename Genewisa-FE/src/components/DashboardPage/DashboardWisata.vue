<script setup lang="ts">
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import EditModal from "./EditModal.vue";
import {onMounted, onUnmounted, ref, watch} from "vue";
import router from "../../router";

const store = useGeneralStore();
const listData = ref([]);

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

onUnmounted(() => {
    store.keywordNow = '';
});

function getData() {
    axios({
        method: "get",
        url: "http://localhost:8000/api/tempat-wisata?page=" + store.pageNow + "&key=" + store.keywordNow,
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

const dataModal = ref({});

function setDataModal(dataWisata: object) {
    dataModal.value = dataWisata;
    store.isEditing = true;
}

onUnmounted(() => {
    store.isEditing = false;
});

function deleteData(id: any) {
    axios({
        method: "delete",
        url: "http://localhost:8000/api/tempat-wisata/" + id,
        params: {
            token: store.token
        }
    })
        .then(() => {
            router.push("/");
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
        </thead>
        <tbody id="data">
            <tr class="h-12" v-for="(data, index) in listData" :data="data" v-bind:class="{'bg-slate-50' : !(index % 2)}">
                <td> {{ data.name }} </td>
                <td> {{ data.city }} </td>
                <td> {{ data.description }} </td>
                <td>
                    <button class="mx-4"  @click="setDataModal(data)">
                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_15_127)">
                                <path d="M11.8248 0.175201C11.7691 0.119325 11.7029 0.0749933 11.63 0.0447456C11.5571 0.0144978 11.4789 -0.00107193 11.4 -0.00107193C11.3211 -0.00107193 11.2429 0.0144978 11.17 0.0447456C11.0971 0.0749933 11.0309 0.119325 10.9752 0.175201L7.8 3.3516L14.6484 10.2L17.8248 7.0248C17.8807 6.96907 17.925 6.90285 17.9553 6.82996C17.9855 6.75707 18.0011 6.67892 18.0011 6.6C18.0011 6.52108 17.9855 6.44293 17.9553 6.37004C17.925 6.29715 17.8807 6.23093 17.8248 6.1752L11.8248 0.175201ZM0 11.1516L6.9516 4.2L13.8 11.0484L6.8484 18H0.6C0.44087 18 0.288258 17.9368 0.175736 17.8243C0.0632141 17.7117 0 17.5591 0 17.4V11.1516ZM9.6 18H18V16.8H9.6V18Z" fill="#0057FF"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_15_127">
                                    <rect width="18" height="18" fill="white"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </button>

                    <button class="mx-4" @click="deleteData(data.id)">
                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M13.2 3.6V1.8C13.2 1.32261 13.0104 0.864773 12.6728 0.527208C12.3352 0.189642 11.8774 0 11.4 0L6.6 0C6.12261 0 5.66477 0.189642 5.32721 0.527208C4.98964 0.864773 4.8 1.32261 4.8 1.8V3.6H0V4.8H1.2V16.2C1.2 16.6774 1.38964 17.1352 1.72721 17.4728C2.06477 17.8104 2.52261 18 3 18H15C15.4774 18 15.9352 17.8104 16.2728 17.4728C16.6104 17.1352 16.8 16.6774 16.8 16.2V4.8H18V3.6H13.2ZM6 1.8C6 1.64087 6.06321 1.48826 6.17574 1.37574C6.28826 1.26321 6.44087 1.2 6.6 1.2H11.4C11.5591 1.2 11.7117 1.26321 11.8243 1.37574C11.9368 1.48826 12 1.64087 12 1.8V3.6H6V1.8ZM8.4 8.4V14.4H9.6V8.4H8.4ZM4.8 14.4V10.8H6V14.4H4.8ZM12 10.8V14.4H13.2V10.8H12Z" fill="#F43F3F"/>
                        </svg>
                    </button>
                </td>
            </tr>
        </tbody>
    </table>

    <EditModal :data="dataModal" v-if="store.isEditing" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"/>

</template>

<style scoped>

</style>