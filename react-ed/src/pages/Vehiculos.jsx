import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { LISTAR_VEHICULOS_URL } from '../components/Apis/ApisVehiculos/Listar';
import '../Styles/Tables.css'

export default function Vehiculos() {
  const [vehiculosList, setVehiculosList] = useState([]);

  useEffect(() => {
    const fetchVehiculosList = async () => {
      try {
        const response = await axios.get(`${LISTAR_VEHICULOS_URL}`);
        setVehiculosList(response.data);
      } catch (error) {
        console.error('Error fetching vehicles list:', error);
      }
    };

    fetchVehiculosList();
  }, []);

  return (
    <div className="table-container">
      <h2>Lista de Vehículos</h2>
      <div className='table-wrapper'>
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Marca</th>
              <th>Modelo</th>
              <th>Tipo</th>
              <th>Placa</th>
              <th>Cliente ID</th>
              <th>Cliente</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody>
            {vehiculosList.map(vehiculo => (
              <tr key={vehiculo.id}>
                <td>{vehiculo.id}</td>
                <td>{vehiculo.marca}</td>
                <td>{vehiculo.modelo}</td>
                <td>{vehiculo.tipo}</td>
                <td>{vehiculo.placa}</td>
                <td>{vehiculo.estado ? 'Activo' : 'Inactivo'}</td>
                <td>{vehiculo.cliente_id}</td>
                <td>{`${vehiculo.cliente.names} ${vehiculo.cliente.lastnames}`}</td>
                
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}