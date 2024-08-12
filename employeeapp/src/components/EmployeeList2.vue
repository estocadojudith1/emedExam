<template>
    <div class="d-flex justify-content-center">
      <div class="table-responsive">
        <h1>Employee List</h1>

        <form @submit.prevent="submitForm">
          <div>
            <label for="name">Name:</label>
            <input type="text" id="name" v-model="form.name" required>
          </div>
          <div>
            <label for="position">Position:</label>
            <input type="text" id="position" v-model="form.position" required>
          </div>
          <div>
            <label for="department">Department:</label>
            <input type="text" id="department" v-model="form.department" required>
          </div>
          <div>
            <label for="address">Address:</label>
            <input type="text" id="department" v-model="form.address" required>
          </div>
          <div>
            <label for="email">Email:</label>
            <input type="text" id="department" v-model="form.email" required>
          </div>
          <div>
            <label for="phone">Phone:</label>
            <input type="text" id="department" v-model="form.phone" required>
          </div>
          <button type="submit">{{ isEditMode ? 'Update' : 'Create' }}</button>
          <button type="button" @click="resetForm">Cancel</button>
        </form>
  
        <table class="table table-borderless w-auto">
          <thead>
            <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Department</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="employee in employees" :key="employee.id">
              <td>{{ employee.name }}</td>
              <td>{{ employee.position }}</td>
              <td>{{ employee.department }}</td>
              <td>
              <i
                class="bi bi-eye text-primary me-2"
                role="button"
                @click="viewEmployee(employee.id)"
              ></i>
              <i
                class="bi bi-pencil text-warning me-2"
                role="button"
                @click="editEmployee(employee)"
              ></i>
              <i
                class="bi bi-trash text-danger"
                role="button"
                @click="removeEmployee(employee.id)"
              ></i>
            </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  import api from "../api/api.js";
  
  export default {
    data() {
      return {
        employees: [],
        form: {
          id: null,
          name: '',
          position: '',
          department: '',
          address:'',
          email:'',
          phone:''
        },
        isEditMode: false,
      };
    },
    created() {
      this.fetchEmployees();
    },
    methods: {
      async fetchEmployees() {
        try {
          const response = await api.getAllEmployees();
          this.employees = response.data;
        } catch (error) {
          console.error('Error fetching employees:', error);
        }
      },
      async submitForm() {
  try {
    console.log('Submitting form data:', this.form);
    const payload = {
      Id: this.form.id,
      Name: this.form.name,
      Position: this.form.position,
      Department: this.form.department,
      Address:this.form.address,
      Email:this.form.email,
      Phone:this.form.phone
    };
    
    if (this.isEditMode) {
      await api.updateEmployee(this.form.id, payload);
    } else {
      await api.createEmployee(payload);
    }
    
    this.fetchEmployees();
    this.resetForm(); 
  } catch (error) {
    console.error('Error saving employee:', error.response ? error.response.data : error.message);
  }
}

,
      editEmployee(employee) {
        this.form.id = employee.id;
        this.form.name = employee.name;
        this.form.position = employee.position;
        this.form.department = employee.department;
        this.form.address = employee.address;
        this.form.email = employee.email;
        this.form.phone = employee.phone;
        this.isEditMode = true;
      },
      
      async removeEmployee(id) {
        try {
          await api.deleteEmployee(id);
          this.fetchEmployees(); 
        } catch (error) {
          console.error('Error deleting employee:', error);
        }
      },
      resetForm() {
        this.form.id = null;
        this.form.name = '';
        this.form.position = '';
        this.form.department = '';
        this.form.address = '';
        this.form.email = '';
        this.form.phone ='';
        this.isEditMode = false;
      }
    }
  };
  </script>
  
  <style scoped>
  form {
    margin-bottom: 20px;
  }
  
  form div {
    margin-bottom: 10px;
  }
  
  .table {
    margin: 0 auto;
    border-collapse: separate;
    border-spacing: 0;
  }
  
  .table th,
  .table td {
    border-top: none;
    border-bottom: none;
  }
  
  .table th,
  .table td {
    padding: 8px 12px;
  }

  .table i {
  cursor: pointer;
}

.table i.bi-eye {
  color: #007bff; /* Bootstrap primary color */
}

.table i.bi-pencil {
  color: #ffc107; 
}

.table i.bi-trash {
  color: #dc3545; 
}
  
  button {
    margin-right: 10px;
  }
  </style>
  