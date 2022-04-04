<script lang="ts">
import UsernameSVG from "./UsernameSVG.vue";
import PasswordSVG from "./PasswordSVG.vue";
export default {
    components: {PasswordSVG, UsernameSVG}
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

                <input id="username" type="text" placeholder="Username" class="input-box">

            </div>

            <div class="mt-8 border-b-2 w-fit py-3 flex gap-4">

                <div class="scale-75 w-fit">
                    <PasswordSVG/>
                </div>

                <input id="password" type="password" placeholder="Password" class="input-box">

            </div>

            <button
                class="mt-6 text-2xl text-white bg-gradient-to-br from-indigo-400 to-teal-400 rounded-xl px-16 py-2">
                Login
            </button>


        </div>

    </div>
</template>
