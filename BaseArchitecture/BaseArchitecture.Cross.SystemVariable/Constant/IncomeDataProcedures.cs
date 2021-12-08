namespace BaseArchitecture.Cross.SystemVariable.Constant
{
    public static class IncomeDataProcedures
    {
        /// <summary>
        /// The names of the database schemas are established
        /// </summary>
        public static class Schema
        {
            public const string Demo = "Demo";
            public const string Core = "Core";
        }

        /// <summary>
        /// The names of the stored procedures will be set separated by type of action
        /// </summary>
        /// <example>
        ///     public const string Get{NameProcedure} = "USP_GET_{NameProcedure}";
        ///     public const string List{NameProcedure} = "USP_LIST_{NameProcedure}";
        /// </example>
        public static class Procedure
        {
            public const string GetPersonById = "USP_GET_PersonById";

            public const string ListMasterTable = "USP_LIST_MasterTable";
            public const string ListPersonAll = "USP_LIST_PersonAll";

            public const string RegPerson = "USP_REG_Person";

            public const string UpdPersonState = "USP_UPD_PersonState";

            
            public const string GetProyectoById = "USP_GET_ProyectoById";
            public const string ListProyectos = "USP_LIST_Proyectos";
            public const string ListProyectoCodigo = "USP_LIST_ProyectosCodigo";
            public const string ListProyectoByIdProyecto= "USP_LIST_ProyectosbyIdProyecto";
            public const string ListUbigeo = "USP_LIST_Ubigeo";
            public const string ListProgramacion = "USP_LIST_Programacion";
            public const string RegProgramacion = "USP_REG_Programacion";
            public const string UpdProyecto = "USP_UPD_Proyecto";
            public const string ListMaster = "USP_LIST_Master";
            public const string RegProyecto = "USP_REG_Proyecto";
            public const string RegInsumos = "USP_REG_Insumos";
            public const string ListProyectosInsumos = "USP_LIST_ProyectosInsumos";
            public const string RegCronograma = "USP_REG_Cronograma";
            public const string ListCronogramaById = "USP_GET_CronogramaByIdProyecto";
            public const string GetPersonByEmail = "USP_GET_PersonByEmail";
            public const string GetPersonByPerfil = "USP_GET_PersonByPerfil";
            public const string ListProyectosCronograma = "USP_LIST_ProyectosCronograma";
            public const string ListProyectosRpt = "USP_LIST_ProyectosRpt";
            public const string RptCantidadPoblacionPorDepartamento = "USP_RPT_CantidadPoblacionPorDepartamento";
            public const string RptCantidadProyectosPorCicloInversion = "USP_RPT_CantidadProyectosPorCicloInversion";
            public const string RptCantidadProyectosPorTipoProyecto = "USP_RPT_CantidadProyectosPorTipoProyecto";
            public const string RptCostoPorDepartamento = "USP_RPT_CostoPorDepartamento";
            public const string RptCostoPorTipoProyecto = "USP_RPT_CostoPorTipoProyecto";
        }
    }
}