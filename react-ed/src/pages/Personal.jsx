import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { LISTAR_EMPLEADOS_URL } from '../components/Apis/ApisEmpleados/Listar';
import '../Styles/Tables.css';

export default function Empleados() {
  const [empleadosList, setEmpleadosList] = useState([]);

  useEffect(() => {
    // Función para obtener la lista de empleados desde el backend
    const fetchEmpleadosList = async () => {
      try {
        const response = await axios.get(LISTAR_EMPLEADOS_URL);
        setEmpleadosList(response.data);
      } catch (error) {
        console.error('Error fetching employees list:', error);
      }
    };

    fetchEmpleadosList();
  }, []);

  return (
    <div className="table-container">
      <h2>Lista de Empleados</h2>
      <div className='table-wrapper'>
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Usuario</th>
              <th>Contraseña</th>
              <th>Nombres</th>
              <th>Apellidos</th>
              <th>DOI</th>
              <th>Cargo</th>
              <th>Correo Electrónico</th>
              <th>Teléfono</th>
              <th>Fecha de Contrato</th>
              <th>Fecha de Despido</th>
              <th>Salario</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody>
            {empleadosList.map(empleado => (
              <tr key={empleado.id}>
                <td>{empleado.id}</td>
                <td>{empleado.user}</td>
                <td>{empleado.pw}</td>
                <td>{empleado.names}</td>
                <td>{empleado.lastnames}</td>
                <td>{empleado.doi}</td>
                <td>{empleado.cargo}</td>
                <td>{empleado.gmail}</td>
                <td>{empleado.telefono}</td>
                <td>{empleado.fcontrato}</td>
                <td>{empleado.fdespido}</td>
                <td>{empleado.salario}</td>
                <td>{empleado.estado ? 'Activo' : 'Inactivo'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
