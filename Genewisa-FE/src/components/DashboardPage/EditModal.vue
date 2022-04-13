<script setup lang="ts">
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import {onMounted, ref} from "vue";
import router from "../../router";

const store = useGeneralStore();
const props = defineProps({data: Object});

function editData() {
    axios({
        method: "put",
        url: "http://localhost:8000/api/tempat-wisata/" + props.data?.id,
        params: {
            token: store.token,
            name: props.data?.name,
            city: props.data?.city,
            description: props.data?.description
        }
    })
        .then(() => {
            store.isEditing = false;
            router.push("/");
        })
        .catch((err) => console.log(err));
}

</script>

<template>
    <div class="EditModal shadow-xl rounded-md w-[487px] bg-white">

        <div class="p-10">
            <h2 class="font-bold text-3xl">Edit Data</h2>
            <div class="mt-6">
                <div class="flex mb-4">
                    <div class="basis-2/5">Id</div>
                    <div class="basis-4/5">
                        {{ props.data.id }}
                    </div>
                </div>

                <div class="flex mb-4">
                    <div class="basis-2/5">Nama</div>
                    <div class="basis-4/5">
                        <input class="border border-slate-300 w-full rounded-md px-3 focus:outline-none" v-model="props.data.name">
                    </div>
                </div>

                <div class="flex mb-4">
                    <div class="basis-2/5">Lokasi</div>
                    <div class="basis-4/5">
                        <input class="border border-slate-300 w-full rounded-md px-3 focus:outline-none" type="text" v-model="props.data.city">
                    </div>
                </div>

                <div class="flex mb-4">
                    <div class="basis-2/5">Deskripsi</div>
                    <div class="basis-4/5">
                        <textarea class="border border-slate-300 h-24 w-full rounded-md px-3 focus:outline-none" type="text" v-model="props.data.description"></textarea>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex">
            <button @click="store.isEditing=false" class="basis-1/2 bg-gradient-to-br from-slate-200 to-slate-300 py-1">Batal</button>
            <button @click="editData" class="basis-1/2 bg-gradient-to-br from-indigo-300 to-indigo-400 text-white py-1">Simpan</button>
        </div>
    </div>
</template>

<style scoped>

</style>