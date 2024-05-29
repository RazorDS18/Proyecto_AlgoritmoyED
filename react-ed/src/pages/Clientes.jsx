import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { LISTAR_CLIENTES_URL } from '../components/Apis/ApisClientes/Listar';
import '../Styles/Tables.css'

export default function Clientes() {
  const [clientesList, setClientesList] = useState([]);

  useEffect(() => {
    // Función para obtener la lista de clientes desde el backend
    const fetchClientesList = async () => {
      try {
        const response = await axios.get(LISTAR_CLIENTES_URL);
        setClientesList(response.data);
      } catch (error) {
        console.error('Error fetching clients list:', error);
      }
    };

    fetchClientesList();
  }, []);

  return (
    <div className="table-container">
      <h2>Lista de CLientes</h2>
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
              <th>Correo Electrónico</th>
              <th>Teléfono</th>
              <th>Dirección</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody>
            {clientesList.map(cliente => (
              <tr key={cliente.id}>
                <td>{cliente.id}</td>
                <td>{cliente.user}</td>
                <td>{cliente.pw}</td>
                <td>{cliente.names}</td>
                <td>{cliente.lastnames}</td>
                <td>{cliente.doi}</td>
                <td>{cliente.gmail}</td>
                <td>{cliente.telefono}</td>
                <td>{cliente.direccion}</td>
                <td>{cliente.estado ? 'Activo' : 'Inactivo'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}