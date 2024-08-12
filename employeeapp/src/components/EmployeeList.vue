<template>
  <div class="container">
    <div class="d-flex flex-column align-items-center">
    <h1>Employee 2024</h1>

   
    <div class="d-flex justify-content-start">
      <button
        class="btn btn-add-employee mb-3 mt-4"
        data-bs-toggle="modal"
        data-bs-target="#employeeModal"
        @click="openCreateModal"
      >
        Add Employee
      </button>
    </div>

    <!-- Employee Table -->
    <div class="table-responsive">
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
                class="bi bi-eye text-primary me-3"
                role="button"
                data-bs-toggle="modal"
                data-bs-target="#viewEmployeeModal"
                @click="viewEmployee(employee)"
              ></i>
              <i
                class="bi bi-pencil text-warning me-3"
                role="button"
                data-bs-toggle="modal"
                data-bs-target="#employeeModal"
                @click="editEmployee(employee)"
              ></i>
              <i
                class="bi bi-trash text-danger"
                role="button"
                @click="confirmRemove(employee.id)"
              ></i>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

   
    <div
      class="modal fade"
      id="employeeModal"
      tabindex="-1"
      aria-labelledby="employeeModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm"> 
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="employeeModalLabel">
              {{ isEditMode ? "Edit Employee" : "Add Employee" }}
            </h5>
            <button
          type="button"
          class="btn-close"
          aria-label="Close"
          @click="closeModal('employeeModal')"
        ></button>
          </div>
          <div class="modal-body">
            <form @submit.prevent="submitForm" class="compact-form">
              <div class="mb-2 row">
                <label for="name" class="col-sm-4 col-form-label"><strong>Name</strong></label>
                <div class="col-sm-8">
                  <input
                    type="text"
                    id="name"
                    v-model="form.name"
                    class="form-control"
                    placeholder="Enter Fullname"
                    required
                  />
                </div>
              </div>
              <div class="mb-2 row">
                <label for="position" class="col-sm-4 col-form-label"><strong>Position</strong></label>
                <div class="col-sm-8">
                  <input
                    type="text"
                    id="position"
                    v-model="form.position"
                    class="form-control"
                     placeholder="Enter Position"
                    required
                  />
                </div>
              </div>
              <div class="mb-2 row">
                <label for="department" class="col-sm-4 col-form-label"><strong>Department</strong></label>
                <div class="col-sm-8">
                  <input
                    type="text"
                    id="department"
                    v-model="form.department"
                    class="form-control"
                     placeholder="Enter Department"
                    required
                  />
                </div>
              </div>
              <div class="mb-2 row">
                <label for="address" class="col-sm-4 col-form-label"><strong>Address</strong></label>
                <div class="col-sm-8">
                  <input
                    type="text"
                    id="address"
                    v-model="form.address"
                    class="form-control"
                     placeholder="Enter Address"
                    required
                  />
                </div>
              </div>
              <div class="mb-2 row">
                <label for="email" class="col-sm-4 col-form-label"><strong>Email</strong></label>
                <div class="col-sm-8">
                  <input
                    type="email"
                    id="email"
                    v-model="form.email"
                    class="form-control"
                     placeholder="Enter Email"
                    required
                  />
                </div>
              </div>
              <div class="mb-2 row">
                <label for="phone" class="col-sm-4 col-form-label"><strong>Phone</strong></label>
                <div class="col-sm-8">
                  <input
                    type="tel"
                    id="phone"
                    v-model="form.phone"
                    class="form-control"
                     placeholder="Enter Phone"
                    required
                  />
                </div>
              </div>
              <div class="text-end">
                <button
              type="submit"
              class="btn btn-update"
             
            >
              {{ isEditMode ? "Update" : "Save" }}
            </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    
    <div
      class="modal fade"
      id="viewEmployeeModal"
      tabindex="-1"
      aria-labelledby="viewEmployeeModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="viewEmployeeModalLabel">
              Employee's Information
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <p class="view-label"><strong>Name:</strong> {{ form.name }}</p>
            <p class="view-label"><strong>Position:</strong> {{ form.position }}</p>
            <p class="view-label"><strong>Department:</strong> {{ form.department }}</p>
            <p class="view-label"><strong>Address:</strong> {{ form.address }}</p>
            <p class="view-label"><strong>Email:</strong> {{ form.email }}</p>
            <p class="view-label"><strong>Phone:</strong> {{ form.phone }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
 
</template>


<style scoped>

.modal-dialog {
  max-width: 400px;
}

.compact-form .row {
  margin-bottom: 0.5rem; 
}

.compact-form .col-form-label {
  padding-right: 0.5rem; 
}

.compact-form .form-control {
  padding: 0.25rem 0.5rem; 
}

button {
  margin-right: 10px;
}
</style>

<script>

import api from "../api/api.js";

export default {
  data() {
    return {
      employees: [],
      form: {
        id: null,
        name: "",
        position: "",
        department: "",
        address: "",
        email: "",
        phone: "",
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
        console.error("Error fetching employees:", error);
      }
    },
    openCreateModal() {
      this.resetForm();
      this.isEditMode = false;
    },
    editEmployee(employee) {
      this.form = { ...employee };
      this.isEditMode = true;
    },
    async submitForm() {
    try {
      if (this.validateForm()) {
        const payload = {
          Name: this.form.name,
          Position: this.form.position,
          Department: this.form.department,
          Address: this.form.address,
          Email: this.form.email,
          Phone: this.form.phone,
        };

        const payload2 = {
          Id: this.form.id,
          Name: this.form.name,
          Position: this.form.position,
          Department: this.form.department,
          Address: this.form.address,
          Email: this.form.email,
          Phone: this.form.phone,
        };

        if (this.isEditMode) {
          await api.updateEmployee(this.form.id, payload2);
        } else {
          await api.createEmployee(payload);
        }

        this.fetchEmployees();
        this.resetForm();

        this.closeModal('employeeModal');
      } else {
        alert("Please fill out all fields.");
      }
    } catch (error) {
      console.error("Error saving employee:", error.response ? error.response.data : error.message);
    }
  },
  validateForm() {
    return (
      this.form.name &&
      this.form.position &&
      this.form.department &&
      this.form.address &&
      this.form.email &&
      this.form.phone
    );
  },
  closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      const bootstrapModal = window.bootstrap.Modal.getInstance(modal);
      if (bootstrapModal) {
        bootstrapModal.hide(); 
      } else {
        new window.bootstrap.Modal(modal).hide(); 
      }
    }
  },
 
    async removeEmployee(id) {
      try {
        await api.deleteEmployee(id);
        this.fetchEmployees();
      } catch (error) {
        console.error("Error deleting employee:", error);
      }
    },
    confirmRemove(id) {
      if (confirm("Are you sure you want to delete this employee?")) {
        this.removeEmployee(id);
      }
    },
    viewEmployee(employee) {
      this.form = { ...employee };
    },
    resetForm() {
      this.form = {
        id: null,
        name: "",
        position: "",
        department: "",
        address: "",
        email: "",
        phone: "",
      };
    },
  },
};
</script>

<style scoped>
.modal-dialog {
  max-width: 400px;
}

.compact-form .row {
  margin-bottom: 0.5rem;
}

.compact-form .col-form-label {
  padding-right: 0.5rem;
}

.compact-form .form-control {
  padding: 0.25rem 0.5rem;
}

.btn-add-employee {
  background-color: #6ac974;
  border-color: #94d49a;
  margin-left: 0;
  width:20rem;
  padding-top: 0.3rem;
  padding-bottom: 0.3rem;
  border-radius: 0px;
  color:white;
}
.btn-update {
  background-color: #94d49a;
  border-color: #94d49a;
}

.text-start {
  text-align: left;
}
.view-label {
  text-align: left;
  padding-left: 15px;
  margin-bottom: 0.5rem; 
}
table td{
  text-align: left;
}
</style>