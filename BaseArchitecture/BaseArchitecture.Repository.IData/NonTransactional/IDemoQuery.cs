using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Application.TransferObject.Response.Common;
using BaseArchitecture.Application.TransferObject.Response.Demo;
using BaseArchitecture.Application.TransferObject.Response.Access;
using System.Collections.Generic;

namespace BaseArchitecture.Repository.IData.NonTransactional
{
    public interface IDemoQuery
    {
        IEnumerable<MasterTableResponse> ListMasterTable(MasterTableRequest masterTableRequest);
        Response<PersonResponse> GetPersonById(PersonBaseRequest personBaseRequest);
        IEnumerable<PersonResponse> ListPersonAll(PersonFilterRequest personFilterRequest);
        IEnumerable<ProyectoResponse> ListProyectos();
        IEnumerable<MasterResponse> ListMaster();
        IEnumerable<ProyectoResponse> ListProyectoCodigo();
        Response<UbigeoResponse> ListUBIGEO();
        IEnumerable<ProgramacionResponse> ListProgramacion();
        Response<int> RegProgramacion(ProgramacionRequest programacionRequest);
        Response<int> RegProyecto(ProyectoRequest proyectoRequest);
        Response<ProyectoResponse> GetProyectoById(ProyectoRequest proyectoRequest);
        Response<ProyectoResponse> GetListProyectoByIdProyecto(ProyectoRequest proyectoRequest);
        Response<OffLineInformeResponse> ListProyectoInforme();
        IEnumerable<CronogramaResponse> ListProyectoCronograma(); 
        Response<LoginResponse> ValidateUser(string email);
        IEnumerable<OptionResponse> ListMenu(UserRequest userEdit);
        Response<List<RptListProyectosResponse>> ListProyectosRpt();
        IEnumerable<RptCantidadPoblacionPorDepartamentoResponse> RptCantidadPoblacionPorDepartamento();
        IEnumerable<RptCantidadProyectosPorCicloInversionResponse> RptCantidadProyectosPorCicloInversion();
        IEnumerable<RptCantidadProyectosPorTipoProyectoResponse> RptCantidadProyectosPorTipoProyecto();
        IEnumerable<RptCostoPorDepartamentoResponse> RptCostoPorDepartamento();
        IEnumerable<RptCostoPorTipoProyectoResponse> RptCostoPorTipoProyecto();
        IEnumerable<PersonalResponse> ListPersonal();
    }
}