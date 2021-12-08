namespace BaseArchitecture.Cross.SystemVariable.Constant
{
    public static class IncomeWebApi
    {
        public static class PrefixApi
        {
            public const string Authentication = "api/Authentication";
            public const string Siscose = "api/Siscose"; 
            public const string Demo = "api/Demo";
            public const string Security = "api/Security";
        }

        public static class MethodApi
        {
            public static class Authentication
            {
                public const string Login = "Login";
                public const string Swagger = "Swagger";
            }

            public static class Security
            {
                public const string Access = "Access";
            }

            public static class Demo
            {
                public const string ListMasterTable = "ListMasterTable";
                public const string GetPersonById = "GetPersonById";
                public const string ListPersonAll = "ListPersonAll";
                public const string UpdPersonState = "UpdPersonState";
                public const string RegPerson = "RegPerson";
                public const string RegPersonal = "RegPersonal";
                public const string ListMasterTableByValue = "ListMasterTableByValue";
            }

            public static class Siscose
            {
                public const string ListProyectos = "ListProyectos";
                public const string ListPersonal = "ListPersonal";
                public const string GetProyectoById = "GetProyectoById";
                public const string GetListProyectoByIdProyecto = "GetListProyectoByIdProyecto";                
                public const string ListProyectoCodigo = "ListProyectoCodigo";
                public const string ListUBIGEO = "ListUBIGEO";
                public const string ListProgramacion = "ListProgramacion";
                public const string RegProgramacion = "RegProgramacion";
                public const string ListMaster = "ListMaster";
                public const string RegProyecto = "RegProyecto";
                public const string ListProyectoInforme = "ListProyectoInforme";
                public const string RegCronograma = "RegCronograma";
                public const string ListMenu = "ListMenu";
                public const string ListProyectoCronograma = "ListProyectoCronograma";
                public const string ListProyectosRpt = "ListProyectosRpt";
                public const string ListPersonalRpt = "ListPersonalRpt";
                
                public const string RptCantidadPoblacionPorDepartamento = "RptCantidadPoblacionPorDepartamento";
                public const string RptCantidadProyectosPorCicloInversion = "RptCantidadProyectosPorCicloInversion";
                public const string RptCantidadProyectosPorTipoProyecto = "RptCantidadProyectosPorTipoProyecto";
                public const string RptCostoPorDepartamento = "RptCostoPorDepartamento";
                public const string RptCostoPorTipoProyecto = "RptCostoPorTipoProyecto";
            }
        }

        public static class MethodAllowAnonymous
        {
            public const string SwaggerAllowAnonymous = MethodApi.Authentication.Swagger;

            public static readonly string LoginAllowAnonymous =
                $"/{PrefixApi.Authentication}/{MethodApi.Authentication.Login}";

            public static readonly string ListProyectosAllowAnonymous =
                $"/{PrefixApi.Siscose}/{MethodApi.Siscose.ListProyectos}";

            public static readonly string ListUbigeoAllowAnonymous =
                $"/{PrefixApi.Siscose}/{MethodApi.Siscose.ListUBIGEO}";
        }
    }
}