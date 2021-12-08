using BaseArchitecture.Application.TransferObject.Request.Base;
using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Application.TransferObject.Response.Common;
using BaseArchitecture.Application.TransferObject.Response.Demo;
using BaseArchitecture.Application.TransferObject.Response.Access;
using System.Collections.Generic;

namespace BaseArchitecture.Application.IService.Demo
{
    public interface IDemoService
    {
        MasterTableResponse GetMasterById(MasterTableRequest masterTableRequest);
        Response<IEnumerable<MasterTableResponse>> ListMasterTableByValue(MasterTableRequest masterTableRequest);
        Response<IEnumerable<MasterTableResponse>> ListMasterTable(MasterTableRequest masterTableRequest);
        Response<CollectionDataResponse<PersonResponse>> ListPersonAll(PersonFilterRequest personFilterRequest);
        Response<List<ProyectoResponse>> ListProyectos();
        Response<List<MasterResponse>> ListMaster();
        Response<List<ProyectoResponse>> ListProyectoCodigo();
        Response<UbigeoResponse> ListUBIGEO();
        Response<List<ProgramacionResponse>> ListProgramacion();
        Response<int> RegProgramacion(ProgramacionRequest programacionRequest);
        Response<int> RegProyecto(ProyectoRequest proyectoRequest);
        Response<ProyectoResponse> GetProyectoById(ProyectoRequest proyectoRequest);
        Response<ProyectoResponse> GetListProyectoByIdProyecto(ProyectoRequest proyectoRequest);
        Response<PersonResponse> GetPersonById(PersonBaseRequest personBaseRequest);
        Response<int> UpdPersonState(PersonBaseRequest personBaseRequest, BaseRecordRequest baseRecordRequest);
        Response<int> RegPerson(PersonRequest personRequest, BaseRecordRequest baseRecordRequest);
        Response<OffLineInformeResponse> ListProyectoInforme();
        Response<List<CronogramaResponse>> ListProyectoCronograma();
        Response<List<OptionResponse>> ListMenu(UserRequest userEdit);
        Response<byte[]> ListProyectosRpt();
        Response<List<RptCantidadPoblacionPorDepartamentoResponse>> RptCantidadPoblacionPorDepartamento();
        Response<List<RptCantidadProyectosPorCicloInversionResponse>> RptCantidadProyectosPorCicloInversion();
        Response<List<RptCantidadProyectosPorTipoProyectoResponse>> RptCantidadProyectosPorTipoProyecto();
        Response<List<RptCostoPorDepartamentoResponse>> RptCostoPorDepartamento();
        Response<List<RptCostoPorTipoProyectoResponse>> RptCostoPorTipoProyecto();
    }
}