<script lang="ts">

</script>

<template>
    <div class="NavigationBar">
        <div class="mt-7 flex h-16">
            <div class="basis-3/5 my-auto">
                <div class="ml-24 text-4xl font-bold my-auto">
                    Genewisa
                </div>
            </div>
            <div class="basis-2/5 flex justify-end">
                <div class="text-3xl font-semibold my-auto mr-24">
                    Home
                </div>
                
                <div v-if="this.$route.path !== '/login'" class="my-auto mr-24">
                    <div class="p-1 rounded-xl bg-gradient-to-r from-indigo-400 to-teal-400 w-fit overflow-hidden">
                        <router-link to="/login">
                            <button class="text-2xl px-16 py-1 rounded-md bg-white w-fit">
                                <h1 class="text-transparent bg-clip-text bg-gradient-to-br from-indigo-400 to-teal-400">
                                    Login
                                </h1>
                            </button>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
