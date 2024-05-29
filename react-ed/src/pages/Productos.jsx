import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { LISTAR_PRODUCTOS_URL } from '../components/Apis/ApisProductos/Listar';
import '../Styles/Tables.css';

export default function Productos() {
  const [productosList, setProductosList] = useState([]);

  useEffect(() => {
    // Función para obtener la lista de productos desde el backend
    const fetchProductosList = async () => {
      try {
        const response = await axios.get(LISTAR_PRODUCTOS_URL);
        setProductosList(response.data);
      } catch (error) {
        console.error('Error fetching products list:', error);
      }
    };

    fetchProductosList();
  }, []);

  return (
    <div className="table-container">
      <h2>Lista de Productos</h2>
      <div className='table-wrapper'>
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Descripción</th>
              <th>Marca</th>
              <th>Fecha de Ingreso</th>
              <th>Stock</th>
              <th>Precio</th>
              <th>Estado</th>
              <th>ID Categoría</th>
              <th>ID Proveedor</th>
            </tr>
          </thead>
          <tbody>
            {productosList.map(producto => (
              <tr key={producto.id}>
                <td>{producto.id}</td>
                <td>{producto.nombre}</td>
                <td>{producto.descripcion}</td>
                <td>{producto.marca}</td>
                <td>{producto.fechaDeIngreso}</td>
                <td>{producto.stock}</td>
                <td>{producto.precio}</td>
                <td>{producto.estado ? 'Activo' : 'Inactivo'}</td>
                <td>{producto.categoria}</td>
                <td>{producto.proveedor}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
