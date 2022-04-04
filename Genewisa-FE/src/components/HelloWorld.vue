<script setup lang="ts">
import {onMounted, ref} from 'vue'

// reactive state
let count = ref(0)

// functions that mutate state and trigger updates
function increment() {
    count.value++
}

// lifecycle hooks
onMounted(() => {
    console.log(`The initial count is ${count.value}.`)
})

</script>

<template>
<div>
    <button @click="increment()" class="bg-slate-800 rounded-full py-2 px-12 w-fit text-white">
        {{ count }}
    </button>
</div>
</template>

<style scoped>

</style>
