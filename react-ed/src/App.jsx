import { useState } from 'react'
import './App.css'
import Sidebar from './components/Sidebar/Sidebar'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Dashboard from './pages/Dashboard'
import Solicitudes from './pages/Solicitudes'
import Clientes from './pages/Clientes'
import Vehiculos from './pages/Vehiculos'
import Personal from './pages/Personal'
import Proveedores from './pages/Proveedores'
import Productos from './pages/Productos'
import Reportes from './pages/Reportes'
import Administradores from './pages/Administradores'

function App() {
  return (
    <BrowserRouter>
      <Sidebar>
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/Administradores" element={<Administradores />} />
          <Route path="/Solicitudes" element={<Solicitudes />} />
          <Route path="/Clientes" element={<Clientes />} />
          <Route path="/Vehiculos" element={<Vehiculos />} />
          <Route path="/Personal" element={<Personal />} />
          <Route path="/Proveedores" element={<Proveedores />} />
          <Route path="/Productos" element={<Productos />} />
          <Route path="/Reportes" element={<Reportes />} />
          
        </Routes>
      </Sidebar>
    </BrowserRouter>
  )
}

export default App
