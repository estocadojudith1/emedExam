<template>
  <div class="home">

    <EmployeeList /> <!-- Add this line to use the EmployeeList component -->
  </div>
</template>

<script>
// @ is an alias to /src
import EmployeeList from "@/components/EmployeeList.vue";

export default {
  name: 'HomeView',
  components: {
    EmployeeList
  }
}
</script>
