import React, { useState } from 'react';
import {
    DashboardOutlined,
    MessageOutlined,
    UsergroupAddOutlined,
    CarOutlined,
    UserAddOutlined,
    TruckOutlined,
    FilePdfOutlined,
    MenuFoldOutlined,
    MenuUnfoldOutlined,
    SunOutlined,
    MoonOutlined,
    CodeSandboxOutlined,
    CrownOutlined,
    LogoutOutlined
} from "@ant-design/icons";
import { NavLink } from 'react-router-dom';


const Sidebar = ({ children }) => {

    const [isCollapsed, setIsCollapsed] = useState(false);
    const [isDarkTheme, setIsDarkTheme] = useState(true); // Estado para el tema oscuro/claro

    const toggleSidebar = () => {
        setIsCollapsed(!isCollapsed);
    }
    const toggleTheme = () => {
        const isDarkTheme = document.documentElement.classList.toggle('light-theme');
        setIsDarkTheme(!isDarkTheme);
        // Aplicar variables CSS según el tema seleccionado
        if (isDarkTheme) {
            document.documentElement.style.setProperty('--dark-background', '#210518');
            document.documentElement.style.setProperty('--dark-text-color', '#ffffe5');
            document.documentElement.style.setProperty('--dark-hover-color', '#d0f2e7');
            document.documentElement.style.setProperty('--dark-texth-color', '#17181f');
            document.documentElement.style.setProperty('--dark-scroll-background', '#f1f1f1');
            document.documentElement.style.setProperty('--dark-scroll-color', '#888');
            document.documentElement.style.setProperty('--dark-scroll-hover', '#555');
            // Ajusta las otras variables según el tema oscuro
        } else {
            document.documentElement.style.setProperty('--dark-background', '#bcebdf');
            document.documentElement.style.setProperty('--dark-text-color', '#210518');
            document.documentElement.style.setProperty('--dark-hover-color', '#210518');
            document.documentElement.style.setProperty('--dark-texth-color', '#d0f2e7');
            document.documentElement.style.setProperty('--dark-scroll-background', '#555');
            document.documentElement.style.setProperty('--dark-scroll-color', '#888');
            document.documentElement.style.setProperty('--dark-scroll-hover', '#f1f1f1');
            // Ajusta las otras variables según el tema claro
        }
    }


    const menuItem = [
        {
            path: "/",
            name: "Dashboard",
            icon: <DashboardOutlined />
        },
        {
            path: "/Administradores",
            name: "Administradores",
            icon: <CrownOutlined />
        },
        {
            path: "/Solicitudes",
            name: "Solicitudes",
            icon: <MessageOutlined />
        },
        {
            path: "/Clientes",
            name: "Clientes",
            icon: <UsergroupAddOutlined />
        },
        {
            path: "/Vehiculos",
            name: "Vehiculos",
            icon: <CarOutlined />
        },
        {
            path: "/Personal",
            name: "Personal",
            icon: <UserAddOutlined />
        },
        {
            path: "/Proveedores",
            name: "Proveedores",
            icon: <TruckOutlined />
        },
        {
            path: "/Productos",
            name: "Productos",
            icon: <CodeSandboxOutlined />
        },
        {
            path: "/Reportes",
            name: "Reportes",
            icon: <FilePdfOutlined />
        },
    ]
    return (
        <div className="sidebar-container">
            <div className={`sidebar ${isCollapsed ? 'collapsed' : ''}`}>
                <div className="toggle-icon" onClick={toggleSidebar}>
                    {isCollapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />}
                </div>
                {!isCollapsed && <span className="company-name">Gleam Wash</span>}
                <div className="toggle-icon" onClick={toggleTheme}>
                    {isDarkTheme ? <SunOutlined /> : <MoonOutlined />}
                </div>
                <ul className="sidebar-menu">
                    {menuItem.map((item, index) => (
                        <li key={index} className="sidebar-item">
                            <NavLink to={item.path} className="sidebar-link">
                                {item.icon}
                                {!isCollapsed && <span className="sidebar-link-text">{item.name}</span>}
                            </NavLink>
                        </li>
                    ))}
                </ul>
                <div className="logout-button-container">
                    <button className={`logout-button ${isCollapsed ? 'collapsed' : ''}`}>
                        {!isCollapsed && <span>Cerrar Session</span>}
                        <div className="toggle-icon">
                            <LogoutOutlined />
                        </div>
                    </button>
                </div>

            </div>
            <main className={`main-content ${isCollapsed ? 'collapsed' : ''}`}>
                {children}
            </main>
        </div>
    );
};

export default Sidebar;