package com.example.rentaautos.Controller;

import com.example.rentaautos.Entity.Auto;
import com.example.rentaautos.Entity.Sede;
import com.example.rentaautos.Entity.Seguro;

import java.util.ArrayList;
import java.util.List;

public class Controller {

    // Lista para almacenar los autos
    private List<Auto> listaAutos = new ArrayList<>();
    private int currentIdAutos = 1;

    //Lista para almacenar las sedes
    private List<Sede> listaSedes = new ArrayList<>();
    private int currentIdSedes = 1;

    //Lista para almacenar los seguros
    private List<Seguro> listaSeguros = new ArrayList<>();
    private int currentIdSeguros = 1;



}
