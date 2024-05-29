import React, { useEffect, useState } from 'react';
import '../../Styles/List.css'
import { LISTAR_ADMINISTRADORES_URL } from '../Apis/ApisAdministradores/Listar';
import axios from 'axios';
import '../../Styles/Tables.css'

const ListAdm = ({ estado, cambiarEstado }) => {
    const [administradoresList, setAdministradoresList] = useState([]);
    useEffect(() => {
        if (estado) {
            // Función para obtener la lista de administradores desde el backend
            const fetchAdministradoresList = async () => {
                try {
                    const response = await axios.get(LISTAR_ADMINISTRADORES_URL);
                    setAdministradoresList(response.data);
                } catch (error) {
                    console.error('Error fetching administrators list:', error);
                }
            };

            fetchAdministradoresList();
        }
    }, [estado]); // Ejecutar el efecto cuando el estado del modal cambie
    return (
        <>
            {estado &&
                <div className='overlay'>
                    <div className='modal'>
                        <div className='header_modal'><h2>Lista de Administradores</h2></div>
                        <button className='cerrar_modal' onClick={() => cambiarEstado(false)}>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-x-lg" viewBox="0 0 16 16">
                                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
                            </svg>
                        </button>
                        <div className="header_fixed">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Usuario</th>
                                        <th>Contraseña</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>DOI</th>
                                        <th>Correo</th>
                                        <th>Teléfono</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {administradoresList.map(administrador => (
                                        <tr key={administrador.id}>
                                            <td>{administrador.id}</td>
                                            <td>{administrador.usuario}</td>
                                            <td>{administrador.contrasenia}</td>
                                            <td>{administrador.nombres}</td>
                                            <td>{administrador.apellidos}</td>
                                            <td>{administrador.doi}</td>
                                            <td>{administrador.correo}</td>
                                            <td>{administrador.telefono}</td>
                                            <td>{administrador.estado ? 'Activo' : 'Inactivo'}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            }
        </>
    )
}

export default ListAdm
