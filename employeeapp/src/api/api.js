import axios from "axios";

const API_URL = "https://localhost:7266/api/employee"; 

export default {
  getAllEmployees() {
    return axios.get(API_URL);
  },
  getEmployeeById(id) {
    return axios.get(`${API_URL}/${id}`);
  },
  createEmployee(employee) {
    return axios.post(API_URL, employee);
  },

  updateEmployee(id, employee) {
    return axios.put(`${API_URL}/${id}`, employee, {
      headers: {
        'Content-Type': 'application/json'
      }
    });
  },


  deleteEmployee(id) {
    return axios.delete(`${API_URL}/${id}`);
  },
 
};

  


