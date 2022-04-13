<script lang="ts" setup>
import UsernameSVG from "./UsernameSVG.vue";
import PasswordSVG from "./PasswordSVG.vue";
import {onMounted, ref} from "vue";
import axios from "axios";
import {useGeneralStore} from "../../stores/General";
import router from "../../router";

const username = ref('');
const password = ref('');
let store = useGeneralStore();

function handleLogin() {
    axios({
        method: "post",
        url: "http://localhost:8000/api/login",
        params: {
            username: username.value,
            password: password.value
        }})
        .then((res) => {
            store.rememberToken(res.data.data.token);
            router.push("/dashboard");
        })
        .catch((err) => console.log(err));
}

</script>

<template>
    <div class="BodyPage">

        <div class="mt-16">
            <h1 class="font-bold text-8xl">
                login
            </h1>

            <div class="mt-16 border-b-2 w-fit py-3 flex gap-4">

                <div class="scale-75 w-fit">
                    <UsernameSVG />
                </div>

                <input v-model="username" type="text" placeholder="Username" class="input-box">

            </div>

            <div class="mt-8 border-b-2 w-fit py-3 flex gap-4">

                <div class="scale-75 w-fit">
                    <PasswordSVG/>
                </div>

                <input v-model="password" type="password" placeholder="Password" class="input-box">

            </div>

            <button @click="handleLogin" class="mt-6 text-2xl text-white bg-gradient-to-br from-indigo-400 to-teal-400 rounded-xl px-16 py-2">
                Login
            </button>

            <router-link to="/">
                <button>
                    click me
                </button>
            </router-link>


        </div>

    </div>
</template>
