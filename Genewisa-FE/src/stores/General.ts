import { defineStore } from "pinia";
import {ref} from "vue";

export const useGeneralStore = defineStore("general", () => {
    const token = ref('');

    const forgetToken = () => {
        token.value = '';
    }

    const setToken = (newToken: string) => {
        token.value = newToken;
    }

    return {
        token, forgetToken, setToken
    }

}, {
    persist: true
});