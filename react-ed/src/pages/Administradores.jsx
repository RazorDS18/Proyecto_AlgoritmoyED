import React, { useEffect, useState } from 'react';
import AdminForm from '../components/Formularios/AdminForm';
import { ToastContainer } from 'react-toastify';

export default function Administradores() {
  return (
    <>
      <ToastContainer />
      <AdminForm />
    </>

  );
}
