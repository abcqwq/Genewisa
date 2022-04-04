import { createRouter, createWebHistory } from "vue-router";
import LandingPage from "../views/LandingPage.vue";
import LoginPage from "../views/LoginPage.vue";

const routes = [
    {
        path: '/',
        name: 'Home',
        component: LandingPage
    },
    {
        path: '/login',
        name: 'Login',
        component: LoginPage
    }
];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});


export default router;