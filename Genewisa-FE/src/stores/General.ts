import { defineStore } from "pinia";
import {ref} from "vue";

export const useGeneralStore = defineStore("general", () => {
    const token = ref('');
    const dashboardSection = ref('akun');
    const isEditing = ref(false);

    const forgetToken = () => {
        token.value = '';
    }

    const setToken = (newToken: string) => {
        token.value = newToken;
    }

    const setDashboardSection = (newSection: string) => {
        dashboardSection.value = newSection;
    }

    return {
        token, dashboardSection, forgetToken, setToken, setDashboardSection, isEditing
    }

}, {
    persist: true
});