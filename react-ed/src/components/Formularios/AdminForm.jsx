import React, { useState } from 'react';
import axios from 'axios';
import ListAdm from '../Listas/ListAdm';
import {ToastContainer, toast} from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css';

import { CREAR_ADMINISTRADORES_URL } from '../../components/Apis/ApisAdministradores/Crear';
import { ELIMINAR_ADMINISTRADORES_URL } from '../../components/Apis/ApisAdministradores/Eliminar';
import { BUSCAR_ADMINISTRADORES_URL } from '../../components/Apis/ApisAdministradores/Buscar';
import { ACTUALIZAR_ADMINISTRADORES_URL } from '../../components/Apis/ApisAdministradores/Actualizar';

import '../../Styles/Form.css'

const AdminForm = () => {
  const initialState = {
    usuario: '',
    contrasenia: '',
    nombres: '',
    apellidos: '',
    doi: '',
    correo: '',
    telefono: '',
    estado: true, 
  };
  const [estadoModal,cambiarEstadoModal] = useState(false);
  const [administrador, setAdministrador] = useState(initialState);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setAdministrador({ ...administrador, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post(CREAR_ADMINISTRADORES_URL, administrador);
      console.log('Administrador creado:', response.data);
      toast.success('Administrador agregado correctamente!');
    } catch (error) {
      console.error('Error creando administrador:', error);
      toast.error('Error al agregar el administrador');
    }
  };
  const handleDelete = async () => {
    try {
      const response = await axios.delete(ELIMINAR_ADMINISTRADORES_URL + '/' + administrador.doi);
      console.log('Administrador eliminado:', response.data);
    } catch (error) {
      console.error('Error eliminando administrador:', error);
    }
  };

  const handleBuscar = async () => {
    try {
      const response = await axios.get(BUSCAR_ADMINISTRADORES_URL + '/' + administrador.doi);
      const administradorEncontrado = response.data;
      if (administradorEncontrado) {
        setAdministrador(administradorEncontrado);
        console.log('Administrador encontrado:', administradorEncontrado);
      } else {
        console.log('Administrador no encontrado');
      }
    } catch (error) {
      console.error('Error buscando administrador:', error);
    }
  };
  const handleUpdate = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.put(`${ACTUALIZAR_ADMINISTRADORES_URL}/${administrador.doi}`, administrador);
      console.log('Administrador actualizado:', response.data);
      setAdministrador(initialState); // Resetear el formulario
    } catch (error) {
      console.error('Error actualizando administrador:', error);
    }
  };


  return (
    <div className="form-container">
      <h2>Formulario Administrador</h2>
      <form onSubmit={handleSubmit}>
        <label>Usuario:</label>
        <input type="text" name="usuario" value={administrador.usuario} onChange={handleChange} required />

        <label>Contraseña:</label>
        <input type="password" name="contrasenia" value={administrador.contrasenia} onChange={handleChange} required />

        <label>Nombres:</label>
        <input type="text" name="nombres" value={administrador.nombres} onChange={handleChange} required />

        <label>Apellidos:</label>
        <input type="text" name="apellidos" value={administrador.apellidos} onChange={handleChange} required />

        <label>DOI:</label>
        <input type="text" name="doi" value={administrador.doi} onChange={handleChange} required />

        <label>Correo:</label>
        <input type="email" name="correo" value={administrador.correo} onChange={handleChange} required />

        <label>Teléfono:</label>
        <input type="text" name="telefono" value={administrador.telefono} onChange={handleChange} required />

        <button type="submit">Agregar</button>
        <button type="button" onClick={handleBuscar}>Buscar</button>
        <button type="button" onClick={handleUpdate}>Editar</button>
        <button type='button' onClick={handleDelete}>Eliminar</button>
        <button type="button" onClick={() => cambiarEstadoModal(!estadoModal)} >Listar</button>
      </form>
      <ListAdm estado={estadoModal} cambiarEstado={cambiarEstadoModal} />
    </div>
  );
};

export default AdminForm;
