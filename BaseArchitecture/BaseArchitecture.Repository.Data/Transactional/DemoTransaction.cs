using Dapper;
using BaseArchitecture.Application.TransferObject.Request.Base;
using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Application.TransferObject.Response.Common;
using BaseArchitecture.Cross.SystemVariable.Constant;
using BaseArchitecture.Repository.Entity.Demo;
using BaseArchitecture.Repository.IData.Transactional;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

namespace BaseArchitecture.Repository.Data.Transactional
{
    public class DemoTransaction : IDemoTransaction
    {
        public Response<int> RegPerson(PersonEntity personEntity, BaseRecordRequest baseRecordRequest)
        {
            Response<int> response;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdPerson", personEntity.IdPerson);
                parameters.Add("@ParamICodeAntamina", personEntity.CodeAntamina);
                parameters.Add("@ParamIIdMasterTableTypeDocument", personEntity.IdMasterTableTypeDocument);
                parameters.Add("@ParamIDocumentNumber", personEntity.DocumentNumber);
                parameters.Add("@ParamIFirstName", personEntity.FirstName);
                parameters.Add("@ParamILastFirstName", personEntity.LastFirstName);
                parameters.Add("@ParamILastSecondName", personEntity.LastSecondName);
                parameters.Add("@ParamIMonthlyIncome", personEntity.MonthlyIncome);
                parameters.Add("@ParamIEmail", personEntity.Email);
                parameters.Add("@ParamIBirthDay", personEntity.BirthDay);
                parameters.Add("@ParamIRecordStatus", baseRecordRequest.RecordStatus);
                parameters.Add("@ParamIUserRecordCreation", baseRecordRequest.UserRecord);
                parameters.Add("@ParamIRecordCreationDate", baseRecordRequest.RecordDate);

                var result = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Demo}.{IncomeDataProcedures.Procedure.RegPerson}",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                response = new Response<int>(result);
            }

            return response;
        }

        public Response<int> UpdPersonState(PersonBaseRequest personBaseRequest, BaseRecordRequest baseRecordRequest)
        {
            Response<int> response;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdPerson", personBaseRequest.IdPerson);
                parameters.Add("@ParamIRecordStatus", personBaseRequest.RecordStatus);
                parameters.Add("@ParamIUserEditRecord", baseRecordRequest.UserRecord);
                parameters.Add("@ParamIRecordEditDate", baseRecordRequest.RecordDate);

                var result = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Demo}.{IncomeDataProcedures.Procedure.UpdPersonState}",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                response = new Response<int>(result);
            }

            return response;
        }

        public Response<int> RegCronograma(ProyectoActividadesRequest proyectoActividadesRequest, int idProyecto)
        {
            Response<int> response;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@IdCronograma", proyectoActividadesRequest.IdCronograma);
                parameters.Add("@Idproyecto", idProyecto);
                parameters.Add("@Orden", proyectoActividadesRequest.Orden);
                parameters.Add("@Nombre", proyectoActividadesRequest.Nombre);
                parameters.Add("@FechaInicio", proyectoActividadesRequest.FechaInicio);
                parameters.Add("@FechaFin", proyectoActividadesRequest.FechaFin);
                parameters.Add("@Seguimiento", proyectoActividadesRequest.Seguimiento);
                parameters.Add("@Estado", proyectoActividadesRequest.Estado);

                var result = connection.QueryAsync<int>(
                    $"{IncomeDataProcedures.Schema.Core}.{IncomeDataProcedures.Procedure.RegCronograma}",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result;

                response = new Response<int>(result.FirstOrDefault());
            }

            return response;
        }
        public Response<int> RegPersonal(PersonalRequest personalRequest)
        {
            Response<int> response;
            using (var connection = new SqlConnection(AppSettingValue.ConnectionDataBase))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ParamIIdCoordinador", personalRequest.IdCoordinador);
                parameters.Add("@ParamINombre", personalRequest.Nombre);
                parameters.Add("@ParamIApellidoPaterno", personalRequest.ApellidoPaterno);
                parameters.Add("@ParamIApellidoMaterno", personalRequest.ApellidoMaterno);
                parameters.Add("@ParamICorreo", personalRequest.Correo);
                parameters.Add("@ParamITelefono", personalRequest.Telefono);
                parameters.Add("@ParamIEstado", personalRequest.Estado);
                parameters.Add("@ParamIIdZona", personalRequest.IdZona);
                parameters.Add("@ParamIAsignado", personalRequest.Asignado);
                parameters.Add("@ParamICargo", personalRequest.Cargo);

                var result = connection.Execute(
                    $"{IncomeDataProcedures.Schema.Cnfg}.{IncomeDataProcedures.Procedure.RegPersonal}",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                response = new Response<int>(result);
            }

            return response;
        }
    }
}