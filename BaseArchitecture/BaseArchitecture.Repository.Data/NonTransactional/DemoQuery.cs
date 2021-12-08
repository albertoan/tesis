using Dapper;
using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Application.TransferObject.Response.Common;
using BaseArchitecture.Application.TransferObject.Response.Demo;
using BaseArchitecture.Application.TransferObject.Response.Access;
using BaseArchitecture.Cross.SystemVariable.Constant;
using BaseArchitecture.Repository.IData.NonTransactional;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace BaseArchitecture.Repository.Data.NonTransactional
{
    public class DemoQuery : IDemoQuery
    {
        public IEnumerable<MasterTableResponse> ListMasterTable(MasterTableRequest masterTableRequest)
        {
            IEnumerable<MasterTableResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIRecordStatus", masterTableRequest.RecordStatus);

                var resultResponse = connection.QueryAsync<MasterTableResponse>(
                    $"{IncomeDataProcedures.Schema.Demo}.{IncomeDataProcedures.Procedure.ListMasterTable}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public Response<PersonResponse> GetPersonById(PersonBaseRequest personBaseRequest)
        {
            Response<PersonResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdPerson", personBaseRequest.IdPerson);

                var resultResponse = connection.QueryAsync<PersonResponse>(
                    $"{IncomeDataProcedures.Schema.Demo}.{IncomeDataProcedures.Procedure.GetPersonById}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result.FirstOrDefault();

                response = new Response<PersonResponse>()
                {
                    Value = resultResponse
                };
            }
            return response;
        }

        public Response<LoginResponse> ValidateUser(string email)
        {
            Response<LoginResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Email", email);

                var resultResponse = connection.QueryAsync<LoginResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.GetPersonByEmail}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result.FirstOrDefault();

                response = new Response<LoginResponse>()
                {
                    Value = resultResponse
                };
            }
            return response;
        }

        public Response<ProyectoResponse> GetProyectoById(ProyectoRequest proyectoRequest)
        {
            Response<ProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@IdProyecto", proyectoRequest.IdProyecto);

                var resultResponse = connection.QueryAsync<ProyectoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.GetProyectoById}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result.FirstOrDefault();


                var basicResponse = new ProyectoResponse();
                using (var list = connection.QueryMultipleAsync(
                    sql: $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListCronogramaById}",
                    param: parameters,
                    commandType: CommandType.StoredProcedure).Result)
                {
                    basicResponse.ProyectoActividadesResponse = list.Read<ProyectoActividadesResponse>().ToList();
                }
        

                response = new Response<ProyectoResponse>()
                {
                    Value = resultResponse
                };

                response.Value.ProyectoActividadesResponse = basicResponse.ProyectoActividadesResponse;
            }
            return response;
        }


        public Response<ProyectoResponse> GetListProyectoByIdProyecto(ProyectoRequest proyectoRequest)
        {
            Response<ProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdProyecto", proyectoRequest.IdProyecto);


                var basicResponse = new ProyectoResponse();
                using (var list = connection.QueryMultipleAsync(
                    sql: $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectoByIdProyecto}",
                    param: parameters,
                    commandType: CommandType.StoredProcedure).Result)
                {
                    basicResponse = list.Read<ProyectoResponse>().ToList().FirstOrDefault();
                    basicResponse.ListInsumosResponse = list.Read<InsumosResponse>().ToList();
                    basicResponse.ListCronogramaResponse = list.Read<CronogramaResponse>().ToList();
                }


                response = new Response<ProyectoResponse>()
                {
                    Value = basicResponse
                };

                
            }
            return response;
        }


        public IEnumerable<PersonResponse> ListPersonAll(PersonFilterRequest personFilterRequest)
        {
            IEnumerable<PersonResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdMasterTableTypeDocument", personFilterRequest.IdMasterTableTypeDocument);
                parameters.Add("@ParamIStartDate", personFilterRequest.StartDate);
                parameters.Add("@ParamIEndDate", personFilterRequest.EndDate);
                parameters.Add("@ParamIRecordStatus", personFilterRequest.RecordStatus);

                var resultResponse = connection.QueryAsync<PersonResponse>(
                    $"{IncomeDataProcedures.Schema.Demo}.{IncomeDataProcedures.Procedure.ListPersonAll}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public IEnumerable<ProyectoResponse> ListProyectos()
        {
            IEnumerable<ProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var resultResponse = connection.QueryAsync<ProyectoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectos}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public IEnumerable<MasterResponse> ListMaster()
        {
            IEnumerable<MasterResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var resultResponse = connection.QueryAsync<MasterResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListMaster}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public IEnumerable<ProyectoResponse> ListProyectoCodigo()
        {
            IEnumerable<ProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var resultResponse = connection.QueryAsync<ProyectoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectoCodigo}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public Response<UbigeoResponse> ListUBIGEO()
        {
            Response<UbigeoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var basicResponse = new UbigeoResponse();
                using (var list = connection.QueryMultipleAsync(
                    sql: $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListUbigeo}",
                    param: parameters,
                    commandType: CommandType.StoredProcedure).Result)
                {
                    basicResponse.ListDepartamentoResponse = list.Read<DepartamentoResponse>().ToList();
                    basicResponse.ListProvinciaResponse = list.Read<ProvinciaResponse>().ToList();
                    basicResponse.ListDistritoResponse = list.Read<DistritoResponse>().ToList();
                    basicResponse.ListProyectoResponse = list.Read<ProyectoResponse>().ToList();
                    basicResponse.ListPersonalResponse = list.Read<PersonalResponse>().ToList();
                    basicResponse.ListZonasResponse = list.Read<ZonasResponse>().ToList();
                    basicResponse.ListMasterResponse = list.Read<MasterResponse>().ToList();
                }
                response = new Response<UbigeoResponse>
                {
                    Value = basicResponse
                };
            }
            return response;
        }

        public IEnumerable<ProgramacionResponse> ListProgramacion()
        {
            IEnumerable<ProgramacionResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var resultResponse = connection.QueryAsync<ProgramacionResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProgramacion}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }

        public Response<int> RegProgramacion(ProgramacionRequest programacionRequest)
        {
            Response<int> response;
            var resultUpdate = 0;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@IdProyecto", programacionRequest.IdProyecto);
                parameters.Add("@IdCoordinador", programacionRequest.IdCoordinador);
                parameters.Add("@FechaRegistro", programacionRequest.FechaRegistro);
                parameters.Add("@FechaInicio", programacionRequest.FechaInicio);
                parameters.Add("@FechaFin", programacionRequest.FechaFin);
                parameters.Add("@Estado", programacionRequest.Estado);
                var result = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RegProgramacion}",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                if (result > 0) {
                    var parametersUpdate = new DynamicParameters();
                    parametersUpdate.Add("@IdProyecto", programacionRequest.IdProyecto);
                    parametersUpdate.Add("@IdCoordinador", programacionRequest.IdCoordinador);
                    resultUpdate = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.UpdProyecto}",
                    parametersUpdate,
                    commandType: CommandType.StoredProcedure);
                }
                response = new Response<int>(resultUpdate);
            }
            return response;
        }

        public Response<int> RegProyecto(ProyectoRequest proyectoRequest)
        {
            Response<int> response;
            var resultUpdate = 0;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@IdProyecto", proyectoRequest.IdProyecto);
                parameters.Add("@Codigo", proyectoRequest.Codigo);
                parameters.Add("@Nombre", proyectoRequest.Nombre);
                parameters.Add("@Transferencia", proyectoRequest.Transferencia);
                parameters.Add("@IdModalidad", proyectoRequest.IdModalidad);
                parameters.Add("@IdTipoInversion", proyectoRequest.IdTipoInversion);
                parameters.Add("@IdCicloInversion", proyectoRequest.IdCicloInversion);
                parameters.Add("@IdNaturaleza", proyectoRequest.IdNaturaleza);
                parameters.Add("@IdDepartamento", proyectoRequest.IdDepartamento);
                parameters.Add("@IdProvincia", proyectoRequest.IdProvincia);
                parameters.Add("@IdDistrito", proyectoRequest.IdDistrito);
                parameters.Add("@Programa", proyectoRequest.Programa);
                parameters.Add("@Costo", proyectoRequest.Costo);
                parameters.Add("@Estado", proyectoRequest.Estado);
                parameters.Add("@IdZona", proyectoRequest.IdZona);
                parameters.Add("@Asignado", proyectoRequest.Asignado);
                parameters.Add("@IdTipoProyecto", proyectoRequest.IdTipoProyecto);
                parameters.Add("@FechaDesde", proyectoRequest.FechaDesde);
                parameters.Add("@FechaHasta", proyectoRequest.FechaHasta);

                var result = connection.QueryAsync<int>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RegProyecto}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = new Response<int>(result.FirstOrDefault());

                if (response != null)
                {
                    var parametersUpdate = new DynamicParameters();
                    parametersUpdate.Add("@IdInsumoObra", proyectoRequest.Insumos.IdInsumoObra);
                    parametersUpdate.Add("@IdProyecto", response.Value);
                    parametersUpdate.Add("@MaderaTipoA", proyectoRequest.Insumos.MaderaTipoA);
                    parametersUpdate.Add("@MaderaTipoB", proyectoRequest.Insumos.MaderaTipoB);
                    parametersUpdate.Add("@Concreto", proyectoRequest.Insumos.Concreto);
                    parametersUpdate.Add("@Aluminio", proyectoRequest.Insumos.Aluminio);
                    parametersUpdate.Add("@PIN3", proyectoRequest.Insumos.PIN3);
                    parametersUpdate.Add("@PIN4", proyectoRequest.Insumos.PIN4);
                    parametersUpdate.Add("@Suspencion", proyectoRequest.Insumos.Suspencion);
                    parametersUpdate.Add("@PAT1", proyectoRequest.Insumos.PAT1);
                    parametersUpdate.Add("@PAT2", proyectoRequest.Insumos.PAT2);
                    parametersUpdate.Add("@Pernos", proyectoRequest.Insumos.Pernos);
                    parametersUpdate.Add("@Abrazaderas", proyectoRequest.Insumos.Abrazaderas);
                    parametersUpdate.Add("@Aisladores", proyectoRequest.Insumos.Aisladores);
                    parametersUpdate.Add("@Monofasicos", proyectoRequest.Insumos.Monofasicos);
                    parametersUpdate.Add("@Bifasicos", proyectoRequest.Insumos.Bifasicos);
                    parametersUpdate.Add("@Trifasicos", proyectoRequest.Insumos.Trifasicos);
                    parametersUpdate.Add("@Transformadores", proyectoRequest.Insumos.Transformadores);
                    parametersUpdate.Add("@Interruptores", proyectoRequest.Insumos.Interruptores);
                    parametersUpdate.Add("@Contactores", proyectoRequest.Insumos.Contactores);
                    parametersUpdate.Add("@Medidores", proyectoRequest.Insumos.Medidores);
                    parametersUpdate.Add("@Fusibles", proyectoRequest.Insumos.Fusibles);
                    parametersUpdate.Add("@Pararrayos", proyectoRequest.Insumos.Pararrayos);
                    parametersUpdate.Add("@Lotes", proyectoRequest.Insumos.Lotes);
                    parametersUpdate.Add("@MaderaSecundarioTipoA", proyectoRequest.Insumos.MaderaSecundarioTipoA);
                    parametersUpdate.Add("@ConcretoSecundarioTipoA", proyectoRequest.Insumos.ConcretoSecundarioTipoA);
                    parametersUpdate.Add("@ConcretoSecundarioTipoB", proyectoRequest.Insumos.ConcretoSecundarioTipoB);
                    parametersUpdate.Add("@AluminioSecundario", proyectoRequest.Insumos.AluminioSecundario);
                    parametersUpdate.Add("@Alumbrado", proyectoRequest.Insumos.Alumbrado);
                    parametersUpdate.Add("@Retenidas", proyectoRequest.Insumos.Retenidas);
                    parametersUpdate.Add("@PuestaTierra", proyectoRequest.Insumos.PuestaTierra);
                    parametersUpdate.Add("@GrapaSuspencion", proyectoRequest.Insumos.GrapaSuspencion);
                    parametersUpdate.Add("@GrapaAnclaje", proyectoRequest.Insumos.GrapaAnclaje);
                    parametersUpdate.Add("@PernosSecundarios", proyectoRequest.Insumos.PernosSecundarios);
                    parametersUpdate.Add("@Conexiones", proyectoRequest.Insumos.Conexiones);
                    parametersUpdate.Add("@PanelesSolares", proyectoRequest.Insumos.PanelesSolares);
                    parametersUpdate.Add("@Celdas", proyectoRequest.Insumos.Celdas);
                    parametersUpdate.Add("@Inversor", proyectoRequest.Insumos.Inversor);
                    parametersUpdate.Add("@Soporte", proyectoRequest.Insumos.Soporte);
                    parametersUpdate.Add("@Estructura", proyectoRequest.Insumos.Estructura);
                    parametersUpdate.Add("@Cableado", proyectoRequest.Insumos.Cableado);
                    parametersUpdate.Add("@TipoRegistro", proyectoRequest.Insumos.TipoRegistro);
                    parametersUpdate.Add("@TipoObra", proyectoRequest.Insumos.TipoObra);
                    resultUpdate = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RegInsumos}",
                    parametersUpdate,
                    commandType: CommandType.StoredProcedure);
                }
            }
            return response;
        }

        public Response<OffLineInformeResponse> ListProyectoInforme()
        {
            Response<OffLineInformeResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var basicResponse = new OffLineInformeResponse();
                using (var list = connection.QueryMultipleAsync(
                    sql: $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectosInsumos}",
                    param: parameters,
                    commandType: CommandType.StoredProcedure).Result)
                {
                    basicResponse.ListInformeInsumos = list.Read<InsumosResponse>().ToList();
                    basicResponse.ListInformeCronograma = list.Read<ProyectoActividadesResponse>().ToList();
                }
                response = new Response<OffLineInformeResponse>
                {
                    Value = basicResponse
                };
            }
            return response;
        }

        public IEnumerable<CronogramaResponse> ListProyectoCronograma()
        {
            IEnumerable<CronogramaResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();

                var resultResponse = connection.QueryAsync<CronogramaResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectosCronograma}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        

        public IEnumerable<OptionResponse> ListMenu(UserRequest userEdit)
        {
            IEnumerable<OptionResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Descripcion", userEdit.UserEdit);

                var resultResponse = connection.QueryAsync<OptionResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.GetPersonByPerfil}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        public Response<List<RptListProyectosResponse>> ListProyectosRpt()
        {
            Response<List<RptListProyectosResponse>> response;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var basicResponse = new List<RptListProyectosResponse>();
                using (var list = connection.QueryMultipleAsync(
                    sql: $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.ListProyectosRpt}",
                    param: parameters,
                    commandType: CommandType.StoredProcedure).Result)
                {
                    basicResponse = list.Read<RptListProyectosResponse>().ToList();
                }

                response = new Response<List<RptListProyectosResponse>>
                {
                    Value = basicResponse
                };

            }
            return response;
        }
        public IEnumerable<RptCantidadPoblacionPorDepartamentoResponse> RptCantidadPoblacionPorDepartamento()
        {
            IEnumerable<RptCantidadPoblacionPorDepartamentoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var resultResponse = connection.QueryAsync<RptCantidadPoblacionPorDepartamentoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RptCantidadPoblacionPorDepartamento}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        public IEnumerable<RptCantidadProyectosPorCicloInversionResponse> RptCantidadProyectosPorCicloInversion()
        {
            IEnumerable<RptCantidadProyectosPorCicloInversionResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var resultResponse = connection.QueryAsync<RptCantidadProyectosPorCicloInversionResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RptCantidadProyectosPorCicloInversion}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        public IEnumerable<RptCantidadProyectosPorTipoProyectoResponse> RptCantidadProyectosPorTipoProyecto()
        {
            IEnumerable<RptCantidadProyectosPorTipoProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var resultResponse = connection.QueryAsync<RptCantidadProyectosPorTipoProyectoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RptCantidadProyectosPorTipoProyecto}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        public IEnumerable<RptCostoPorDepartamentoResponse> RptCostoPorDepartamento()
        {
            IEnumerable<RptCostoPorDepartamentoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var resultResponse = connection.QueryAsync<RptCostoPorDepartamentoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RptCostoPorDepartamento}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
        public IEnumerable<RptCostoPorTipoProyectoResponse> RptCostoPorTipoProyecto()
        {
            IEnumerable<RptCostoPorTipoProyectoResponse> response;

            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                var resultResponse = connection.QueryAsync<RptCostoPorTipoProyectoResponse>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RptCostoPorTipoProyecto}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = resultResponse;
            }
            return response;
        }
    }
}