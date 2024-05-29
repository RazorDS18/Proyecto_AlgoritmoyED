import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { LISTAR_PROVEEDORES_URL } from '../components/Apis/ApisProveedor/Listar';
import '../Styles/Tables.css';

export default function Proveedores() {
  const [proveedoresList, setProveedoresList] = useState([]);

  useEffect(() => {
    // Función para obtener la lista de proveedores desde el backend
    const fetchProveedoresList = async () => {
      try {
        const response = await axios.get(LISTAR_PROVEEDORES_URL);
        setProveedoresList(response.data);
      } catch (error) {
        console.error('Error fetching providers list:', error);
      }
    };

    fetchProveedoresList();
  }, []);

  return (
    <div className="table-container">
      <h2>Lista de Proveedores</h2>
      <div className="table-wrapper">
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Descripción</th>
              <th>RUC</th>
              <th>Teléfono</th>
              <th>Dirección</th>
              <th>Correo Electrónico</th>
              <th>Fecha de Ingreso</th>
              <th>Fecha de Salida</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody>
            {proveedoresList.map(proveedor => (
              <tr key={proveedor.id}>
                <td>{proveedor.id}</td>
                <td>{proveedor.nombre}</td>
                <td>{proveedor.descripcion}</td>
                <td>{proveedor.ruc}</td>
                <td>{proveedor.telefono}</td>
                <td>{proveedor.direccion}</td>
                <td>{proveedor.gmail}</td>
                <td>{proveedor.fechaDeIngreso}</td>
                <td>{proveedor.fechaDeSalida}</td>
                <td>{proveedor.estado ? 'Activo' : 'Inactivo'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
