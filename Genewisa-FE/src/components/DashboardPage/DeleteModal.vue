<script setup lang="ts">

</script>

<template>
    <div class="EditModal shadow-xl rounded-md w-[487px] bg-white">

        <div class="p-10 text-center">
            <div class="mx-auto w-fit">
                <svg width="125" height="125" viewBox="0 0 125 125" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M109.375 62.5C109.375 36.6211 88.3789 15.625 62.5 15.625C36.6211 15.625 15.625 36.6211 15.625 62.5C15.625 88.3789 36.6211 109.375 62.5 109.375C88.3789 109.375 109.375 88.3789 109.375 62.5Z" stroke="#F43F3F" stroke-width="7.8125" stroke-miterlimit="10"/>
                <path d="M61.0986 40.5396L62.5 70.3125L63.8989 40.5396C63.9075 40.3492 63.8773 40.1591 63.81 39.9809C63.7426 39.8026 63.6397 39.64 63.5074 39.5029C63.3751 39.3658 63.2162 39.2571 63.0405 39.1835C62.8647 39.1099 62.6759 39.0729 62.4853 39.0747V39.0747C62.2971 39.0765 62.1111 39.1162 61.9385 39.1914C61.7659 39.2666 61.6103 39.3759 61.4809 39.5126C61.3514 39.6493 61.2509 39.8107 61.1852 39.9872C61.1195 40.1636 61.0901 40.3515 61.0986 40.5396V40.5396Z" stroke="#F43F3F" stroke-width="7.8125" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M62.5 89.8218C61.5343 89.8218 60.5902 89.5354 59.7873 88.9989C58.9843 88.4624 58.3584 87.6998 57.9889 86.8075C57.6193 85.9153 57.5226 84.9335 57.711 83.9864C57.8994 83.0392 58.3645 82.1692 59.0473 81.4863C59.7302 80.8034 60.6002 80.3384 61.5474 80.15C62.4946 79.9616 63.4764 80.0583 64.3686 80.4278C65.2608 80.7974 66.0234 81.4232 66.5599 82.2262C67.0964 83.0292 67.3828 83.9732 67.3828 84.939C67.3828 86.234 66.8684 87.4759 65.9527 88.3916C65.037 89.3073 63.795 89.8218 62.5 89.8218Z" fill="#F43F3F"/>
                </svg>

            </div>
            <h2 class="text-3xl font-semibold mb-2">
                Apakah kamu yakin?
            </h2>
            <div class="w-[250px] mx-auto">
                <p>
                    Data yang sudah terhapus tidak dapat dikembalikan.
                </p>
            </div>
            
        </div>

        <div class="flex">
            <button class="basis-1/2 bg-gradient-to-br from-slate-200 to-slate-300 py-1">Batal</button>
            <button class="basis-1/2 bg-gradient-to-br from-red-400 to-rose-500 text-white py-1">Hapus</button>
        </div>
    </div>
</template>

<style scoped>

</style>