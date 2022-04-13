import { defineStore } from "pinia";

export const useGeneralStore = defineStore("general", {
    state: () => {
        return {
            token: ''
        }
    },
    actions: {
        forgetToken() {
            this.token = '';
        },
        rememberToken(token: string) {
            this.$state.token = token;
        }
    },
    getters: {

    }
});